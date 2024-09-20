import 'dart:convert';
import 'package:cashcarefrontend/api/fetcher.dart';
import 'package:cashcarefrontend/api/urls/app_urls.dart';
import 'package:cashcarefrontend/controllers/modeloperation.dart';
import 'package:cashcarefrontend/data/saving_goals.dart';
import 'package:cashcarefrontend/models/saving.dart';
import 'package:cashcarefrontend/utils/forms/ccForm.dart';
import 'package:cashcarefrontend/utils/snackbar.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";

import 'package:http/http.dart' as http;

class SavinggoalController extends CCform {
  final TextEditingController name = TextEditingController();
  final TextEditingController amount = TextEditingController();
  final TextEditingController endDate = TextEditingController();
  final TextEditingController note = TextEditingController();

  // Method to validate and create a Saving object
  Saving? createSaving() {
    if (!formKey.currentState!.validate()) {
      return null;
    }
    return Saving(
      amount: int.parse(amount.text),
      date: endDate.text,
      name: name.text,
      note: note.text,
    );
  }

  // Method to clear form fields
  @override
  void clearFields() {
    amount.clear();
    endDate.clear();
    name.clear();
    note.clear();
    formState.value = 0;
  }

  void updateSaving(response) async {
    try {
      final data = jsonDecode(response);
      if (data.containsKey('saving')) {
        Saving saving = Saving.fromJson(data['saving']);
        SavingGoalData.savinglist.add(saving);
      } else {}
    } catch (e) {
      throw Exception(e);
    }
  }

  // Method to submit form data
  Future<void> addSaving(BuildContext context) async {
    CCSnackbar.builder(context, "Waiting", CCSnackbartype.success);
    validateForm();
    formState.value = 1;
    ModelOperation().add(
        body: {
          'name': name.text,
          'amount': amount.text,
          'saved': '0',
          'start-date': '2024-08-20',
          'end-date': endDate.text,
          'note': 'no',
        },
        url: ApiUrls.addSaving,
        //body: {"amount": "400", "fire": "fire"},
        //url: ApiUrls.addSaving,
        successAction: (response) {
          Saving? newSaving = createSaving();
          if (newSaving != null) {
            SavingGoalData.savinglist.add(newSaving);
          }
          Get.back();
          CCSnackbar.builder(
              context, "SuccessFully Added", CCSnackbartype.success);
          clearFields();
        },
        errorAction: () {
          formState.value = 0;
        });
  }

  static Future<void> fetchSaving() async {
    try {
      await ModelOperation.fetchFunction(
        ApiUrls.fetchSavingGoal,
        (json) => Saving.fromJson(json),
        listKey: 'data',
        targetList: SavingGoalData.savinglist,
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<http.Response?> edit() async {
    try {
      return await FetchAPI(
        ApiUrls.editSaving,
        HttpMethod.post,
        body: {},
      ).fetchUnauthorizedAPI();
    } catch (e) {
      return null;
    }
  }
}
