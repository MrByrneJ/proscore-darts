import 'package:form_validator/form_validator.dart';

final displayNameRegEx = RegExp(r'^[A-Za-z0-9]+$');
final passwordRegEx = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])');
// final passwordRegEx =
//     RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#&*~\*\+\?\.\$])');

String displayNameValidationError(String displayName) {
  if (displayName.isEmpty) return 'Required field';
  var validator = ValidationBuilder()
      .minLength(4, 'Display name must atleast 4 characters long')
      .maxLength(9, 'Maximum 9 characters')
      .regExp(displayNameRegEx, 'Can only contain letters and numbers')
      .build();
  return validator(displayName) ?? '';
}

String emailAddressValidationError(String email) {
  if (email.isEmpty) return 'Required';
  var validator =
      ValidationBuilder().email('Please enter a valid email').build();
  return validator(email) ?? '';
}

String passwordValidationError(String pass) {
  if (pass.isEmpty) return 'Required';
  var validator = ValidationBuilder()
      .minLength(8, 'Password must atleast 8 characters long')
      .maxLength(18, 'Maximum 18 characters')
      .regExp(passwordRegEx,
          'Must Contain one of each A-Z a-z 0-9 and .!@#&*~*+?\$')
      .build();
  return validator(pass) ?? '';
}

String confirmPasswordValidationError(String password, String confirm) {
  if (confirm.isEmpty) return 'Required';
  return confirm == password ? '' : 'Passwords do not match';
}
