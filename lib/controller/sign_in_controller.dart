import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:white_board/controller/base_controller.dart';
import 'package:white_board/data_base/db_helper.dart';

class SignInController extends BaseController {
  TextEditingController tecUsernameController = TextEditingController();
  TextEditingController tecPasswordController = TextEditingController();
  TextEditingController tecUserId = TextEditingController();
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  @override
  Future onInit() {
    _databaseHelper;
    // TODO: implement onInit
    return super.onInit();
  }

  void onClickSubmit() async {
    await _databaseHelper.insertData(SignInModel(
        userName: tecUsernameController.text,
        password: tecPasswordController.text,
        userId: 1));
    log("all data --->${await _databaseHelper.getData()}");
    // await _databaseHelper.getSignInData();

    // log("the sign in data ---->${_databaseHelper.getSignInData()}");
  }
}
