import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../shared/views/modals/error.modal.dart';
import '../../../../shared/views/widgets/custom_input/custom_input.widget.dart';
import 'register.store.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final registerStore = RegisterStore();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text("Criar Conta"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              Text(
                "Preencha os dados abaixo para cadastrar seu usuário",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 24),
              CustomInput(
                controller: emailController,
                label: 'E-mail',
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Colors.grey.shade700,
                ),
              ),
              const SizedBox(height: 16),
              Observer(builder: (context) {
                return CustomInput(
                  controller: passwordController,
                  label: 'Senha',
                  isPassword: true,
                  obscureText: !registerStore.showPassword,
                  onPressedSufixIcon: registerStore.toggleShowPassword,
                  prefixIcon: Icon(
                    Icons.lock_outlined,
                    color: Colors.grey.shade700,
                  ),
                );
              }),
              const SizedBox(height: 16),
              Observer(builder: (context) {
                return CustomInput(
                  controller: confirmPasswordController,
                  label: 'Confirmar senha',
                  isPassword: true,
                  obscureText: !registerStore.showPassword,
                  onPressedSufixIcon: registerStore.toggleShowPassword,
                  prefixIcon: Icon(
                    Icons.lock_reset_outlined,
                    color: Colors.grey.shade700,
                  ),
                );
              }),
              const SizedBox(height: 28),
              SizedBox(
                height: 52,
                child: Observer(
                  builder: (context) {
                    return ElevatedButton(
                      onPressed: registerStore.isLoading ? null : createAccount,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        disabledBackgroundColor: Colors.grey.shade400,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: registerStore.isLoading
                          ? const SizedBox(
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2.5,
                              ),
                            )
                          : const Text(
                              "Criar conta",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> createAccount() async {
    final email = emailController.text;
    final pass = passwordController.text;
    final confirmPass = confirmPasswordController.text;

    if (email.isEmpty || pass.isEmpty || confirmPass.isEmpty) return;

    if (pass != confirmPass) {
      ErrorModal.show(context, 'Senha e Confirmar Senha são diferentes');
      return;
    }

    final result = await registerStore.createAccount(email, pass);

    if (!mounted) return;

    if (!result) {
      ErrorModal.show(context, registerStore.error!);
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Conta criada com sucesso"),
        backgroundColor: Colors.black,
        duration: Duration(seconds: 3),
      ),
    );

    Navigator.of(context).pop();
  }
}
