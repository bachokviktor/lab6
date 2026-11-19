
import 'package:flutter/material.dart';
import 'validators.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({super.key});

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
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
        title: const Text('Відновлення пароля'),
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
                  Icons.lock_reset,
                  size: 100,
                  color: Colors.indigo,
                ),
                const SizedBox(height: 20),

                const Text(
                  'Забули пароль?',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),

                const Text(
                  'Введіть свою електронну пошту, '
                      'щоб відновити доступ до акаунта.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.email,
                  decoration: const InputDecoration(
                    labelText: 'Електронна пошта',
                    hintText: 'example@email.com',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submit,
                    child: const Text('Скинути пароль'),
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
