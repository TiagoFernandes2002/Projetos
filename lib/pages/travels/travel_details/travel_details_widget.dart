import '/components/modal_sections/travel_detail/travel_detail_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'travel_details_model.dart';
export 'travel_details_model.dart';

class TravelDetailsWidget extends StatefulWidget {
  const TravelDetailsWidget({
    super.key,
    required this.travelRef,
  });

  final DocumentReference? travelRef;

  @override
  State<TravelDetailsWidget> createState() => _TravelDetailsWidgetState();
}

class _TravelDetailsWidgetState extends State<TravelDetailsWidget> {
  late TravelDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TravelDetailsModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'travelDetails'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: wrapWithModel(
            model: _model.travelDetailModel,
            updateCallback: () => setState(() {}),
            child: TravelDetailWidget(
              idTravel: widget.travelRef!,
            ),
          ),
        ),
      ),
    );
  }
}
