import 'package:flutter/material.dart';
import 'package:flutter_test_app/presentation/pages/message_page.dart';

class MessagePageModel extends MessagePage {

  MessagePageModel({super.key});
  
  final unfocusNode = FocusNode();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  
  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}