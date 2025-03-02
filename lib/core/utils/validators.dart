class Validators {
  static bool isValidEmail(String email) {
    return RegExp(
      r'^[a-zA-Z0-9.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$')
      .hasMatch(email);
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8) {
      return 'Minimum 8 characters';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'At least one uppercase letter';
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'At least one lowercase letter';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'At least one number';
    }
    return null;
  }
}