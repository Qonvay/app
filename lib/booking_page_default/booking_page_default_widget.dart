import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../booking_complete/booking_complete_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import 'dart:io';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingPageDefaultWidget extends StatefulWidget {
  const BookingPageDefaultWidget({
    Key? key,
    this.mileageParam,
  }) : super(key: key);

  final double? mileageParam;

  @override
  _BookingPageDefaultWidgetState createState() =>
      _BookingPageDefaultWidgetState();
}

class _BookingPageDefaultWidgetState extends State<BookingPageDefaultWidget>
    with TickerProviderStateMixin {
  BookOrderRecord? bookOrderRef;
  TextEditingController? receiverLandmarkController;
  var receiverLocationValue = FFPlace();
  TextEditingController? receiverNameController;
  TextEditingController? receiverPhoneNumberController;
  TextEditingController? senderLandmarkController;
  TextEditingController? senderNameController;
  TextEditingController? senderPhoneNumberController;
  bool? foodCategoryValue;
  bool? clothingCategoryValue;
  bool? shoesCategoryValue;
  bool? electronicsCategoryValue;
  bool? jewaccessCategoryValue;
  bool? docsCategoryValue;
  bool? otherCategoryValue;
  final formKey1 = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey2 = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BOOKING_DEFAULT_bookingPageDefault_ON_LO');
      logFirebaseEvent('bookingPageDefault_Update-Local-State');
      setState(() => FFAppState().mileageCost = 0.0);
    });

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'bookingPageDefault'});
    receiverLandmarkController = TextEditingController();
    receiverNameController = TextEditingController();
    receiverPhoneNumberController = TextEditingController();
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
        final bookingPageDefaultUsersRecord = snapshot.data!;
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
                                    'BOOKING_DEFAULT_close_rounded_ICN_ON_TAP');
                                logFirebaseEvent(
                                    'IconButton_Update-Local-State');
                                setState(() => FFAppState().ngnToKmCheck = 0.0);
                                logFirebaseEvent('IconButton_Navigate-Back');
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
                              'Default Pickup Info',
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
                        key: formKey1,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
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
                                                bookingPageDefaultUsersRecord
                                                    .address!,
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
                                                              .grayDark,
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
                                controller: senderLandmarkController ??=
                                    TextEditingController(
                                  text: bookingPageDefaultUsersRecord
                                      .userLandmark,
                                ),
                                readOnly: true,
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
                                      color:
                                          FlutterFlowTheme.of(context).grayDark,
                                      fontSize: 18,
                                    ),
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.multiline,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                              child: TextFormField(
                                controller: senderNameController ??=
                                    TextEditingController(
                                  text: bookingPageDefaultUsersRecord.firstName,
                                ),
                                readOnly: true,
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
                                      color:
                                          FlutterFlowTheme.of(context).grayDark,
                                      fontSize: 18,
                                    ),
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.name,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15, 10, 15, 10),
                              child: TextFormField(
                                controller: senderPhoneNumberController ??=
                                    TextEditingController(
                                  text:
                                      bookingPageDefaultUsersRecord.phoneNumber,
                                ),
                                readOnly: true,
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
                                      color:
                                          FlutterFlowTheme.of(context).grayDark,
                                      fontSize: 18,
                                    ),
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.phone,
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
                                    return 'Receiver Landmark Is required';
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
                                    return 'Incomplete Phone Number';
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
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                            child: Text(
                              'Item Category',
                              style: FlutterFlowTheme.of(context)
                                  .title3
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color:
                                        FlutterFlowTheme.of(context).textColor,
                                    fontSize: 20,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                      child: Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).textColor,
                        ),
                        child: CheckboxListTile(
                          value: foodCategoryValue ??= false,
                          onChanged: (newValue) =>
                              setState(() => foodCategoryValue = newValue!),
                          title: Text(
                            'Food',
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context).textColor,
                                  fontSize: 16,
                                ),
                          ),
                          activeColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          checkColor: FlutterFlowTheme.of(context).grayDark,
                          dense: true,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                      child: Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).textColor,
                        ),
                        child: CheckboxListTile(
                          value: clothingCategoryValue ??= false,
                          onChanged: (newValue) =>
                              setState(() => clothingCategoryValue = newValue!),
                          title: Text(
                            'Clothing',
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context).textColor,
                                  fontSize: 16,
                                ),
                          ),
                          activeColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          checkColor: FlutterFlowTheme.of(context).grayDark,
                          dense: true,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                      child: Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).textColor,
                        ),
                        child: CheckboxListTile(
                          value: shoesCategoryValue ??= false,
                          onChanged: (newValue) =>
                              setState(() => shoesCategoryValue = newValue!),
                          title: Text(
                            'Shoes',
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context).textColor,
                                  fontSize: 16,
                                ),
                          ),
                          activeColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          checkColor: FlutterFlowTheme.of(context).grayDark,
                          dense: true,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                      child: Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).textColor,
                        ),
                        child: CheckboxListTile(
                          value: electronicsCategoryValue ??= false,
                          onChanged: (newValue) => setState(
                              () => electronicsCategoryValue = newValue!),
                          title: Text(
                            'Electronics',
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context).textColor,
                                  fontSize: 16,
                                ),
                          ),
                          activeColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          checkColor: FlutterFlowTheme.of(context).grayDark,
                          dense: true,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                      child: Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).textColor,
                        ),
                        child: CheckboxListTile(
                          value: jewaccessCategoryValue ??= false,
                          onChanged: (newValue) => setState(
                              () => jewaccessCategoryValue = newValue!),
                          title: Text(
                            'Jewlery/Accessories',
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context).textColor,
                                  fontSize: 16,
                                ),
                          ),
                          activeColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          checkColor: FlutterFlowTheme.of(context).grayDark,
                          dense: true,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                      child: Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).textColor,
                        ),
                        child: CheckboxListTile(
                          value: docsCategoryValue ??= false,
                          onChanged: (newValue) =>
                              setState(() => docsCategoryValue = newValue!),
                          title: Text(
                            'Documents',
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context).textColor,
                                  fontSize: 16,
                                ),
                          ),
                          activeColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          checkColor: FlutterFlowTheme.of(context).grayDark,
                          dense: true,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                      child: Theme(
                        data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          unselectedWidgetColor:
                              FlutterFlowTheme.of(context).textColor,
                        ),
                        child: CheckboxListTile(
                          value: otherCategoryValue ??= false,
                          onChanged: (newValue) =>
                              setState(() => otherCategoryValue = newValue!),
                          title: Text(
                            'Other',
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context).textColor,
                                  fontSize: 16,
                                ),
                          ),
                          activeColor:
                              FlutterFlowTheme.of(context).primaryColor,
                          checkColor: FlutterFlowTheme.of(context).grayDark,
                          dense: true,
                          controlAffinity: ListTileControlAffinity.trailing,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                      child: InkWell(
                        onTap: () async {
                          logFirebaseEvent(
                              'BOOKING_DEFAULT_Container_96q424w2_ON_TA');
                          logFirebaseEvent('Container_Backend-Call');

                          final usersUpdateData = createUsersRecordData(
                            mileageCost: functions.calculateDistance(
                                currentUserDocument!.location,
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
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                          ),
                          child: InkWell(
                            onTap: () async {
                              logFirebaseEvent(
                                  'BOOKING_DEFAULT_Column_gp5j9o16_ON_TAP');
                              logFirebaseEvent('Column_Update-Local-State');
                              setState(() => FFAppState().mileageCost =
                                  functions.calculateDistance(
                                      currentUserDocument!.location,
                                      receiverLocationValue.latLng));
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
                                                      .textColor,
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
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 100),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'BOOKING_DEFAULT_PlaceBookingButton_ON_TA');
                          var _shouldSetState = false;
                          if (valueOrDefault(
                                  currentUserDocument?.mileageBalance, 0.0) >=
                              FFAppState().mileageCost) {
                            logFirebaseEvent(
                                'PlaceBookingButton_Validate-Form');
                            if (formKey1.currentState == null ||
                                !formKey1.currentState!.validate()) {
                              return;
                            }

                            logFirebaseEvent(
                                'PlaceBookingButton_Validate-Form');
                            if (formKey2.currentState == null ||
                                !formKey2.currentState!.validate()) {
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

                            if (FFAppState().mileageCost == 0.0) {
                              logFirebaseEvent(
                                  'PlaceBookingButton_Alert-Dialog');
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
                                  'PlaceBookingButton_Alert-Dialog');
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
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, false),
                                                child: Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext, true),
                                                child: Text('Pay'),
                                              ),
                                            ],
                                          );
                                        },
                                      ) ??
                                      false;
                              if (confirmDialogResponse) {
                                logFirebaseEvent(
                                    'PlaceBookingButton_Backend-Call');

                                final usersUpdateData = {
                                  'mileage_balance': FieldValue.increment(
                                      functions.mileageBalance(
                                          0.0, 0.0, FFAppState().mileageCost)),
                                };
                                await currentUserReference!
                                    .update(usersUpdateData);
                                logFirebaseEvent(
                                    'PlaceBookingButton_Backend-Call');

                                final bookOrderCreateData =
                                    createBookOrderRecordData(
                                  receiverName: receiverNameController!.text,
                                  receiverPhone: int.parse(
                                      receiverPhoneNumberController!.text),
                                  receiverAddress:
                                      receiverLocationValue.address,
                                  receiverLocation:
                                      receiverLocationValue.latLng,
                                  foodCategory: foodCategoryValue,
                                  clothingCategory: clothingCategoryValue,
                                  shoesCategory: shoesCategoryValue,
                                  electronicsCategory: electronicsCategoryValue,
                                  jewaccessCategory: jewaccessCategoryValue,
                                  documentsCategory: docsCategoryValue,
                                  otherCategory: otherCategoryValue,
                                  orderTimestamp: getCurrentTimestamp,
                                  receiverEmail: '',
                                  receiverLandmark:
                                      receiverLandmarkController!.text,
                                  orderId: '',
                                  orderMileageCost: FFAppState().mileageCost,
                                  bookerId: currentUserUid,
                                  orderStatus: 'Pending',
                                  reportOrderActive: false,
                                  senderName: valueOrDefault(
                                      currentUserDocument?.firstName, ''),
                                  senderEmail: currentUserEmail,
                                  senderPhone: int.parse(
                                      senderPhoneNumberController?.text ?? ''),
                                  senderAddress: valueOrDefault(
                                      currentUserDocument?.address, ''),
                                  senderLocation: currentUserDocument!.location,
                                  senderLandmark:
                                      senderLandmarkController?.text ?? '',
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
                                    'PlaceBookingButton_Update-Local-State');
                                setState(() => FFAppState().milbaltemp =
                                    FFAppState().mileageCost.toString());
                                logFirebaseEvent(
                                    'PlaceBookingButton_Update-Local-State');
                                setState(() => FFAppState().receiverName =
                                    receiverNameController!.text);
                                logFirebaseEvent(
                                    'PlaceBookingButton_Update-Local-State');
                                setState(() => FFAppState()
                                    .receiverLocations
                                    .add(receiverNameController!.text));
                                logFirebaseEvent(
                                    'PlaceBookingButton_Update-Local-State');
                                setState(() => FFAppState().mileageCost = 0.0);
                                logFirebaseEvent(
                                    'PlaceBookingButton_Navigate-To');
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.bottomToTop,
                                    duration: Duration(milliseconds: 250),
                                    reverseDuration:
                                        Duration(milliseconds: 250),
                                    child: BookingCompleteWidget(),
                                  ),
                                );
                              } else {
                                if (_shouldSetState) setState(() {});
                                return;
                              }
                            }
                          } else {
                            logFirebaseEvent('PlaceBookingButton_Alert-Dialog');
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
                          Icons.send_sharp,
                          size: 15,
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
              ),
            ),
          ),
        );
      },
    );
  }
}
