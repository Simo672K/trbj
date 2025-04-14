import 'package:flutter/material.dart';

typedef ValidatorFunc = FormFieldValidator<String>?;

var PHONE_REGEX = RegExp(r'^[0-9]{9}$');
var EMAIL_REGEX = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

class Validator {
  Validator(this.value);

  final String? value;

  NotNullValidator assertNotNull(String feedbackError) {
    if (value == null || value!.trim().isEmpty) {
      return NotNullValidator._(value, feedbackError);
    }
    return NotNullValidator._(value, null);
  }
}

class NotNullValidator {
  NotNullValidator._(this.value, this._feedbackError);

  final String? value;
  String? _feedbackError;

  NotNullValidator isPhoneNumber(String feedbackError) {
    if (_feedbackError == null && !PHONE_REGEX.hasMatch(value!)) {
      _feedbackError = feedbackError;
    }
    return this;
  }

  NotNullValidator isEmail(String feedbackError) {
    if (_feedbackError == null && !EMAIL_REGEX.hasMatch(value!)) {
      _feedbackError = feedbackError;
    }
    return this;
  }

  String? applyRules() {
    return _feedbackError;
  }
}
