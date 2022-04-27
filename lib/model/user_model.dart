class UserModel {
  final String name;
  final String image;
  final String phone;
  final String email;
  final String uId;

  UserModel(
      {required this.image,
      required this.email,
      required this.uId,
      required this.name,
      required this.phone});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      image: json['image'],
      email: json['email'],
      name: json['name'],
      uId: json['uId'],
      phone: json['phone'],
    );
  }

  Map<String,dynamic> toMap()
  {
    return {
      'email':email,
      'image':image,
      'uId':uId,
      'phone':phone,
      'name':name,
    };
  }
}
