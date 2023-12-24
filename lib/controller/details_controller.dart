import 'dart:developer';

import 'package:white_board/controller/base_controller.dart';

import '../data_base/db_helper.dart';

class DetailsController extends BaseController {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  List<SignInModel> listDetails = [];
  @override
  Future onInit() async {
    _databaseHelper;
    listDetails = await _databaseHelper.getData();
    update();

    return super.onInit();
  }

  void deleteDetails(int index) async {
    var tempDetails = listDetails[index];
    log("previous data ====> ${listDetails.length}");
    await _databaseHelper.deleteData(tempDetails.userId);
    var deletedData = await _databaseHelper.getData();
    log("the deleted data ====> ${deletedData.length}");
    listDetails.removeAt(index);
    update();
  }

  void editDetails(int index) async {
    var tempDetails = listDetails[index];
    log("previous data --->${tempDetails.userName}");
    var dataDetails =
        SignInModel(userName: "ANANYA", password: "AKSHATA", userId: 123456);
    await _databaseHelper.updateData(dataDetails);
    listDetails = await _databaseHelper.getData();
    listDetails;
    update();
  }
}
