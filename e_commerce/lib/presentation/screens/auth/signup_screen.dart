import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:e_commerce/core/di.dart';
import 'package:e_commerce/core/utils.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _isLoading ? null : _signup,
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Sign Up'),
            ),
            TextButton(
              onPressed: () => context.go('/login'),
              child: const Text('Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signup() async {
    if (_nameController.text.isEmpty) {
      AppUtils.showSnackBar(context, 'Name is required', isError: true);
      return;
    }

    if (!AppUtils.isValidEmail(_emailController.text)) {
      AppUtils.showSnackBar(context, 'Invalid email', isError: true);
      return;
    }

    if (!AppUtils.isValidPassword(_passwordController.text)) {
      AppUtils.showSnackBar(context, 'Password must be at least 8 characters', isError: true);
      return;
    }

    setState(() => _isLoading = true);

    try {
      await ref.read(signUpUseCaseProvider).call(
        _emailController.text,
        _passwordController.text,
        _nameController.text,
      );
      context.go('/');
    } catch (e) {
      AppUtils.showSnackBar(context, e.toString(), isError: true);
    } finally {
      setState(() => _isLoading = false);
    }
  }
}
