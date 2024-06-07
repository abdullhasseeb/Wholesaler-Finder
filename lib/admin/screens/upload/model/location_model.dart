import 'package:cloud_firestore/cloud_firestore.dart';

class LocationModel {
  String? category;
  String? description;
  GeoPoint? location;
  String? title;
  String? placeId; // New parameter

  LocationModel({
    this.category,
    this.description,
    this.location,
    this.title,
    this.placeId, // Updated constructor
  });

  factory LocationModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return LocationModel(
      category: data['category'] ?? '',
      description: data['description'] ?? '',
      location: data['location'] ?? const GeoPoint(0.0, 0.0),
      title: data['title'] ?? '',
      placeId: data['placeId'] ?? '', // Initialize placeId from FireStore data
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'category': category,
      'description': description,
      'location': location,
      'title': title,
      'placeId': placeId, // Include placeId in the JSON data
    };
    return data;
  }
}
