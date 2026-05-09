import 'package:e_commerce/domain/entities/user.dart';
import 'package:e_commerce/domain/repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository authRepository;

  SignInUseCase(this.authRepository);

  Future<User> call(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      throw Exception('Email and password are required');
    }
    return await authRepository.signIn(email, password);
  }
}
