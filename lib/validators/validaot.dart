FirstNameValidator(value) {
  if (value.isEmpty) {
    return 'First Name cannot be empty';
  } else
    null;
}

LastNameValidator(value) {
  if (value.isEmpty) {
    return 'Last Name cannot be empty';
  } else
    null;
}

MiddleNameValidator(value) {
  if (value.isEmpty) {
    return 'If you do not have middle name, leave a - hypen sign';
  } else
    null;
}

PasswordValidator(value) {
  if (value.isEmpty) {
    return 'Password cannot be empty';
  } else if (value.length < 6) {
    return 'Password should be atleast 6 digits!';
  } else
    null;
}

EmailValidator(value) {
  if (value.isEmpty) {
    return 'Email cannot be empty';
  } else
    null;
}

PhoneValidator(value) {
  if (value.isEmpty) {
    return 'Phone number cannot be empty';
  } else if (value.length != 10) {
    return 'Phone number should be 10 digits!';
  } else
    null;
}

TextValidator(value) {
  if (value.isEmpty) {
    return 'The field cannot be empty';
  } else if (value.length < 200) {
    return 'The description should be atleast 200 words.';
  } else
    null;
}
