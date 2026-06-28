import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_developers_guide/ui/blocs/auth/auth_bloc.dart';
import 'package:flutter_developers_guide/ui/components/code_preview_tabs.dart';
import 'package:flutter_developers_guide/ui/components/page_scaffold.dart';

class FirebaseAuthView extends StatelessWidget {
  final String _codeTabMarkdownLocation =
      'assets/markdowns/third_party_services/firebase.md';

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Firebase Auth',
      mobileUi: [
        CodePreviewTabs(
          previewTab: _FirebaseAuthImplementation(),
          codeTabMarkdownLocation: _codeTabMarkdownLocation,
        ),
      ],
    );
  }
}

class _FirebaseAuthImplementation extends StatefulWidget {
  @override
  State<_FirebaseAuthImplementation> createState() =>
      _FirebaseAuthImplementationState();
}

class _FirebaseAuthImplementationState
    extends State<_FirebaseAuthImplementation> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLogin = true;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _toggleMode() {
    setState(() {
      _isLogin = !_isLogin;
    });
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (_isLogin) {
      context.read<AuthBloc>().add(
            SignInRequested(
              email: email,
              password: password,
            ),
          );
    } else {
      context.read<AuthBloc>().add(
            RegisterRequested(
              email: email,
              password: password,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final isLoading = state is AuthLoading;
        final failure = state is AuthError ? state.failure : null;

        // ----------------------------
        // Authenticated UI
        // ----------------------------
        if (state is AuthAuthenticated) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.verified_user,
                    size: 64,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Logged In',
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    state.user.email,
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  FilledButton.icon(
                    onPressed: () {
                      context.read<AuthBloc>().add(
                            SignOutRequested(),
                          );
                    },
                    icon: const Icon(Icons.logout),
                    label: const Text('Logout'),
                  ),
                ],
              ),
            ),
          );
        }

        // ----------------------------
        // Loading screen on startup
        // ----------------------------
        if (state is AuthUnknown) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // ----------------------------
        // Login / Register UI
        // ----------------------------
        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.lock_outline_rounded,
                  size: 56,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(height: 12),
                Text(
                  _isLogin ? 'Welcome back' : 'Create account',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineSmall,
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email is required';
                    }

                    final emailRegex = RegExp(
                      r'^[^\s@]+@[^\s@]+\.[^\s@]+$',
                    );

                    if (!emailRegex.hasMatch(value.trim())) {
                      return 'Enter a valid email';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }

                    if (value.length < 6) {
                      return 'Minimum 6 characters';
                    }

                    return null;
                  },
                ),
                if (failure != null) ...[
                  const SizedBox(height: 16),
                  Text(
                    failure.message,
                    style: TextStyle(
                      color: theme.colorScheme.error,
                    ),
                  ),
                ],
                const SizedBox(height: 24),
                FilledButton(
                  onPressed: isLoading ? null : _submit,
                  child: isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          _isLogin ? 'Sign In' : 'Register',
                        ),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: isLoading ? null : _toggleMode,
                  child: Text(
                    _isLogin ? 'Create Account' : 'Already have an account?',
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
