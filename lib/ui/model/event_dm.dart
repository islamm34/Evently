import 'package:cloud_firestore/cloud_firestore.dart' show Timestamp;
import 'package:flutter/cupertino.dart';

class EventDM {
  String id;
  String ownerId;
  CategoryDM categoryDM;
  DateTime dateTime;
  String title;
  String description;
  bool isFavorite;

  EventDM({
    required this.id,
    required this.ownerId,
    required this.categoryDM,
    required this.dateTime,
    required this.title,
    required this.description,
    required this.isFavorite,
    required CategoryDM,
  });

  static EventDM fromJson(Map<String, dynamic> json) {
    try {
      Timestamp timeStamp = json["dateTime"];

      Map<String, dynamic> categoryJson =
          json["category"] as Map<String, dynamic>;

      return EventDM(
        id: json["id"] ?? "",
        ownerId: json["ownerId"] ?? "",
        categoryDM: CategoryDM.fromJson(categoryJson),
        dateTime: timeStamp.toDate(),
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        isFavorite: json["isFavorite"] ?? false,
        CategoryDM: null,
      );
    } catch (e) {
      print("Error in EventDM.fromJson: $e");
      print("JSON data: $json");
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "ownerId": ownerId,
      "category": categoryDM.toJson(),
      "title": title,
      "description": description,
      "dateTime": dateTime,
      "isFavorite": isFavorite,
    };
  }
}

class CategoryDM {
  String name;
  String imagePath;
  IconData icon;

  CategoryDM({required this.name, required this.imagePath, required this.icon});

  static CategoryDM fromJson(Map<String, dynamic> json) {
    try {
      int codePoint = json["icon"] as int;
      return CategoryDM(
        name: json["name"] ?? "",
        imagePath: json["imagePath"] ?? "",
        icon: IconData(codePoint, fontFamily: 'MaterialIcons'),
      );
    } catch (e) {
      print("Error in CategoryDM.fromJson: $e");
      print("JSON data: $json");
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "imagePath": imagePath, "icon": icon.codePoint};
  }
}
