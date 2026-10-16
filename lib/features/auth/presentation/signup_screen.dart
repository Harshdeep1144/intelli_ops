import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import '../data/auth_repository.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _signupWithEmail() async {
    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() {
        _errorMessage = "Passwords do not match.";
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      await ref.read(authRepositoryProvider).createUserWithEmailAndPassword(
            _emailController.text.trim(),
            _passwordController.text.trim(),
          );
      if (mounted) {
        context.go('/dashboard');
      }
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GlassScaffold(
      settings: LiquidGlassSettings.ios27Light,
      edgeToEdge: true,
      statusBarStyle: GlassStatusBarStyle.dark,
      backgroundColor: Colors.white,
      appBar: const GlassAppBar(
        title: Text('Sign Up', style: TextStyle(color: Color(0xFF0F172A), fontWeight: FontWeight.bold)),
      ),
      body: Material(
        type: MaterialType.transparency,
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: GlassCard(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Create an Account',
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF0F172A)),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      if (_errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Text(
                            _errorMessage!,
                            style: const TextStyle(color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      GlassTextField(
                        controller: _emailController,
                        placeholder: 'Email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16),
                      GlassTextField(
                        controller: _passwordController,
                        placeholder: 'Password',
                        obscureText: true,
                      ),
                      const SizedBox(height: 16),
                      GlassTextField(
                        controller: _confirmPasswordController,
                        placeholder: 'Confirm Password',
                        obscureText: true,
                      ),
                      const SizedBox(height: 24),
                      _isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                GlassButton.custom(
                                  onTap: _signupWithEmail,
                                  height: 48,
                                  shape: const LiquidRoundedRectangle(borderRadius: 12),
                                  child: const Center(
                                    child: Text('Sign Up', style: TextStyle(color: Color(0xFF0F172A), fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                TextButton(
                                  onPressed: () => context.go('/login'),
                                  child: const Text('Already have an account? Login', style: TextStyle(color: Color(0xFF64748B))),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
