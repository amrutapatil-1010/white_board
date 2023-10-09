import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_board/controller/sign_in_controller.dart';
import 'package:white_board/controller/white_board_controller.dart';
import 'package:white_board/screens/sign_in_screen.dart';
import 'package:white_board/screens/white_board_screen.dart';

class Routes {
  static const signIn = "/signInScreen";
  static const whiteBoard = "/whiteBoardScreen";
  static final routes = [
    GetPage(
        binding: BindingsBuilder(() {
          Get.put(SignInController());
        }),
        name: signIn,
        page: () => const SignInScreen(
              key: Key(signIn),
            )),
    GetPage(
        binding: BindingsBuilder(() {
          Get.put(BoardController());
        }),
        name: whiteBoard,
        page: () => const WhiteBoardScreen(key: Key(whiteBoard)))
  ];
}
