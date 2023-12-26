import '/flutter_flow/flutter_flow_util.dart';
import 'chat_list_copy_widget.dart' show ChatListCopyWidget;
import 'package:flutter/material.dart';

class ChatListCopyModel extends FlutterFlowModel<ChatListCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
