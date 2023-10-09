import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whiteboard/whiteboard.dart';

import 'base_controller.dart';

class BoardController extends BaseController {
  WhiteBoardController whiteBoardController = WhiteBoardController();
  final GlobalKey _whiteboardKey = GlobalKey();

  // Future<Uint8List> captureImage() async {
  //   RenderRepaintBoundary boundary = _whiteboardKey.currentContext
  //       ?.findRenderObject() as RenderRepaintBoundary;
  //   ui.Image image = await boundary.toImage(
  //       pixelRatio:
  //           3.0); // You can adjust the pixelRatio as needed for image quality
  //   ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  //   Uint8List uint8List = byteData.buffer.asUint8List();
  //   return uint8List;
  // }
}
