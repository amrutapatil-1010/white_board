import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_board/controller/sign_in_controller.dart';
import 'package:white_board/custom_widget/text_field_widget.dart';

import '../routes.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(
            "Sign In Screen",
            style: Theme.of(context).primaryTextTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldWidget(
                  controller: controller.tecUsernameController,
                  title: "Username"),
              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  controller: controller.tecPasswordController,
                  title: "Password"),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {
                    Get.toNamed(Routes.whiteBoard);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: MediaQuery.sizeOf(context).height / 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.amber,
                    ),
                    child: Text(
                      "Submit",
                      style: Theme.of(context)
                          .primaryTextTheme
                          .bodySmall
                          ?.copyWith(color: Colors.black, fontSize: 15),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
