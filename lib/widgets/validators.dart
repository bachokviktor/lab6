/// Reusable validators for [TextFormField.validator].
///
/// Each validator returns `null` when the value is valid,
/// or an error message that is shown under the field otherwise.
class Validators {
  static const int minPasswordLength = 8;

  // Basic check: something@something.something, no spaces.
  static final RegExp _emailRegExp = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Поле не може бути порожнім';
    }
    return null;
  }

  static String? email(String? value) {
    final requiredError = required(value);
    if (requiredError != null) return requiredError;

    if (!_emailRegExp.hasMatch(value!.trim())) {
      return 'Введіть коректну електронну пошту';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Поле не може бути порожнім';
    }
    if (value.length < minPasswordLength) {
      return 'Пароль має містити щонайменше $minPasswordLength символів';
    }
    return null;
  }
}
