import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently2/ui/model/user_dm.dart';
import 'package:evently2/ui/model/event_dm.dart';
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
  CollectionReference collection = FirebaseFirestore.instance.collection("events");
  var documentRef = collection.doc();
  event.id = documentRef.id;
  await documentRef.set(event.toJson());
}

Stream<List<EventDM>> getEventsFromFirestore(){
  CollectionReference collection = FirebaseFirestore.instance.collection("events");
  Stream<QuerySnapshot> stream = collection.snapshots();
  return stream.map((querySnapshot){
    return querySnapshot.docs.map((doc){
      var json = doc.data() as Map<String, dynamic>;
      json["id"] = doc.id;
      return EventDM.fromJson(json);
    }).toList();
  });
}

// ========== هذه هي الدالة الناقصة فقط ==========
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
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

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