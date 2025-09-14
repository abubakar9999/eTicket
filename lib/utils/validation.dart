class Validation {
  static bool emailValidator(String email) {
    bool emalilValid = RegExp(r' /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i').hasMatch(email);
    return emalilValid;
  }
}
