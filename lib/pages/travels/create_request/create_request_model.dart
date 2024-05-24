import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'create_request_widget.dart' show CreateRequestWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateRequestModel extends FlutterFlowModel<CreateRequestWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> checkedUsers = [];
  void addToCheckedUsers(DocumentReference item) => checkedUsers.add(item);
  void removeFromCheckedUsers(DocumentReference item) =>
      checkedUsers.remove(item);
  void removeAtIndexFromCheckedUsers(int index) => checkedUsers.removeAt(index);
  void insertAtIndexInCheckedUsers(int index, DocumentReference item) =>
      checkedUsers.insert(index, item);
  void updateCheckedUsersAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      checkedUsers[index] = updateFn(checkedUsers[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
