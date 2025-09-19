class Validators {
  static String? validateEmail(String value) {
    if (value.isEmpty) return "Email cannot be empty";
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return "Invalid email format";
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) return "Password cannot be empty";
    if (value.length < 6) return "Password must be at least 6 characters";
    return null;
  }
}