class UserModel {
  final String? name;
  final String? username;
  final bool? isVerify;
  final String? email;
  final String? token;

  UserModel({
    this.name,
    this.username,
    this.isVerify,
    this.email,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      username: json['username'],
      isVerify: json['is_verfy'], // Mapping from is_verfy as requested
      email: json['email'],
      token: json['token'],
    );
  }
}
