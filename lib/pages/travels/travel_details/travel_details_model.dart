import '/components/modal_sections/travel_detail/travel_detail_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'travel_details_widget.dart' show TravelDetailsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TravelDetailsModel extends FlutterFlowModel<TravelDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for travel_Detail component.
  late TravelDetailModel travelDetailModel;

  @override
  void initState(BuildContext context) {
    travelDetailModel = createModel(context, () => TravelDetailModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    travelDetailModel.dispose();
  }
}
