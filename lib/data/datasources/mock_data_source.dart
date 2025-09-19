import '../models/contact_model.dart';
import '../models/user_model.dart';

class MockDataSource {
  static final List<UserModel> users = [
    UserModel(email: "admin@test.com", password: "123456"),
    UserModel(email: "user@test.com", password: "111111"),
  ];
  static final List<ContactModel> contacts = [
    ContactModel(name: "Alice", phone: "0123456789"),
    ContactModel(name: "Bob", phone: "0987654321"),
    ContactModel(name: "Charlie", phone: "0911222333"),
  ];
}