import 'package:e_commerce/domain/entities/user.dart';
import 'package:e_commerce/domain/repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository authRepository;

  SignUpUseCase(this.authRepository);

  Future<User> call(String email, String password, String name) async {
    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      throw Exception('All fields are required');
    }
    if (password.length < 8) {
      throw Exception('Password must be at least 8 characters');
    }
    return await authRepository.signUp(email, password, name);
  }
}
