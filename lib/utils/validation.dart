/*
class Validation {
  static bool emailValidator(String email) {
    bool emalilValid = RegExp(r' /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i').hasMatch(email);
    return emalilValid;
  }
}
*/

class Validation {
  static bool emailValidator(String email) {
    final RegExp regex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@'
      r'(([^<>()[\]\\.,;:\s@\"]+\.)+[^<>()[\]\\.,;:\s@\"]{2,})$',
      caseSensitive: false,
    );
    return regex.hasMatch(email);
  }
}