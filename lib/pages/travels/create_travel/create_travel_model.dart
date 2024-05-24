import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'create_travel_widget.dart' show CreateTravelWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateTravelModel extends FlutterFlowModel<CreateTravelWidget> {
  ///  Local state fields for this page.

  DateTime? dateMin;

  DateTime? dateMax;

  List<DocumentReference> checkedRequests = [];
  void addToCheckedRequests(DocumentReference item) =>
      checkedRequests.add(item);
  void removeFromCheckedRequests(DocumentReference item) =>
      checkedRequests.remove(item);
  void removeAtIndexFromCheckedRequests(int index) =>
      checkedRequests.removeAt(index);
  void insertAtIndexInCheckedRequests(int index, DocumentReference item) =>
      checkedRequests.insert(index, item);
  void updateCheckedRequestsAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      checkedRequests[index] = updateFn(checkedRequests[index]);

  int? contador;

  DocumentReference? listUsers;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  DateTime? datePicked;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  RidesRecord? rideId;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  TravelRequestsRecord? users;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
