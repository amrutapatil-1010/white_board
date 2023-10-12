import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whiteboard/whiteboard.dart';

import 'base_controller.dart';

class BoardController extends BaseController {
  WhiteBoardController whiteBoardController = WhiteBoardController();
  final GlobalKey _whiteboardKey = GlobalKey();
}
