import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_board/controller/base_controller.dart';
import 'package:white_board/data_base/db_helper.dart';

import '../routes.dart';

class SignInController extends BaseController {
  TextEditingController tecUsernameController = TextEditingController();
  TextEditingController tecPasswordController = TextEditingController();
  TextEditingController tecUserId = TextEditingController();
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  @override
  Future onInit() {
    _databaseHelper;

    return super.onInit();
  }

  void onClickSubmit() async {
    var dataInserted = await _databaseHelper.insertData(SignInModel(
        userName: tecUsernameController.text,
        password: tecPasswordController.text,
        userId: int.parse(tecUserId.text)));

    if (dataInserted == null) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: const Text("data is not added"),
        action: SnackBarAction(
            label: "The user is already exist", onPressed: () {}),
      ));
      update();
    } else {
      Get.toNamed(Routes.listDetails);
    }
    update();
  }

  ///delete  database
  void deleteDataBase(int userId) async {
    await _databaseHelper.deleteData(userId);
  }
}
