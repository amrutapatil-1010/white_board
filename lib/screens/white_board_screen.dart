import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:white_board/controller/white_board_controller.dart';
import 'package:white_board/main.dart';
import 'package:whiteboard/whiteboard.dart';

class WhiteBoardScreen extends GetView<BoardController> {
  const WhiteBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BoardController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: Text(
              "White board",
              style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    controller.whiteBoardController.convertToImage();
                  },
                  icon: const Icon(Icons.image))
            ],
          ),
          body: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              children: [
                Expanded(
                    child: WhiteBoard(
                  controller: controller.whiteBoardController,
                  onRedoUndo: (isUndoAvailable, isRedoAvailable) {},
                )),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            height: 100,
            color: Colors.black26,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => controller.whiteBoardController.undo(),
                      icon: const SizedBox(
                        width: 70,
                        child: Icon(
                          Icons.undo,
                          size: 30,
                        ),
                      )),
                  IconButton(
                      onPressed: () => controller.whiteBoardController.redo(),
                      icon: const SizedBox(
                        width: 70,
                        child: Icon(
                          Icons.redo,
                          size: 30,
                        ),
                      )),
                ]),
          ));
    });
  }
}
