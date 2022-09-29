import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../booking_complete/booking_complete_widget.dart';
import '../delivery_order_list/delivery_order_list_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_place_picker.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/place.dart';
import '../login_page/login_page_widget.dart';
import '../m_y_profile_page/m_y_profile_page_widget.dart';
import '../main_dashboard/main_dashboard_widget.dart';
import '../payment_page/payment_page_widget.dart';
import 'dart:io';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDeliveryWidget extends StatefulWidget {
  const BookDeliveryWidget({
    Key? key,
    this.mileageParam,
  }) : super(key: key);

  final double? mileageParam;

  @override
  _BookDeliveryWidgetState createState() => _BookDeliveryWidgetState();
}

class _BookDeliveryWidgetState extends State<BookDeliveryWidget>
    with TickerProviderStateMixin {
  BookOrderRecord? bookOrderRef;
  TextEditingController? receiverFullAddressController;
  var receiverLocationValue = FFPlace();
  TextEditingController? receiverNameController;
  TextEditingController? receiverPhoneNumberController;
  TextEditingController? senderFullAddressController;
  var senderLocationValue = FFPlace();
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
  final formKey2 = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: true,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BOOK_DELIVERY_bookDelivery_ON_LOAD');
      logFirebaseEvent('bookDelivery_Update-Local-State');
      setState(() => FFAppState().mileageCost = 0.0);
    });

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'bookDelivery'});
    receiverFullAddressController = TextEditingController();
    receiverNameController = TextEditingController();
    receiverPhoneNumberController = TextEditingController();
    senderFullAddressController = TextEditingController();
    senderNameController = TextEditingController();
    senderPhoneNumberController = TextEditingController();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  void dispose() {
    receiverFullAddressController?.dispose();
    receiverNameController?.dispose();
    receiverPhoneNumberController?.dispose();
    senderFullAddressController?.dispose();
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
        final bookDeliveryUsersRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).background,
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () async {
                logFirebaseEvent('BOOK_DELIVERY_PAGE_Icon_geergjjl_ON_TAP');
                logFirebaseEvent('Icon_Drawer');
                scaffoldKey.currentState!.openDrawer();
              },
              child: Icon(
                Icons.menu,
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 30,
              ),
            ),
            title: Text(
              'Book Delivery',
              style: FlutterFlowTheme.of(context).title1,
            ),
            actions: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: FaIcon(
                  FontAwesomeIcons.solidQuestionCircle,
                  color: FlutterFlowTheme.of(context).textColor,
                  size: 30,
                ),
                onPressed: () {
                  print('IconButton pressed ...');
                },
              ),
            ],
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: FlutterFlowTheme.of(context).background,
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              logFirebaseEvent('BOOK_DELIVERY_FloatingActionButton_k2q5b');
              logFirebaseEvent('FloatingActionButton_Drawer');
              scaffoldKey.currentState!.openDrawer();
            },
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            elevation: 8,
            child: Icon(
              Icons.menu_open,
              color: FlutterFlowTheme.of(context).darkBackground,
              size: 30,
            ),
          ),
          drawer: Drawer(
            elevation: 16,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).background,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          FlutterFlowTheme.of(context).background,
                          FlutterFlowTheme.of(context).darkBackground
                        ],
                        stops: [0, 1],
                        begin: AlignmentDirectional(0, -1),
                        end: AlignmentDirectional(0, 1),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(15, 100, 15, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      2, 2, 2, 2),
                                  child: AuthUserStreamWidget(
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        currentUserPhoto,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              AuthUserStreamWidget(
                                child: Text(
                                  valueOrDefault(
                                      currentUserDocument?.firstName, ''),
                                  style: FlutterFlowTheme.of(context).title3,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                child: AuthUserStreamWidget(
                                  child: Text(
                                    valueOrDefault(
                                        currentUserDocument?.lastName, ''),
                                    style: FlutterFlowTheme.of(context).title3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'BOOK_DELIVERY_ListTile_oas886fv_ON_TAP');
                        logFirebaseEvent('ListTile_Navigate-To');
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 500),
                            reverseDuration: Duration(milliseconds: 500),
                            child: MainDashboardWidget(),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: FaIcon(
                          FontAwesomeIcons.home,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          size: 20,
                        ),
                        title: Text(
                          'Dashboard',
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.of(context).grayLight,
                              ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: FlutterFlowTheme.of(context).grayLight,
                          size: 20,
                        ),
                        tileColor: FlutterFlowTheme.of(context).grayLight,
                        dense: false,
                      ),
                    ),
                  ),
                  Divider(
                    color: FlutterFlowTheme.of(context).darkBackground,
                  ),
                  InkWell(
                    onTap: () async {
                      logFirebaseEvent(
                          'BOOK_DELIVERY_ListTile_yg1r885s_ON_TAP');
                      logFirebaseEvent('ListTile_Navigate-To');
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 500),
                          reverseDuration: Duration(milliseconds: 500),
                          child: BookDeliveryWidget(),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.delivery_dining,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        size: 25,
                      ),
                      title: Text(
                        'Book Delivery',
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.of(context).grayLight,
                            ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: FlutterFlowTheme.of(context).grayLight,
                        size: 20,
                      ),
                      tileColor: FlutterFlowTheme.of(context).grayLight,
                      dense: false,
                    ),
                  ),
                  Divider(
                    color: FlutterFlowTheme.of(context).darkBackground,
                  ),
                  InkWell(
                    onTap: () async {
                      logFirebaseEvent(
                          'BOOK_DELIVERY_ListTile_z9yviqxu_ON_TAP');
                      logFirebaseEvent('ListTile_Navigate-To');
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 500),
                          reverseDuration: Duration(milliseconds: 500),
                          child: DeliveryOrderListWidget(),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.listAlt,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        size: 20,
                      ),
                      title: Text(
                        'Deliveries',
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.of(context).grayLight,
                            ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: FlutterFlowTheme.of(context).grayLight,
                        size: 20,
                      ),
                      tileColor: FlutterFlowTheme.of(context).grayLight,
                      dense: false,
                    ),
                  ),
                  Divider(
                    color: FlutterFlowTheme.of(context).darkBackground,
                  ),
                  InkWell(
                    onTap: () async {
                      logFirebaseEvent(
                          'BOOK_DELIVERY_ListTile_1el9mia0_ON_TAP');
                      logFirebaseEvent('ListTile_Navigate-To');
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 500),
                          reverseDuration: Duration(milliseconds: 500),
                          child: PaymentPageWidget(),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.payment,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        size: 25,
                      ),
                      title: Text(
                        'Payment',
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.of(context).grayLight,
                            ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: FlutterFlowTheme.of(context).grayLight,
                        size: 20,
                      ),
                      tileColor: FlutterFlowTheme.of(context).grayLight,
                      dense: false,
                    ),
                  ),
                  Divider(
                    color: FlutterFlowTheme.of(context).darkBackground,
                  ),
                  InkWell(
                    onTap: () async {
                      logFirebaseEvent(
                          'BOOK_DELIVERY_ListTile_e2x64zyg_ON_TAP');
                      logFirebaseEvent('ListTile_Navigate-To');
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 500),
                          reverseDuration: Duration(milliseconds: 500),
                          child: MYProfilePageWidget(),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.person_outlined,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        size: 25,
                      ),
                      title: Text(
                        'Profile',
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.of(context).grayLight,
                            ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: FlutterFlowTheme.of(context).grayLight,
                        size: 20,
                      ),
                      tileColor: FlutterFlowTheme.of(context).grayLight,
                      dense: false,
                    ),
                  ),
                  Divider(
                    color: FlutterFlowTheme.of(context).darkBackground,
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.support_agent,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 25,
                    ),
                    title: Text(
                      'Help / Support',
                      style: FlutterFlowTheme.of(context).title3.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).grayLight,
                          ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: FlutterFlowTheme.of(context).grayLight,
                      size: 20,
                    ),
                    tileColor: FlutterFlowTheme.of(context).grayLight,
                    dense: false,
                  ),
                  Divider(
                    color: FlutterFlowTheme.of(context).darkBackground,
                  ),
                  InkWell(
                    onTap: () async {
                      logFirebaseEvent(
                          'BOOK_DELIVERY_ListTile_3se4fz3q_ON_TAP');
                      logFirebaseEvent('ListTile_Auth');
                      await signOut();
                      await Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 500),
                          reverseDuration: Duration(milliseconds: 500),
                          child: LoginPageWidget(),
                        ),
                        (r) => false,
                      );
                    },
                    child: ListTile(
                      leading: Icon(
                        Icons.logout,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        size: 25,
                      ),
                      title: Text(
                        'Logout',
                        style: FlutterFlowTheme.of(context).title3.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.of(context).grayLight,
                            ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: FlutterFlowTheme.of(context).grayLight,
                        size: 20,
                      ),
                      tileColor: FlutterFlowTheme.of(context).grayLight,
                      dense: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 15, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
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
                                        setState(
                                            () => senderLocationValue = place);
                                      },
                                      defaultText: 'Search Pickup Location',
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
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .grayLight,
                                            ),
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .background,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
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
                            child: TextFormField(
                              controller: senderFullAddressController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle:
                                    FlutterFlowTheme.of(context).bodyText1,
                                hintText: 'Pickup Full Address',
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
                                fillColor:
                                    FlutterFlowTheme.of(context).darkBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    24, 24, 24, 24),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    fontSize: 14,
                                  ),
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              keyboardType: TextInputType.multiline,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Field is required';
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
                                fillColor:
                                    FlutterFlowTheme.of(context).darkBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    24, 24, 24, 24),
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.name,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Field is required';
                                }

                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
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
                                fillColor:
                                    FlutterFlowTheme.of(context).darkBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    24, 24, 24, 24),
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.phone,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Field is required';
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
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
                                          'Search Destination Location',
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
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .grayLight,
                                            ),
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .background,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
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
                            child: TextFormField(
                              controller: receiverFullAddressController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelStyle:
                                    FlutterFlowTheme.of(context).bodyText1,
                                hintText: 'Destination Full Address',
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
                                fillColor:
                                    FlutterFlowTheme.of(context).darkBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    24, 24, 24, 24),
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    fontSize: 14,
                                  ),
                              textAlign: TextAlign.start,
                              maxLines: 3,
                              keyboardType: TextInputType.multiline,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Field is required';
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
                                fillColor:
                                    FlutterFlowTheme.of(context).darkBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    24, 24, 24, 24),
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.name,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Field is required';
                                }

                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
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
                                fillColor:
                                    FlutterFlowTheme.of(context).darkBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    24, 24, 24, 24),
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                              textAlign: TextAlign.start,
                              keyboardType: TextInputType.phone,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Field is required';
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                          child: Text(
                            'Item Category',
                            style: FlutterFlowTheme.of(context).title3.override(
                                  fontFamily: 'Lexend Deca',
                                  color: FlutterFlowTheme.of(context).textColor,
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
                            FlutterFlowTheme.of(context).grayDark,
                      ),
                      child: CheckboxListTile(
                        value: foodCategoryValue ??= false,
                        onChanged: (newValue) =>
                            setState(() => foodCategoryValue = newValue!),
                        title: Text(
                          'Food',
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.of(context).grayLight,
                                fontSize: 16,
                              ),
                        ),
                        activeColor: FlutterFlowTheme.of(context).primaryColor,
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
                            FlutterFlowTheme.of(context).grayDark,
                      ),
                      child: CheckboxListTile(
                        value: clothingCategoryValue ??= false,
                        onChanged: (newValue) =>
                            setState(() => clothingCategoryValue = newValue!),
                        title: Text(
                          'Clothing',
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.of(context).grayLight,
                                fontSize: 16,
                              ),
                        ),
                        activeColor: FlutterFlowTheme.of(context).primaryColor,
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
                            FlutterFlowTheme.of(context).grayDark,
                      ),
                      child: CheckboxListTile(
                        value: shoesCategoryValue ??= false,
                        onChanged: (newValue) =>
                            setState(() => shoesCategoryValue = newValue!),
                        title: Text(
                          'Shoes',
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.of(context).grayLight,
                                fontSize: 16,
                              ),
                        ),
                        activeColor: FlutterFlowTheme.of(context).primaryColor,
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
                            FlutterFlowTheme.of(context).grayDark,
                      ),
                      child: CheckboxListTile(
                        value: electronicsCategoryValue ??= false,
                        onChanged: (newValue) => setState(
                            () => electronicsCategoryValue = newValue!),
                        title: Text(
                          'Electronics',
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.of(context).grayLight,
                                fontSize: 16,
                              ),
                        ),
                        activeColor: FlutterFlowTheme.of(context).primaryColor,
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
                            FlutterFlowTheme.of(context).grayDark,
                      ),
                      child: CheckboxListTile(
                        value: jewaccessCategoryValue ??= false,
                        onChanged: (newValue) =>
                            setState(() => jewaccessCategoryValue = newValue!),
                        title: Text(
                          'Jewlery/Accessories',
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.of(context).grayLight,
                                fontSize: 16,
                              ),
                        ),
                        activeColor: FlutterFlowTheme.of(context).primaryColor,
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
                            FlutterFlowTheme.of(context).grayDark,
                      ),
                      child: CheckboxListTile(
                        value: docsCategoryValue ??= false,
                        onChanged: (newValue) =>
                            setState(() => docsCategoryValue = newValue!),
                        title: Text(
                          'Documents',
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.of(context).grayLight,
                                fontSize: 16,
                              ),
                        ),
                        activeColor: FlutterFlowTheme.of(context).primaryColor,
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
                            FlutterFlowTheme.of(context).grayDark,
                      ),
                      child: CheckboxListTile(
                        value: otherCategoryValue ??= false,
                        onChanged: (newValue) =>
                            setState(() => otherCategoryValue = newValue!),
                        title: Text(
                          'Other',
                          style: FlutterFlowTheme.of(context).title3.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.of(context).grayLight,
                                fontSize: 16,
                              ),
                        ),
                        activeColor: FlutterFlowTheme.of(context).primaryColor,
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
                            'BOOK_DELIVERY_Container_se1yqcb3_ON_TAP');
                        logFirebaseEvent('Container_Backend-Call');

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
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                        child: InkWell(
                          onTap: () async {
                            logFirebaseEvent(
                                'BOOK_DELIVERY_Column_a81jeig9_ON_TAP');
                            logFirebaseEvent('Column_Update-Local-State');
                            setState(() => FFAppState().mileageCost =
                                functions.calculateDistance(
                                    senderLocationValue.latLng,
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
                                            color: FlutterFlowTheme.of(context)
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
                            'BOOK_DELIVERY_PlaceBookingButton_ON_TAP');
                        var _shouldSetState = false;
                        if (valueOrDefault(
                                currentUserDocument?.mileageBalance, 0.0) >=
                            FFAppState().mileageCost) {
                          logFirebaseEvent('PlaceBookingButton_Validate-Form');
                          if (formKey2.currentState == null ||
                              !formKey2.currentState!.validate()) {
                            return;
                          }

                          logFirebaseEvent('PlaceBookingButton_Validate-Form');
                          if (formKey1.currentState == null ||
                              !formKey1.currentState!.validate()) {
                            return;
                          }

                          if (FFAppState().mileageCost == 0.0) {
                            logFirebaseEvent('PlaceBookingButton_Alert-Dialog');
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text(
                                      'Tap Mileage Cost Before Proceeding'),
                                  content: Text(
                                      'Tap / Click on the \"Mileage Cost\" field to get the distance before proceeding.'),
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
                            logFirebaseEvent('PlaceBookingButton_Backend-Call');

                            final usersUpdateData = {
                              'mileage_balance': FieldValue.increment(
                                  functions.mileageBalance(
                                      0.0, 0.0, FFAppState().mileageCost)),
                            };
                            await currentUserReference!.update(usersUpdateData);
                          }

                          logFirebaseEvent('PlaceBookingButton_Backend-Call');

                          final bookOrderCreateData = createBookOrderRecordData(
                            senderName: senderNameController!.text,
                            senderPhone:
                                int.parse(senderPhoneNumberController!.text),
                            senderAddress: senderFullAddressController!.text,
                            senderLocation: senderLocationValue.latLng,
                            receiverName: receiverNameController!.text,
                            receiverPhone:
                                int.parse(receiverPhoneNumberController!.text),
                            receiverAddress:
                                receiverFullAddressController!.text,
                            receiverLocation: receiverLocationValue.latLng,
                            foodCategory: foodCategoryValue,
                            clothingCategory: clothingCategoryValue,
                            shoesCategory: shoesCategoryValue,
                            electronicsCategory: electronicsCategoryValue,
                            jewaccessCategory: jewaccessCategoryValue,
                            documentsCategory: docsCategoryValue,
                            otherCategory: otherCategoryValue,
                            orderTimestamp: getCurrentTimestamp,
                            senderEmail: '',
                            senderLandmark: '',
                            receiverEmail: '',
                            receiverLandmark: '',
                            orderId: '',
                            orderMileageCost: FFAppState().mileageCost,
                            bookerId: currentUserUid,
                            orderStatus: 'Pending',
                            reportOrderActive: false,
                          );
                          var bookOrderRecordReference =
                              BookOrderRecord.collection.doc();
                          await bookOrderRecordReference
                              .set(bookOrderCreateData);
                          bookOrderRef = BookOrderRecord.getDocumentFromData(
                              bookOrderCreateData, bookOrderRecordReference);
                          _shouldSetState = true;
                          logFirebaseEvent(
                              'PlaceBookingButton_Update-Local-State');
                          setState(() => FFAppState().mileageCost = 0.0);
                          logFirebaseEvent('PlaceBookingButton_Navigate-To');
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.bottomToTop,
                              duration: Duration(milliseconds: 250),
                              reverseDuration: Duration(milliseconds: 250),
                              child: BookingCompleteWidget(),
                            ),
                          );
                        } else {
                          logFirebaseEvent('PlaceBookingButton_Alert-Dialog');
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Insufficient Mileage'),
                                content: Text(
                                    'Sorry you do not have enough mileage to place booking. Top up or subscribe to a plan to place your order. Thanks'),
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
                        textStyle: FlutterFlowTheme.of(context).title1.override(
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
            ).animated([animationsMap['columnOnPageLoadAnimation']!]),
          ),
        );
      },
    );
  }
}
