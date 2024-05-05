class Artifact_Model {
  String? id;
  String? title_ar;
  String? title_en;

  String? description_ar;
  String? description_en;
  String? image;

  // Constructor
  Artifact_Model({
    required this.title_ar,
    required this.title_en,
    required this.id,
    required this.description_en,
    required this.description_ar,
    required this.image,
  });

  // Factory method to create a User object from a JSON map
  factory Artifact_Model.fromJson(Map<String, dynamic> json) {
    return Artifact_Model(
      title_ar: json['title_ar'],
      title_en: json['title_en'],
      id: json['id'],
      description_en: json['description_en'],
      description_ar: json['description_ar'],
      image: json['image'],
    );
  }

  // Method to convert a User object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'title_ar': title_ar,
      'title_en': title_en,
      'id': id,
      'description_en': description_en,
      'description_ar': description_ar,
      'image': image,
    };
  }
}
