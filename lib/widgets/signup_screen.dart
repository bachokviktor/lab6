
import 'package:flutter/material.dart';
import 'validators.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
        title: const Text('Реєстрація'),
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
                  Icons.person_add_alt_1,
                  size: 90,
                  color: Colors.indigo,
                ),
                const SizedBox(height: 20),

                const Text(
                  'Створення акаунта',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),

                TextFormField(
                  validator: Validators.required,
                  decoration: const InputDecoration(
                    labelText: 'Ім’я користувача',
                    hintText: 'Введіть своє ім’я',
                    prefixIcon: Icon(Icons.badge),
                  ),
                ),
                const SizedBox(height: 16),

                TextFormField(
                  validator: Validators.required,
                  decoration: const InputDecoration(
                    labelText: 'Логін',
                    hintText: 'Придумайте логін',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 16),

                TextFormField(
                  obscureText: true,
                  validator: Validators.password,
                  decoration: const InputDecoration(
                    labelText: 'Пароль',
                    hintText: 'Придумайте пароль',
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submit,
                    child: const Text('Зареєструватись'),
                  ),
                ),
                const SizedBox(height: 8),

                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Повернутись до авторизації'),
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
