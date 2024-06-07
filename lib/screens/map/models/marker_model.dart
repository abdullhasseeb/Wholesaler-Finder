import 'package:cloud_firestore/cloud_firestore.dart';

class MarkerModel {
  final String? id; // Added id variable
  final String category;
  final String description;
  final GeoPoint location;
  final String title;
  final String placeId;

  MarkerModel({
    this.id,
    required this.category,
    required this.description,
    required this.location,
    required this.title,
    required this.placeId,
  });

  factory MarkerModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return MarkerModel(
      id: doc.id, // Assign id from DocumentSnapshot
      category: data['category'] ?? '',
      description: data['description'] ?? '',
      location: data['location'] ?? const GeoPoint(0.0, 0.0),
      title: data['title'] ?? '',
      placeId: data['placeId'] ?? '',
    );
  }

  /// Empty Model
  factory MarkerModel.empty(){
    return MarkerModel(category: '', description: '', location: const GeoPoint(0, 0), title: '', placeId: '');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id, // Include id in the JSON data
      'category': category,
      'description': description,
      'location': location,
      'title': title,
      'placeId': placeId,
    };
    return data;
  }
}
