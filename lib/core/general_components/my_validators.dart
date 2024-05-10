class MyValidators {
  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter an Email';
    }
    if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
        .hasMatch(value)) {
      return 'Please Enter a Valid Email';
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter a Name';
    }
    if (value.length <= 5) {
      return 'Please Enter More Then 5 Chars';
    }
    if (value.length > 20) {
      return 'Please Enter Less Then 20 Chars';
    }
    return null;
  }


  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please Enter a Password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    if(!RegExp(r'\b(?=.*[a-z])(?=.*\d)[a-zA-Z\d]{6,}\b')
        .hasMatch(value)){
      return 'Password must contain at least one letter and one number';
    }
    return null;
  }

  static String? repeatPasswordValidator({String? value, String? password}) {
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }


  static String? phoneValidator(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a phone number';
    }
    return null;
  }


}
