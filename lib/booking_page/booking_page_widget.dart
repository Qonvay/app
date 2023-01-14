import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../booking_complete/booking_complete_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import 'dart:io';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookingPageWidget extends StatefulWidget {
  const BookingPageWidget({
    Key? key,
    this.mileageParam,
    this.bookingParam,
  }) : super(key: key);

  final double? mileageParam;
  final DocumentReference? bookingParam;

  @override
  _BookingPageWidgetState createState() => _BookingPageWidgetState();
}

class _BookingPageWidgetState extends State<BookingPageWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
      ],
    ),
  };
  BookOrderRecord? bookOrderRef;
  DateTime? datePicked;
  String? itemCategoryValue;
  TextEditingController? receiverLandmarkController;
  var receiverLocationValue = FFPlace();
  TextEditingController? receiverNameController;
  TextEditingController? receiverPhoneNumberController;
  TextEditingController? senderLandmarkController;
  var senderLocationValue = FFPlace();
  TextEditingController? senderNameController;
  TextEditingController? senderPhoneNumberController;
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BOOKING_bookingPage_ON_LOAD');
      logFirebaseEvent('bookingPage_update_local_state');
      FFAppState().update(() {
        FFAppState().mileageCost = 0.0;
      });
    });

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'bookingPage'});
    receiverLandmarkController = TextEditingController();
    receiverNameController = TextEditingController();
    receiverPhoneNumberController = TextEditingController();
    senderLandmarkController = TextEditingController();
    senderNameController = TextEditingController();
    senderPhoneNumberController = TextEditingController();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    receiverLandmarkController?.dispose();
    receiverNameController?.dispose();
    receiverPhoneNumberController?.dispose();
    senderLandmarkController?.dispose();
    senderNameController?.dispose();
    senderPhoneNumberController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: SpinKitFadingGrid(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 50,
              ),
            ),
          );
        }
        final bookingPageUsersRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).background,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery Info',
                            style: FlutterFlowTheme.of(context).title1,
                          ),
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context).background,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              buttonSize: 48,
                              icon: Icon(
                                Icons.close_rounded,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 30,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'BOOKING_close_rounded_ICN_ON_TAP');
                                logFirebaseEvent(
                                    'IconButton_update_local_state');
                                FFAppState().update(() {
                                  FFAppState().ngnToKmCheck = 0.0;
                                });
                                logFirebaseEvent('IconButton_navigate_back');
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 15, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
                            child: Text(
                              'Pickup Info',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Form(
                        key: formKey2,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: FlutterFlowPlacePicker(
                                        iOSGoogleMapsApiKey:
                                            'AIzaSyBYGH1CPSqgNNIHlczkSOH6OZvBIIJUwNg',
                                        androidGoogleMapsApiKey:
                                            'AIzaSyB2v-1CKYKI5Jdwq2HNk7tnTYt_iyzGHx4',
                                        webGoogleMapsApiKey:
                                            'AIzaSyDLtpQGSQ36MHLuGujSuUfNdIoO7McxH6k',
                                        onSelect: (place) async {
                                          setState(() =>
                                              senderLocationValue = place);
                                        },
                                        defaultText: 'Search Pickup Address',
                                        icon: Icon(
                                          Icons.search,
                                          color: FlutterFlowTheme.of(context)
                                              .grayLight,
                                          size: 16,
                                        ),
                                        buttonOptions: FFButtonOptions(
                                          height: 60,
                                          color: FlutterFlowTheme.of(context)
                                              .darkBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .textColor,
                                              ),
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .background,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .darkBackground,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 10, 10, 10),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  senderLocationValue.address,
                                                  'Pickup Address',
                                                ),
                                                textAlign: TextAlign.center,
                                                maxLines: 3,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .textColor,
                                                      fontSize: 16,
                                                    ),
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
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                              child: TextFormField(
                                controller: senderLandmarkController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  hintText: 'Pickup Landmark',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .grayLight,
                                        fontSize: 18,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .darkBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          24, 24, 24, 24),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .textColor,
                                      fontSize: 18,
                                    ),
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.multiline,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Sender Landmark is required';
                                  }

                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                              child: TextFormField(
                                controller: senderNameController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  hintText: 'Sender Name',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .grayLight,
                                        fontSize: 18,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .darkBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          24, 24, 24, 24),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .textColor,
                                      fontSize: 18,
                                    ),
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.name,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Sender Name is required';
                                  }

                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15, 10, 15, 10),
                              child: TextFormField(
                                controller: senderPhoneNumberController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  hintText: 'Sender Phone Number',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .grayLight,
                                        fontSize: 18,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .darkBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          24, 24, 24, 24),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .textColor,
                                      fontSize: 18,
                                    ),
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.phone,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Sender Phone Number is required';
                                  }

                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
                            child: Text(
                              'Destination Info',
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Form(
                        key: formKey1,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: FlutterFlowPlacePicker(
                                        iOSGoogleMapsApiKey:
                                            'AIzaSyBYGH1CPSqgNNIHlczkSOH6OZvBIIJUwNg',
                                        androidGoogleMapsApiKey:
                                            'AIzaSyB2v-1CKYKI5Jdwq2HNk7tnTYt_iyzGHx4',
                                        webGoogleMapsApiKey:
                                            'AIzaSyDLtpQGSQ36MHLuGujSuUfNdIoO7McxH6k',
                                        onSelect: (place) async {
                                          setState(() =>
                                              receiverLocationValue = place);
                                        },
                                        defaultText:
                                            'Search Destination Address',
                                        icon: Icon(
                                          Icons.search,
                                          color: FlutterFlowTheme.of(context)
                                              .grayLight,
                                          size: 16,
                                        ),
                                        buttonOptions: FFButtonOptions(
                                          height: 60,
                                          color: FlutterFlowTheme.of(context)
                                              .darkBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .subtitle2
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .textColor,
                                                fontSize: 16,
                                              ),
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .background,
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .darkBackground,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 10, 10, 10),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  receiverLocationValue.address,
                                                  'Destination Address',
                                                ),
                                                textAlign: TextAlign.center,
                                                maxLines: 3,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .textColor,
                                                      fontSize: 16,
                                                    ),
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
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                              child: TextFormField(
                                controller: receiverLandmarkController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  hintText: 'Destination Landmark',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .grayLight,
                                        fontSize: 16,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .darkBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          24, 24, 24, 24),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .textColor,
                                      fontSize: 18,
                                    ),
                                textAlign: TextAlign.start,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Receiver Landmark required';
                                  }

                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                              child: TextFormField(
                                controller: receiverNameController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  hintText: 'Receiver Name',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .grayLight,
                                        fontSize: 16,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .darkBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          24, 24, 24, 24),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .textColor,
                                      fontSize: 18,
                                    ),
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.name,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Receiver Name Is required';
                                  }

                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15, 10, 15, 10),
                              child: TextFormField(
                                controller: receiverPhoneNumberController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  hintText: 'Receiver Phone Number',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .grayLight,
                                        fontSize: 16,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .darkBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          24, 24, 24, 24),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .textColor,
                                      fontSize: 18,
                                    ),
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.phone,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Receiver Phone Number is required';
                                  }

                                  if (val.length < 11) {
                                    return 'Invalid Phone Number';
                                  }

                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                              child: FlutterFlowDropDown<String>(
                                options: [
                                  'Food',
                                  'Clothing',
                                  'Shoes',
                                  'Electronics',
                                  'Jewlery/Accessories',
                                  'Documents',
                                  'Other'
                                ],
                                onChanged: (val) =>
                                    setState(() => itemCategoryValue = val),
                                height: 60,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: FlutterFlowTheme.of(context)
                                          .grayLight,
                                      fontSize: 16,
                                    ),
                                hintText: 'Choose Item Category',
                                fillColor:
                                    FlutterFlowTheme.of(context).darkBackground,
                                elevation: 2,
                                borderColor: Colors.transparent,
                                borderWidth: 0,
                                borderRadius: 15,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    20, 4, 12, 4),
                                hidesUnderline: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'BOOKING_PAGE_PAGE_deliveryDate_ON_TAP');
                          logFirebaseEvent('deliveryDate_date_time_picker');
                          final _datePickedDate = await showDatePicker(
                            context: context,
                            initialDate: getCurrentTimestamp,
                            firstDate: getCurrentTimestamp,
                            lastDate: DateTime(2050),
                          );

                          TimeOfDay? _datePickedTime;
                          if (_datePickedDate != null) {
                            _datePickedTime = await showTimePicker(
                              context: context,
                              initialTime:
                                  TimeOfDay.fromDateTime(getCurrentTimestamp),
                            );
                          }

                          if (_datePickedDate != null &&
                              _datePickedTime != null) {
                            setState(
                              () => datePicked = DateTime(
                                _datePickedDate.year,
                                _datePickedDate.month,
                                _datePickedDate.day,
                                _datePickedTime!.hour,
                                _datePickedTime.minute,
                              ),
                            );
                          }
                        },
                        text: valueOrDefault<String>(
                          dateTimeFormat(
                            'd/M h:mm a',
                            datePicked,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          'Choose Delivery Date',
                        ),
                        icon: Icon(
                          Icons.calendar_today,
                          size: 15,
                        ),
                        options: FFButtonOptions(
                          width: 400,
                          height: 60,
                          color: FlutterFlowTheme.of(context).darkBackground,
                          textStyle: FlutterFlowTheme.of(context)
                              .subtitle2
                              .override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.of(context).grayLight,
                              ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 30, 15, 0),
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent('BOOKING_Container_0clc0m0p_ON_TAP');
                          logFirebaseEvent('Container_backend_call');

                          final usersUpdateData = createUsersRecordData(
                            mileageCost: functions.calculateDistance(
                                senderLocationValue.latLng,
                                receiverLocationValue.latLng),
                          );
                          await currentUserReference!.update(usersUpdateData);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).background,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 6,
                                color: Color(0x4B1A1F24),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color:
                                  FlutterFlowTheme.of(context).darkBackground,
                            ),
                          ),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'BOOKING_PAGE_PAGE_Column_blr09abi_ON_TAP');
                              logFirebaseEvent('Column_update_local_state');
                              FFAppState().update(() {
                                FFAppState().mileageCost =
                                    functions.calculateDistance(
                                        senderLocationValue.latLng,
                                        receiverLocationValue.latLng);
                              });
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 12, 20, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Tap Here To See Mileage Cost',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              fontSize: 16,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 4, 20, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 20),
                                        child: Text(
                                          FFAppState().mileageCost.toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .title1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                fontSize: 32,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 0, 20),
                                        child: Text(
                                          'km',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                fontSize: 18,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                            child: Icon(
                              Icons.timer,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              size: 24,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                            child: Text(
                              'ETA : 5 - 48 hours',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    fontSize: 18,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 100),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent('BOOKING_PlaceBookingButton_ON_TAP');
                          var _shouldSetState = false;
                          if (valueOrDefault(
                                  currentUserDocument?.mileageBalance, 0.0) >=
                              FFAppState().mileageCost) {
                            logFirebaseEvent(
                                'PlaceBookingButton_validate_form');
                            if (formKey2.currentState == null ||
                                !formKey2.currentState!.validate()) {
                              return;
                            }

                            if (senderLocationValue == FFPlace()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Please set pick up location',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .darkBackground,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              );
                              return;
                            }

                            logFirebaseEvent(
                                'PlaceBookingButton_validate_form');
                            if (formKey1.currentState == null ||
                                !formKey1.currentState!.validate()) {
                              return;
                            }

                            if (itemCategoryValue == null) {
                              return;
                            }

                            if (receiverLocationValue == FFPlace()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Please set destination location',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .darkBackground,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              );
                              return;
                            }

                            if (datePicked != null) {
                              if (FFAppState().mileageCost == 0.0) {
                                logFirebaseEvent(
                                    'PlaceBookingButton_alert_dialog');
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text(
                                          'Tap Mileage Cost Before Proceeding'),
                                      content: Text(
                                          'Tap / Click on the \"Mileage Cost\" field to get the distance cost before proceeding.'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Okay'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                if (_shouldSetState) setState(() {});
                                return;
                              } else {
                                logFirebaseEvent(
                                    'PlaceBookingButton_alert_dialog');
                                var confirmDialogResponse =
                                    await showDialog<bool>(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title: Text('Confirm Booking'),
                                              content: Text(
                                                  'The mileage cost will be deducted from your mileage balance to place booking.'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          false),
                                                  child: Text('Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext,
                                                          true),
                                                  child: Text('Pay'),
                                                ),
                                              ],
                                            );
                                          },
                                        ) ??
                                        false;
                                if (confirmDialogResponse) {
                                  logFirebaseEvent(
                                      'PlaceBookingButton_backend_call');

                                  final usersUpdateData = {
                                    'mileage_balance': FieldValue.increment(
                                        functions.mileageBalance(0.0, 0.0,
                                            FFAppState().mileageCost)),
                                  };
                                  await currentUserReference!
                                      .update(usersUpdateData);
                                  logFirebaseEvent(
                                      'PlaceBookingButton_backend_call');

                                  final bookOrderCreateData =
                                      createBookOrderRecordData(
                                    senderName: senderNameController!.text,
                                    senderPhone: int.tryParse(
                                        senderPhoneNumberController!.text),
                                    senderAddress: senderLocationValue.address,
                                    senderLocation: senderLocationValue.latLng,
                                    receiverName: receiverNameController!.text,
                                    receiverPhone: int.tryParse(
                                        receiverPhoneNumberController!.text),
                                    receiverAddress:
                                        receiverLocationValue.address,
                                    receiverLocation:
                                        receiverLocationValue.latLng,
                                    orderTimestamp: getCurrentTimestamp,
                                    senderEmail: '',
                                    senderLandmark:
                                        senderLandmarkController!.text,
                                    receiverEmail: '',
                                    receiverLandmark:
                                        receiverLandmarkController!.text,
                                    orderId: '',
                                    orderMileageCost: FFAppState().mileageCost,
                                    bookerId: currentUserUid,
                                    orderStatus: 'Pending',
                                    reportOrderActive: false,
                                    isRiderAssigned: false,
                                    itemCat: itemCategoryValue,
                                    bookingDate: datePicked,
                                  );
                                  var bookOrderRecordReference =
                                      BookOrderRecord.collection.doc();
                                  await bookOrderRecordReference
                                      .set(bookOrderCreateData);
                                  bookOrderRef =
                                      BookOrderRecord.getDocumentFromData(
                                          bookOrderCreateData,
                                          bookOrderRecordReference);
                                  _shouldSetState = true;
                                  logFirebaseEvent(
                                      'PlaceBookingButton_navigate_to');
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.bottomToTop,
                                      duration: Duration(milliseconds: 250),
                                      reverseDuration:
                                          Duration(milliseconds: 250),
                                      child: BookingCompleteWidget(
                                        bookingParam: widget.bookingParam,
                                      ),
                                    ),
                                  );
                                } else {
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }
                              }
                            } else {
                              logFirebaseEvent(
                                  'PlaceBookingButton_alert_dialog');
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: Text('Delivery Date Is Not Set'),
                                    content: Text(
                                        'Please choose a delivery date for your order booking.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              if (_shouldSetState) setState(() {});
                              return;
                            }
                          } else {
                            logFirebaseEvent('PlaceBookingButton_alert_dialog');
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Insufficient Mileage'),
                                  content: Text(
                                      'Sorry you do not have enough mileage to continue. Top up or subscribe to a plan to place your order. Thanks'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Okay'),
                                    ),
                                  ],
                                );
                              },
                            );
                            if (_shouldSetState) setState(() {});
                            return;
                          }

                          if (_shouldSetState) setState(() {});
                        },
                        text: 'Place Booking',
                        icon: Icon(
                          Icons.delivery_dining,
                          size: 30,
                        ),
                        options: FFButtonOptions(
                          width: 300,
                          height: 80,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle: FlutterFlowTheme.of(context)
                              .title1
                              .override(
                                fontFamily: 'Lexend Deca',
                                color:
                                    FlutterFlowTheme.of(context).darkBackground,
                              ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
            ),
          ),
        );
      },
    );
  }
}
