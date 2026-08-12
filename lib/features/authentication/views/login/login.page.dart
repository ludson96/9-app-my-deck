import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../shared/views/modals/error.modal.dart';
import '../../../../shared/views/widgets/custom_input/custom_input.widget.dart';
import '../../../decks/views/decks/decks.page.dart';
import '../register/register.page.dart';
import 'login.store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginStore = LoginStore();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Hero / Branding Header
                Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(40),
                          blurRadius: 16,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.style_rounded,
                      size: 44,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  "My Deck",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Faça o login para continuar estudando seus flashcards",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 40),

                // Form Inputs
                CustomInput(
                  label: 'E-mail',
                  controller: emailController,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 16),
                Observer(
                  builder: (context) {
                    return CustomInput(
                      controller: passController,
                      label: 'Senha',
                      isPassword: true,
                      obscureText: !loginStore.showPassword,
                      onPressedSufixIcon: loginStore.toggleShowPassword,
                      prefixIcon: Icon(
                        Icons.lock_outlined,
                        color: Colors.grey.shade700,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 28),

                // Login Button
                SizedBox(
                  height: 52,
                  child: Observer(
                    builder: (context) {
                      return ElevatedButton(
                        onPressed: loginStore.isLoading ? null : login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          disabledBackgroundColor: Colors.grey.shade400,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: loginStore.isLoading
                            ? const SizedBox(
                                width: 22,
                                height: 22,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2.5,
                                ),
                              )
                            : const Text(
                                "Entrar",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 32),

                // Register Prompt
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: "Não tem conta ainda? ",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: "Criar uma conta",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const RegisterPage(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    final email = emailController.text;
    final password = passController.text;

    if (email.isEmpty || password.isEmpty) return;

    final result = await loginStore.login(email, password);

    if (!mounted) return;

    if (!result) {
      ErrorModal.show(context, loginStore.error!);
      return;
    }

    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const DecksPage()));
  }
}
