import '/components/modal_sections/travel_detail/travel_detail_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'modal_user_widget.dart' show ModalUserWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModalUserModel extends FlutterFlowModel<ModalUserWidget> {
  ///  Local state fields for this component.

  bool? showBack = false;

  ///  State fields for stateful widgets in this component.

  // Model for travel_Detail component.
  late TravelDetailModel travelDetailModel;

  @override
  void initState(BuildContext context) {
    travelDetailModel = createModel(context, () => TravelDetailModel());
  }

  @override
  void dispose() {
    travelDetailModel.dispose();
  }
}
