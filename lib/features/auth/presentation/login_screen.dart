import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';
import '../data/auth_repository.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _loginWithEmail() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      await ref.read(authRepositoryProvider).signInWithEmailAndPassword(
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

  Future<void> _loginWithGoogle() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      final result = await ref.read(authRepositoryProvider).signInWithGoogle();
      if (result != null && mounted) {
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
        title: Text('Login', style: TextStyle(color: Color(0xFF0F172A), fontWeight: FontWeight.bold)),
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
                        'Welcome Back',
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
                      const SizedBox(height: 24),
                      _isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                GlassButton.custom(
                                  onTap: _loginWithEmail,
                                  height: 48,
                                  shape: const LiquidRoundedRectangle(borderRadius: 12),
                                  child: const Center(
                                    child: Text('Login', style: TextStyle(color: Color(0xFF0F172A), fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                GlassButton.custom(
                                  onTap: _loginWithGoogle,
                                  height: 48,
                                  shape: const LiquidRoundedRectangle(borderRadius: 12),
                                  child: const Center(
                                    child: Text('Sign in with Google', style: TextStyle(color: Color(0xFF0F172A), fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                TextButton(
                                  onPressed: () => context.go('/signup'),
                                  child: const Text("Don't have an account? Sign up", style: TextStyle(color: Color(0xFF64748B))),
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
