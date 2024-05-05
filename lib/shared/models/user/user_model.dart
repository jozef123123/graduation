class User_Model {
  String? name;
  String? id; // You can use either int or String, depending on your use case
  String? password;
   List<String>? favorites;
  String? email;
  String? image;
  String? phone;

  // Constructor
  User_Model({

    required this.id,
    required this.phone,
    required this.password,
    required this.image,
    required this.email,
    required this.favorites,
    required this.name,
  });

  // Factory method to create a User object from a JSON map
  factory User_Model.fromJson(Map<String, dynamic> json) {
    return User_Model(

      image: json['image'],
      id: json['id'],
      phone: json['phone'],
      name: json['name'],
      password: json['password'],
      email: json['email'],
      favorites: List<String>.from(json['favorites'] as List<dynamic>),
    );
  }

  // Method to convert a User object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'name': name,
      'favorites': favorites,
      'id': id,
      'image': image,
      'password': password,
      'email': email,
    };
  }
}
