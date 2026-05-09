import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:e_commerce/domain/entities/user.dart';
import 'package:e_commerce/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User?> getCurrentUser() async {
    final firebaseUser = _firebaseAuth.currentUser;
    if (firebaseUser == null) return null;
    return User(
      id: firebaseUser.uid,
      email: firebaseUser.email!,
      name: firebaseUser.displayName ?? '',
      isEmailVerified: firebaseUser.emailVerified,
    );
  }

  @override
  Future<User> signIn(String email, String password) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return User(
      id: result.user!.uid,
      email: result.user!.email!,
      name: result.user!.displayName ?? '',
      isEmailVerified: result.user!.emailVerified,
    );
  }

  @override
  Future<User> signUp(String email, String password, String name) async {
    final result = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await result.user!.updateDisplayName(name);
    return User(
      id: result.user!.uid,
      email: result.user!.email!,
      name: name,
      isEmailVerified: result.user!.emailVerified,
    );
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> resetPassword(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> updateProfile(User user) async {
    await _firebaseAuth.currentUser!.updateDisplayName(user.name);
    // Update other fields as needed
  }

  @override
  Stream<User?> authStateChanges() {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      if (firebaseUser == null) return null;
      return User(
        id: firebaseUser.uid,
        email: firebaseUser.email!,
        name: firebaseUser.displayName ?? '',
        isEmailVerified: firebaseUser.emailVerified,
      );
    });
  }
}
