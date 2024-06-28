class Validator {
  static String? validateEmail(String? value) {
    const String pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';

    final RegExp regex = RegExp(pattern);
    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Insira um email válido'
        : null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty || value.length < 6) {
      return 'Senha deve conter no mínimo 6 caracteres';
    }
    return null;
  }

  static String? validateLength(
      {required String? value, required String? message, required int length}) {
    if (value == null || value.isEmpty || value.length < length) {
      return message;
    }
    return null;
  }

  static String? validatePasswordEquality(
      {required String? password, required String? passwordConfirmation}) {
    if (password == null ||
        passwordConfirmation == null ||
        password.isEmpty ||
        passwordConfirmation.isEmpty ||
        password != passwordConfirmation) {
      return 'As senhas devem ser identicas';
    }

    return null;
  }

  static String? validateNumber(String? value) {
    if (value != null && num.tryParse(value) == null) {
      return 'Digite um número válido';
    }
    return null;
  }
}
