import '../auth/auth_util.dart';
import '../book_delivery/book_delivery_widget.dart';
import '../delivery_order_list/delivery_order_list_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login_page/login_page_widget.dart';
import '../m_y_profile_page/m_y_profile_page_widget.dart';
import '../main_dashboard/main_dashboard_widget.dart';
import '../subscribe_mileage/subscribe_mileage_widget.dart';
import '../topup_mileage/topup_mileage_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentPageWidget extends StatefulWidget {
  const PaymentPageWidget({Key? key}) : super(key: key);

  @override
  _PaymentPageWidgetState createState() => _PaymentPageWidgetState();
}

class _PaymentPageWidgetState extends State<PaymentPageWidget>
    with TickerProviderStateMixin {
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
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'paymentPage'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).background,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            logFirebaseEvent('PAYMENT_PAGE_PAGE_Icon_77zjk4km_ON_TAP');
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
          'Purchase Mileage',
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
              logFirebaseEvent('PAYMENT_solidQuestionCircle_ICN_ON_TAP');
              logFirebaseEvent('IconButton_Launch-U-R-L');
              await launchURL('qonvay.freshdesk.com');
            },
          ),
        ],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).background,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          logFirebaseEvent('PAYMENT_FloatingActionButton_8tannrg5_ON');
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
                      padding: EdgeInsetsDirectional.fromSTEB(15, 100, 15, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
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
                            padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
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
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: InkWell(
                  onTap: () async {
                    logFirebaseEvent('PAYMENT_ListTile_7wqs85vw_ON_TAP');
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
                  logFirebaseEvent('PAYMENT_ListTile_ghxspng2_ON_TAP');
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
                  logFirebaseEvent('PAYMENT_ListTile_ckdznvzv_ON_TAP');
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
                  logFirebaseEvent('PAYMENT_ListTile_u05rkiza_ON_TAP');
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
                  logFirebaseEvent('PAYMENT_ListTile_btecgkg9_ON_TAP');
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
                  logFirebaseEvent('PAYMENT_ListTile_vw4co01o_ON_TAP');
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
                  logFirebaseEvent('PAYMENT_ListTile_0rpkaxg7_ON_TAP');
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).background,
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        'Top up mileage units or Subscribe to SAVE even more on delivery fees.',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.of(context).grayLight,
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                            ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'PAYMENT_TOP_UP_MILEAGE_BTN_ON_TAP');
                            logFirebaseEvent('Button_Navigate-To');
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 500),
                                reverseDuration: Duration(milliseconds: 500),
                                child: TopupMileageWidget(),
                              ),
                            );
                          },
                          text: 'Top Up Mileage',
                          options: FFButtonOptions(
                            width: 300,
                            height: 100,
                            color: FlutterFlowTheme.of(context).darkBackground,
                            textStyle: FlutterFlowTheme.of(context).title1,
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
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'PAYMENT_PAGE_PAGE_SUBSCRIBE_BTN_ON_TAP');
                            logFirebaseEvent('Button_Navigate-To');
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 500),
                                reverseDuration: Duration(milliseconds: 500),
                                child: SubscribeMileageWidget(),
                              ),
                            );
                          },
                          text: 'Subscribe',
                          options: FFButtonOptions(
                            width: 300,
                            height: 100,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).title1.override(
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
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Text(
                    'Gtbank : 0655568882\nAccount Name : Qonvay Logistics Limited',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).title3,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: Text(
                    'After bank transfer, send receipt of payment to payments@qonvay.com to get your mileage units.',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          fontSize: 16,
                        ),
                  ),
                ),
              ],
            ),
          ).animated([animationsMap['columnOnPageLoadAnimation']!]),
        ),
      ),
    );
  }
}
