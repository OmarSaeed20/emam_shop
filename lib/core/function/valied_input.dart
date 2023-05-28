import '/index.dart';

enum InputType { userName, phone, email, password1, password2 }

valiedInput(InputType type, {String? val, String? val2, int? max, int? min}) {
  if (type == InputType.userName) {
    if (!GetUtils.isUsername(val!)) {
      return "The name field is required.";
    }
    if (val.length < min!) {
      return "can't be less than $min";
    }
    if (val.length > max!) {
      return "can't be larger than $max";
    }
  }

  if (val!.isEmpty) {
    return "can't be Empty";
  }

  if (type == InputType.phone) {
    if (!GetUtils.isLengthEqualTo(val, 11)) {
      return "The phone field is required.";
    }
  }

  if (type == InputType.email) {
    if (!GetUtils.isEmail(val)) {
      return "The email field is required.";
    }
  }

  if (type == InputType.password1) {
    if (!GetUtils.isLengthGreaterThan(val, 7)) {
      return "The password field is required.";
    }
    if (val.length < min!) {
      return "can't be less than $min";
    }
    if (val.length > max!) {
      return "can't be larger than $max";
    }
  }

  if (type == InputType.password2) {
    if (val != val2) {
      return "confiairm password must equal password";
    }
  }
}

enum AddressType { address, landMark, fullName, adTitle }

addressValied(AddressType type, {required String val}) {
  if (val.isEmpty) {
    return "can't be Empty";
  }
}
