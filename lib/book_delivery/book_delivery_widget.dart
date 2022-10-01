import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../booking_page/booking_page_widget.dart';
import '../delivery_order_list/delivery_order_list_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login_page/login_page_widget.dart';
import '../m_y_profile_page/m_y_profile_page_widget.dart';
import '../main_dashboard/main_dashboard_widget.dart';
import '../payment_page/payment_page_widget.dart';
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
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 30),
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
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
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
                onPressed: () async {
                  logFirebaseEvent('BOOK_DELIVERY_solidQuestionCircle_ICN_ON');
                  logFirebaseEvent('IconButton_Launch-U-R-L');
                  await launchURL('https://qonvay.freshdesk.com');
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
                  InkWell(
                    onTap: () async {
                      logFirebaseEvent(
                          'BOOK_DELIVERY_ListTile_k1uidqlr_ON_TAP');
                      logFirebaseEvent('ListTile_Launch-U-R-L');
                      await launchURL('https://qonvay.freshdesk.com');
                    },
                    child: ListTile(
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Place Booking',
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('BOOK_DELIVERY_ADD_DELIVERY_BTN_ON_TAP');
                      logFirebaseEvent('Button_Navigate-To');
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 500),
                          reverseDuration: Duration(milliseconds: 500),
                          child: BookingPageWidget(),
                        ),
                      );
                    },
                    text: 'Add Delivery',
                    icon: Icon(
                      Icons.add,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 15,
                    ),
                    options: FFButtonOptions(
                      width: 200,
                      height: 70,
                      color: FlutterFlowTheme.of(context).darkBackground,
                      textStyle: FlutterFlowTheme.of(context)
                          .subtitle2
                          .override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).primaryColor,
                            fontSize: 18,
                          ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Divider(
                  height: 2,
                  thickness: 2,
                  indent: 30,
                  endIndent: 30,
                  color: FlutterFlowTheme.of(context).grayDark,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Builder(
                    builder: (context) {
                      final bookings = FFAppState().receiverLocations.toList();
                      if (bookings.isEmpty) {
                        return Center(
                          child: Image.asset(
                            'assets/images/no_available_bookings.png',
                          ),
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: bookings.length,
                        itemBuilder: (context, bookingsIndex) {
                          final bookingsItem = bookings[bookingsIndex];
                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 4, 16, 8),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).darkBackground,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 12, 12, 12),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 12, 0),
                                            child: Text(
                                              'Booking Placed',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title3,
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.check_box,
                                          color: FlutterFlowTheme.of(context)
                                              .grayDark,
                                          size: 30,
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color: FlutterFlowTheme.of(context)
                                          .background,
                                    ),
                                  ],
                                ),
                              ),
                            ).animated([
                              animationsMap['containerOnPageLoadAnimation']!
                            ]),
                          );
                        },
                      );
                    },
                  ),
                ),
                if (FFAppState().milbaltemp != null &&
                    FFAppState().milbaltemp != '')
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('BOOK_DELIVERY_PAGE_DONE_BTN_ON_TAP');
                        logFirebaseEvent('Button_Update-Local-State');
                        setState(() => FFAppState().receiverLocations = []);
                        logFirebaseEvent('Button_Update-Local-State');
                        setState(() => FFAppState().receiverName = '');
                        logFirebaseEvent('Button_Update-Local-State');
                        setState(() => FFAppState().milbaltemp = '');
                        logFirebaseEvent('Button_Navigate-To');
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
                      text: 'Done',
                      options: FFButtonOptions(
                        width: 230,
                        height: 56,
                        color: FlutterFlowTheme.of(context).primaryColor,
                        textStyle: FlutterFlowTheme.of(context)
                            .subtitle2
                            .override(
                              fontFamily: 'Lexend Deca',
                              color:
                                  FlutterFlowTheme.of(context).darkBackground,
                              fontSize: 16,
                            ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
