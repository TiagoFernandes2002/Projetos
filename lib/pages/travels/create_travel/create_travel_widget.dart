import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_travel_model.dart';
export 'create_travel_model.dart';

class CreateTravelWidget extends StatefulWidget {
  const CreateTravelWidget({super.key});

  @override
  State<CreateTravelWidget> createState() => _CreateTravelWidgetState();
}

class _CreateTravelWidgetState extends State<CreateTravelWidget> {
  late CreateTravelModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateTravelModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Create_travel'});
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('CREATE_TRAVEL_arrow_back_rounded_ICN_ON_');
              context.pop();
            },
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        FFLocalizations.of(context).getText(
                          'k9rixcex' /* Create Your Travel */,
                        ),
                        style:
                            FlutterFlowTheme.of(context).headlineLarge.override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 20.0, 16.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            logFirebaseEvent(
                                'CREATE_TRAVEL_DatePickerContainer_ON_TAP');
                            await showModalBottomSheet<bool>(
                                context: context,
                                builder: (context) {
                                  final _datePickedCupertinoTheme =
                                      CupertinoTheme.of(context);
                                  return ScrollConfiguration(
                                    behavior:
                                        const MaterialScrollBehavior().copyWith(
                                      dragDevices: {
                                        PointerDeviceKind.mouse,
                                        PointerDeviceKind.touch,
                                        PointerDeviceKind.stylus,
                                        PointerDeviceKind.unknown
                                      },
                                    ),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              3,
                                      width: MediaQuery.of(context).size.width,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      child: CupertinoTheme(
                                        data:
                                            _datePickedCupertinoTheme.copyWith(
                                          textTheme: _datePickedCupertinoTheme
                                              .textTheme
                                              .copyWith(
                                            dateTimePickerTextStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .override(
                                                      fontFamily: 'Outfit',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                    ),
                                          ),
                                        ),
                                        child: CupertinoDatePicker(
                                          mode: CupertinoDatePickerMode
                                              .dateAndTime,
                                          minimumDate: getCurrentTimestamp,
                                          initialDateTime: getCurrentTimestamp,
                                          maximumDate: DateTime(2050),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          use24hFormat: false,
                                          onDateTimeChanged: (newDateTime) =>
                                              safeSetState(() {
                                            _model.datePicked = newDateTime;
                                          }),
                                        ),
                                      ),
                                    ),
                                  );
                                });
                            if (_model.datePicked != null) {
                              setState(() {
                                _model.dateMin = functions.futureDate(
                                    _model.datePicked, -30, 0, 0, 0);
                                _model.dateMax = functions.futureDate(
                                    _model.datePicked, 30, 0, 0, 0);
                              });
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 60.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).primaryText,
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 5.0, 12.0, 5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '7thpy0mn' /* Select Date */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  Icon(
                                    Icons.date_range_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 10.0, 0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'v81qiwqx' /* Choose Travelers */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Outfit',
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      StreamBuilder<List<TravelRequestsRecord>>(
                        stream: queryTravelRequestsRecord(
                          queryBuilder: (travelRequestsRecord) =>
                              travelRequestsRecord
                                  .where(
                                    'travelDate',
                                    isGreaterThanOrEqualTo: _model.dateMin,
                                  )
                                  .where(
                                    'travelDate',
                                    isLessThanOrEqualTo: _model.dateMax,
                                  ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 20.0,
                                height: 20.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<TravelRequestsRecord>
                              columnTravelRequestsRecordList = snapshot.data!;
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  columnTravelRequestsRecordList.length,
                                  (columnIndex) {
                                final columnTravelRequestsRecord =
                                    columnTravelRequestsRecordList[columnIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 8.0, 16.0, 8.0),
                                  child: StreamBuilder<UsersRecord>(
                                    stream: UsersRecord.getDocument(
                                        columnTravelRequestsRecord
                                            .passengerId!),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 20.0,
                                            height: 20.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      final rowUsersRecord = snapshot.data!;
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 44.0,
                                            height: 44.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(2.0, 2.0, 2.0, 2.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(6.0),
                                                child: Image.network(
                                                  rowUsersRecord.photoUrl,
                                                  width: 40.0,
                                                  height: 40.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              rowUsersRecord.displayName,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          Text(
                                            dateTimeFormat(
                                              'd/M H:mm',
                                              columnTravelRequestsRecord
                                                  .travelDate!,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      'Plus Jakarta Sans',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          ToggleIcon(
                                            onPressed: () async {
                                              setState(
                                                () => _model.checkedRequests
                                                        .contains(
                                                            columnTravelRequestsRecord
                                                                .reference)
                                                    ? _model.removeFromCheckedRequests(
                                                        columnTravelRequestsRecord
                                                            .reference)
                                                    : _model.addToCheckedRequests(
                                                        columnTravelRequestsRecord
                                                            .reference),
                                              );
                                            },
                                            value: _model.checkedRequests
                                                .contains(
                                                    columnTravelRequestsRecord
                                                        .reference),
                                            onIcon: Icon(
                                              Icons.check_box,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 25.0,
                                            ),
                                            offIcon: Icon(
                                              Icons.check_box_outline_blank,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 25.0,
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                );
                              }),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 80.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'CREATE_TRAVEL_CREATE_TRAVEL_BTN_ON_TAP');
                      setState(() {
                        _model.contador = 0;
                      });

                      var ridesRecordReference = RidesRecord.collection.doc();
                      await ridesRecordReference.set({
                        ...createRidesRecordData(
                          driverId: currentUserReference,
                          isStarted: false,
                          travelDate: _model.datePicked,
                        ),
                        ...mapToFirestore(
                          {
                            'allUsers': [currentUserReference],
                          },
                        ),
                      });
                      _model.rideId = RidesRecord.getDocumentFromData({
                        ...createRidesRecordData(
                          driverId: currentUserReference,
                          isStarted: false,
                          travelDate: _model.datePicked,
                        ),
                        ...mapToFirestore(
                          {
                            'allUsers': [currentUserReference],
                          },
                        ),
                      }, ridesRecordReference);
                      while (_model.contador! < _model.checkedRequests.length) {
                        _model.users =
                            await TravelRequestsRecord.getDocumentOnce(
                                _model.checkedRequests[_model.contador!]);

                        await _model.rideId!.reference.update({
                          ...mapToFirestore(
                            {
                              'passengers': FieldValue.arrayUnion(
                                  [_model.users?.passengerId]),
                            },
                          ),
                        });

                        await _model.checkedRequests[_model.contador!]
                            .update(createTravelRequestsRecordData(
                          isAccepted: true,
                        ));
                        setState(() {
                          _model.contador = _model.contador! + 1;
                        });
                      }
                      context.safePop();

                      setState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      'iprwyex9' /* Create Travel */,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 55.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleMedium.override(
                                fontFamily: 'Plus Jakarta Sans',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 2.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
