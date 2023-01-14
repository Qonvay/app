import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../book_delivery/book_delivery_widget.dart';
import '../delivery_order_list/delivery_order_list_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../greeting/greeting_widget.dart';
import '../m_y_profile_page/m_y_profile_page_widget.dart';
import '../main_dashboard/main_dashboard_widget.dart';
import '../payment_page/payment_page_widget.dart';
import '../subscribe_mileage/subscribe_mileage_widget.dart';
import '../topup_mileage/topup_mileage_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PayWallWidget extends StatefulWidget {
  const PayWallWidget({
    Key? key,
    this.buyMileageParam,
    this.subscribeParam,
    this.mileageCostParam,
  }) : super(key: key);

  final double? buyMileageParam;
  final double? subscribeParam;
  final double? mileageCostParam;

  @override
  _PayWallWidgetState createState() => _PayWallWidgetState();
}

class _PayWallWidgetState extends State<PayWallWidget>
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
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'payWall'});
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<UsersRecord>>(
      stream: queryUsersRecord(
        singleRecord: true,
      ),
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
        List<UsersRecord> payWallUsersRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final payWallUsersRecord = payWallUsersRecordList.isNotEmpty
            ? payWallUsersRecordList.first
            : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).background,
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
                                    builder: (context) => Container(
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
                                builder: (context) => Text(
                                  valueOrDefault(
                                      currentUserDocument?.firstName, ''),
                                  style: FlutterFlowTheme.of(context).title3,
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Text(
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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        logFirebaseEvent(
                            'PAY_WALL_PAGE_ListTile_c4l9p3iw_ON_TAP');
                        logFirebaseEvent('ListTile_navigate_to');
                        await Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            duration: Duration(milliseconds: 300),
                            reverseDuration: Duration(milliseconds: 300),
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
                          'PAY_WALL_PAGE_ListTile_f8qscmgx_ON_TAP');
                      logFirebaseEvent('ListTile_navigate_to');
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
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
                          'PAY_WALL_PAGE_ListTile_yti3eu6h_ON_TAP');
                      logFirebaseEvent('ListTile_navigate_to');
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
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
                          'PAY_WALL_PAGE_ListTile_cf4pfhrz_ON_TAP');
                      logFirebaseEvent('ListTile_navigate_to');
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
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
                          'PAY_WALL_PAGE_ListTile_7pcmc5yt_ON_TAP');
                      logFirebaseEvent('ListTile_navigate_to');
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
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
                          'PAY_WALL_PAGE_ListTile_70m6zkrw_ON_TAP');
                      logFirebaseEvent('ListTile_auth');
                      await signOut();
                      await Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          duration: Duration(milliseconds: 300),
                          reverseDuration: Duration(milliseconds: 300),
                          child: GreetingWidget(),
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
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).background,
            automaticallyImplyLeading: false,
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
                  logFirebaseEvent('PAY_WALL_solidQuestionCircle_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_launch_u_r_l');
                  await launchURL('https://qonvay.freshdesk.com');
                },
              ),
            ],
            centerTitle: false,
            elevation: 0,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 40),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Hello,',
                                    style: FlutterFlowTheme.of(context)
                                        .title3
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          fontSize: 18,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 0, 0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Text(
                                        valueOrDefault(
                                                currentUserDocument?.firstName,
                                                '')
                                            .maybeHandleOverflow(
                                          maxChars: 10,
                                          replacement: '…',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .title3
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              fontSize: 18,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        1, 0, 0, 0),
                                    child: Text(
                                      '!',
                                      style: FlutterFlowTheme.of(context)
                                          .title3
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'You\'re Out Of Mileage.',
                        style: FlutterFlowTheme.of(context).title1,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/images/no_mileage.png',
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Subscribe to a bundle or Top Up\nto continue using our app.',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).title3,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 90),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'PAY_WALL_PAGE_TOP_UP_MILEAGE_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          duration: Duration(milliseconds: 300),
                                          reverseDuration:
                                              Duration(milliseconds: 300),
                                          child: TopupMileageWidget(),
                                        ),
                                      );
                                    },
                                    text: 'Top Up Mileage',
                                    options: FFButtonOptions(
                                      width: 300,
                                      height: 100,
                                      color: FlutterFlowTheme.of(context)
                                          .darkBackground,
                                      textStyle:
                                          FlutterFlowTheme.of(context).title1,
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
                          Text(
                            'OR',
                            style: FlutterFlowTheme.of(context).title1,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'PAY_WALL_PAGE_SUBSCRIBE_BTN_ON_TAP');
                                      logFirebaseEvent('Button_navigate_to');
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.fade,
                                          duration: Duration(milliseconds: 300),
                                          reverseDuration:
                                              Duration(milliseconds: 300),
                                          child: SubscribeMileageWidget(),
                                        ),
                                      );
                                    },
                                    text: 'Subscribe',
                                    options: FFButtonOptions(
                                      width: 300,
                                      height: 100,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .title1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .darkBackground,
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
                          Text(
                            'OR\n\nPay By Bank Transfer',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).title1,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Text(
                              'Gtbank : 0655568882\nAccount Name : Qonvay Logistics Limited',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).title3,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                            child: Text(
                              'After bank transfer, send receipt of payment to payments@qonvay.com to get your mileage units.',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    fontSize: 16,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ).animateOnPageLoad(
                        animationsMap['columnOnPageLoadAnimation']!),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
