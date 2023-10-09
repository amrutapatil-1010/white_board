import 'package:get/get.dart';

class BaseController extends GetxController {
  bool isLoading = false;
  @override
  Future onInit() async {
    super.onInit();
  }

  void showLoader() {
    isLoading = true;
    update();
  }

  void hideLoader() {
    isLoading = false;
    update();
  }
}
