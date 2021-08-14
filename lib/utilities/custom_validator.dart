class CustomValidator {
  static String? lessThen3(String? value) {
    return (value!.length < 3) ? 'Enter more then 2 characters' : null;
  }

  static String? lessThen4(String? value) {
    return (value!.length < 4) ? 'Enter more then 3 characters' : null;
  }

  static String? lessThen5(String? value) {
    return (value!.length < 5) ? 'Enter more then 4 characters' : null;
  }
}
