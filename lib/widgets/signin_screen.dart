
import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'reset_screen.dart';
import 'validators.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formKey = GlobalKey<FormState>();

  void _showNotImplemented(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('Message'),
          content: const Text('Not Implemented'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _submit() {
    // validate() runs every field's validator and shows the error messages.
    if (_formKey.currentState!.validate()) {
      _showNotImplemented(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Авторизація'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.account_circle,
                  size: 100,
                  color: Colors.indigo,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Вітаємо!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text('Увійдіть у свій обліковий запис'),
                const SizedBox(height: 30),

                TextFormField(
                  keyboardType: TextInputType.text,
                  validator: Validators.required,
                  decoration: const InputDecoration(
                    labelText: 'Логін',
                    hintText: 'Введіть логін',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 16),

                TextFormField(
                  obscureText: true,
                  validator: Validators.password,
                  decoration: const InputDecoration(
                    labelText: 'Пароль',
                    hintText: 'Введіть пароль',
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submit,
                    child: const Text('Авторизуватись'),
                  ),
                ),

                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ResetScreen(),
                      ),
                    );
                  },
                  child: const Text('Забули пароль?'),
                ),

                const SizedBox(height: 8),

                const Text('Ще не маєте облікового запису?'),
                const SizedBox(height: 8),

                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      );
                    },
                    child: const Text('Зареєструватись'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
