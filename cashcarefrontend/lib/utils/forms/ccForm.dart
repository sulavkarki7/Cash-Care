import 'package:cashcarefrontend/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CCform {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final formState = 0.obs;
  void clearFields();

//validate the form
  bool validateForm() {
    return formKey.currentState!.validate();
  }

  void handleUploadError(context, message) {
    formState.value = 0;
    CCSnackbar.builder(context, message, CCSnackbartype.error);
    return;
  }

  void handleSucess(context, message) {
    formState.value = 0;
    CCSnackbar.builder(context, message, CCSnackbartype.error);
    clearFields();
    return;
  }

  // Clear all fields
}
