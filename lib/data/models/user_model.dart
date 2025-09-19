import '../../domain/entities/user.dart';

class UserModel {
  final String email;
  final String password;

  UserModel({required this.email, required this.password});

  // JSON -> Model
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }

  // Model -> JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  // Model -> Entity
  User toEntity() {
    return User(email: email, password: password);
  }

  // Entity -> Model
  factory UserModel.fromEntity(User user) {
    return UserModel(
      email: user.email,
      password: user.password,
    );
  }
}