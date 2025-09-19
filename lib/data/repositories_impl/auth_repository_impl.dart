import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/mock_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<User?> login(String email, String password) async {
    // Giả lập API delay
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final user = MockDataSource.users.firstWhere(
        (u) => u.email == email && u.password == password,
      );
      return User(email: user.email, password: user.password);
    } catch (e) {
      return null;
    }
  }
}