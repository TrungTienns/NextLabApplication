import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<User?> execute(String email, String password) async {
    if (email.isEmpty && password.isEmpty) {
      throw Exception("Email and password must not be empty");
    } else if (email.isEmpty) {
      throw Exception("Email must not be empty");
    } else if (password.isEmpty) {
      throw Exception("Password must not be empty");
    }

    return await repository.login(email, password);
  }
}