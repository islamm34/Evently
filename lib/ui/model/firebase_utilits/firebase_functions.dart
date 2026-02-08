import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently2/ui/model/event_dm.dart';
import 'package:evently2/ui/model/user_dm.dart';
import 'package:firebase_auth/firebase_auth.dart';
Future<void> createUserInFirestore(UserDM user) async {
  var userCollection = FirebaseFirestore.instance.collection("users");
  var emptyDoc = userCollection.doc(user.id);
  await emptyDoc.set(user.toJson());
}
Future<UserDM> getUserFromFirestore(String uid) async {
  var userCollection = FirebaseFirestore.instance.collection("users");
  DocumentSnapshot snapshot = await userCollection.doc(uid).get();
  Map<String, dynamic> json = snapshot.data() as Map<String, dynamic>;
  return UserDM.fromJson(json);
}
createEventInFirestore(EventDM event) async {
  CollectionReference collection = FirebaseFirestore.instance.collection(
    "events",
  );
  var documentRef = collection.doc();
  event.id = documentRef.id;
  await documentRef.set(event.toJson());
}
Stream<List<EventDM>> getEventsFromFirestore() {
  CollectionReference collection = FirebaseFirestore.instance.collection(
    "events",
  );
  Stream<QuerySnapshot> stream = collection.snapshots();
  return stream.map((querySnapshot) {
    return querySnapshot.docs.map((doc) {
      var json = doc.data() as Map<String, dynamic>;
      json["id"] = doc.id;
      return EventDM.fromJson(json);
    }).toList();
  });
}
Future<void> createUserWithEmailAndPassword({
  required String email,
  required String password,
  required String name,
  required String address,
  required String phoneNumber,
  required Function(UserDM) onSuccess,
  required Function(String) onError,
}) async {
  try {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    UserDM user = UserDM(
      id: credential.user!.uid,
      name: name,
      email: email,
      address: address,
      phoneNumber: phoneNumber,
    );

    await createUserInFirestore(user);
    onSuccess(user);
  } on FirebaseAuthException catch (e) {
    var message = "";
    if (e.code == 'weak-password') {
      message = "The password provided is too weak.";
    } else if (e.code == 'email-already-in-use') {
      message = "The account already exists for that email.";
    } else {
      message = e.message ?? "An error occurred";
    }
    onError(message);
  } catch (e) {
    onError("An error occurred: $e");
  }
}

addEventToFavorite(String eventId, UserDM user) async {
  try {
    CollectionReference eventsCollection = FirebaseFirestore.instance
        .collection("events");
    var eventDoc = eventsCollection.doc(eventId);

    CollectionReference usersCollection = FirebaseFirestore.instance.collection(
      "users",
    );
    var userDoc = usersCollection.doc(user.id);
    DocumentSnapshot eventSnapshot = await eventDoc.get();
    if (eventSnapshot.exists) {
      Map<String, dynamic> eventData =
          eventSnapshot.data() as Map<String, dynamic>;
      List<String> favoritedBy = List<String>.from(
        eventData['favoritedBy'] ?? [],
      );

      if (!favoritedBy.contains(user.id)) {
        favoritedBy.add(user.id);
        await eventDoc.update({"favoritedBy": favoritedBy});
      }
    }
    DocumentSnapshot userSnapshot = await userDoc.get();
    if (userSnapshot.exists) {
      Map<String, dynamic> userData =
          userSnapshot.data() as Map<String, dynamic>;
      List<String> favoriteEvents = List<String>.from(
        userData['favorites'] ?? [],
      );
      if (!favoriteEvents.contains(eventId)) {
        favoriteEvents.add(eventId);
        await userDoc.update({"favorites": favoriteEvents});
        if (!user.favoriteEvents.contains(eventId)) {
          user.favoriteEvents.add(eventId);
        }
      }
    }

    print("Added event $eventId to favorites");
  } catch (e) {
    print("Error adding to favorites: $e");
    throw e;
  }
}

removeEventFromFavorite(String eventId, UserDM user) async {
  try {
    print("Removing event $eventId from favorites for user ${user.id}");

    CollectionReference eventsCollection = FirebaseFirestore.instance
        .collection("events");
    var eventDoc = eventsCollection.doc(eventId);

    CollectionReference usersCollection = FirebaseFirestore.instance.collection(
      "users",
    );
    var userDoc = usersCollection.doc(user.id);
    DocumentSnapshot eventSnapshot = await eventDoc.get();
    if (eventSnapshot.exists) {
      Map<String, dynamic> eventData =
          eventSnapshot.data() as Map<String, dynamic>;
      List<String> favoritedBy = List<String>.from(
        eventData['favoritedBy'] ?? [],
      );

      if (favoritedBy.contains(user.id)) {
        favoritedBy.remove(user.id);
        await eventDoc.update({"favoritedBy": favoritedBy});
        print("Removed user ${user.id} from event's favoritedBy list");
      }
    }
    DocumentSnapshot userSnapshot = await userDoc.get();
    if (userSnapshot.exists) {
      Map<String, dynamic> userData =
          userSnapshot.data() as Map<String, dynamic>;
      List<String> favoriteEvents = List<String>.from(
        userData['favorites'] ?? [],
      );

      if (favoriteEvents.contains(eventId)) {
        favoriteEvents.remove(eventId);
        await userDoc.update({"favorites": favoriteEvents});
        print("Removed event $eventId from user's favorites list");
      }
    }
    if (user.favoriteEvents.contains(eventId)) {
      user.favoriteEvents.remove(eventId);
    }
  } catch (e) {
    print("Error removing from favorites: $e");
    throw e;
  }
}

Future<List<EventDM>> getFavoriteEventsForUser(String id) async {
  try {
    if (UserDM.currentUser == null) return [];

    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(UserDM.currentUser!.id)
        .get();

    if (!userSnapshot.exists) return [];

    Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;
    List<String> favoriteEvents = List<String>.from(userData['favorites'] ?? []);

    UserDM.currentUser!.favoriteEvents = favoriteEvents;

    if(favoriteEvents.isEmpty) return [];

    CollectionReference eventsCollection = FirebaseFirestore.instance.collection("events");

    QuerySnapshot querySnapshot = await eventsCollection
        .where(FieldPath.documentId, whereIn: favoriteEvents)
        .get();
    return querySnapshot.docs.map((doc) {
      var json = doc.data() as Map<String, dynamic>;
      json["id"] = doc.id;
      return EventDM.fromJson(json);
    }).toList();
  } catch (e) {
    print("Error getting favorite events: $e");
    return [];
  }
}