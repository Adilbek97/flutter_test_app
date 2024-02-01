import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test_app/core/src/colors.dart';
import '../../core/src/dimensions.dart';
import 'message_page_model.dart';
export 'message_page_model.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  late MessagePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = MessagePageModel();

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                margin: const EdgeInsets.only(top: 8),
                decoration: const BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.chevron_left,
                        size: 24,
                      ),
                      onPressed: () {
                        
                      },
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.only(right: 8),
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/images/userAvatar.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Виктор Власов',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            color: Colors.black,
                            fontSize: fontSize15,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        Text(
                          'В сети',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            color: messageDateColor,
                            fontSize: fontSize12,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: const AlignmentDirectional(0, 1),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    reverse: true,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16, 8, 0, 8),
                                  child: Container(
                                    width: 100,
                                    height: 1,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFEDF2F6),
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                child: Text(
                                  '27.01.22',
                                  style:  TextStyle(
                                    fontFamily: 'Gilroy',
                                    color: Color(0xFF9DB7CB),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.normal,
                                  )
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 16, 0),
                                  child: Container(
                                    width: 100,
                                    height: 1,
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFEDF2F6),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ListView(
                            padding: const EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              16,
                            ),
                            primary: false,
                            shrinkWrap: true,

                            scrollDirection: Axis.vertical,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8, bottom: 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(1, 0),
                                      child: Container(
                                        height: 33,
                                        constraints: const BoxConstraints(
                                          minWidth: 100,
                                          maxWidth: double.infinity,
                                        ),
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF3CED78),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(16),
                                            bottomRight: Radius.circular(0),
                                            topLeft: Radius.circular(16),
                                            topRight: Radius.circular(16),
                                          ),
                                        ),
                                        alignment: const AlignmentDirectional(0, 0),
                                        child: const Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment:
                                              AlignmentDirectional(0, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 8, 16, 8),
                                                child: Text(
                                                  'Сделай мне кофе, пожалуйста',
                                                  style: TextStyle(
                                                    fontFamily: 'Gilroy',
                                                    color: Color(0xFF00521C),
                                                    fontSize: fontSize16,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                  )
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                              AlignmentDirectional(0, 1),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 0, 4),
                                                child: Text(
                                                  '21:41',
                                                  style:
                                                  TextStyle(
                                                    fontFamily: 'Gilroy',
                                                    color: Color(0xFF00521C),
                                                    fontSize: fontSize12,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                  )
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                              AlignmentDirectional(0, 1),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(8, 0, 16, 4),
                                                child: Icon(
                                                  Icons.check_rounded,
                                                  color: Color(0xFF00521C),
                                                  size: 11,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0, 1),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: SvgPicture.asset(
                                          'assets/images/ic_mouse.svg',
                                          width: 10,
                                          height: 21,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsetsDirectional.fromSTEB(0, 8, 8, 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: SvgPicture.asset(
                                        'assets/images/ic_white_mouse.svg',
                                        width: 10,
                                        height: 21,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(1, 0),
                                      child: Container(
                                        height: 33,
                                        constraints: const BoxConstraints(
                                          minWidth: 100,
                                          maxWidth: double.infinity,
                                        ),
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFEDF2F6),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(16),
                                            topLeft: Radius.circular(16),
                                            topRight: Radius.circular(16),
                                          ),
                                        ),
                                        alignment: const AlignmentDirectional(0, 0),
                                        child: const Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment:
                                              AlignmentDirectional(0, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 8, 16, 8),
                                                child: Text(
                                                  'Сделай мне кофе, пожалуйста',
                                                  style:  TextStyle(
                                                    fontFamily: 'Gilroy',
                                                    color: Color(0xFF2B333E),
                                                    fontSize: fontSize16,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                  )
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                              AlignmentDirectional(0, 1),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 16, 4),
                                                child: Text(
                                                  '21:41',
                                                  style: TextStyle(
                                                    fontFamily: 'Gilroy',
                                                    color: Color(0xFF2B333E),
                                                    fontSize: fontSize12,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal,
                                                  )
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: SvgPicture.asset("assets/images/ic_attach_file.svg",height: 42, width: 42,)
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Container(
                            height: 42,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEDF2F6),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextFormField(
                              controller: _model.textController,
                              focusNode: _model.textFieldFocusNode,
                              autofocus: false,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: ' Сообщение',
                                labelStyle: const TextStyle(
                                  fontFamily: 'Gilroy',
                                  color: Color(0xFF9DB7CB),
                                  fontSize: fontSize16,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                ),
                                alignLabelWithHint: false,
                                hintStyle: const TextStyle(
                                  fontFamily: 'Gilroy',
                                  color: Color(0xFF9DB7CB),
                                  fontSize: fontSize16,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFF9DB7CB),
                                    width: 0,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xFF9DB7CB),
                                    width: 0,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.red,
                                    width: 0,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.red,
                                    width: 0,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                contentPadding:
                                const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              ),
                              style: const TextStyle(
                                fontFamily: 'Gilroy',
                                color: Color(0xFF9DB7CB),
                                fontSize: fontSize16,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                      child: SvgPicture.asset("assets/images/ic_microphone.svg",height: 42, width: 42,)
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}