import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../book_delivery/book_delivery_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../login_page/login_page_widget.dart';
import '../m_y_profile_page/m_y_profile_page_widget.dart';
import '../main_dashboard/main_dashboard_widget.dart';
import '../order_tracking/order_tracking_widget.dart';
import '../payment_page/payment_page_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryOrderListWidget extends StatefulWidget {
  const DeliveryOrderListWidget({
    Key? key,
    this.bookOrderDetails,
  }) : super(key: key);

  final DocumentReference? bookOrderDetails;

  @override
  _DeliveryOrderListWidgetState createState() =>
      _DeliveryOrderListWidgetState();
}

class _DeliveryOrderListWidgetState extends State<DeliveryOrderListWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
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
    'containerOnPageLoadAnimation2': AnimationInfo(
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
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'deliveryOrderList'});
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
            logFirebaseEvent('DELIVERY_ORDER_LIST_Icon_29r5fh0y_ON_TAP');
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
          'Orders',
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
              logFirebaseEvent('DELIVERY_ORDER_LIST_solidQuestionCircle_');
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
          logFirebaseEvent('DELIVERY_ORDER_LIST_FloatingActionButton');
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
                    logFirebaseEvent(
                        'DELIVERY_ORDER_LIST_ListTile_fpmk62jy_ON');
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
                  logFirebaseEvent('DELIVERY_ORDER_LIST_ListTile_a9lma957_ON');
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
                  logFirebaseEvent('DELIVERY_ORDER_LIST_ListTile_50ip5onw_ON');
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
                  logFirebaseEvent('DELIVERY_ORDER_LIST_ListTile_p3wq6h9g_ON');
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
                  logFirebaseEvent('DELIVERY_ORDER_LIST_ListTile_j4ygwetp_ON');
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
                  logFirebaseEvent('DELIVERY_ORDER_LIST_ListTile_e6gy2n7f_ON');
                  logFirebaseEvent('ListTile_Launch-U-R-L');
                  await launchURL('qonvay.freshesk.com');
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
                  logFirebaseEvent('DELIVERY_ORDER_LIST_ListTile_0mc47356_ON');
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                labelColor: FlutterFlowTheme.of(context).grayLight,
                labelStyle: FlutterFlowTheme.of(context).title3,
                indicatorColor: FlutterFlowTheme.of(context).grayDark,
                indicatorWeight: 5,
                tabs: [
                  Tab(
                    text: 'All Orders',
                  ),
                  Tab(
                    text: 'Delivered',
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).background,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              StreamBuilder<List<BookOrderRecord>>(
                                stream: queryBookOrderRecord(
                                  queryBuilder: (bookOrderRecord) =>
                                      bookOrderRecord
                                          .where('booker_id',
                                              isEqualTo: currentUserUid)
                                          .orderBy('order_timestamp',
                                              descending: true),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: SpinKitFadingGrid(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 50,
                                        ),
                                      ),
                                    );
                                  }
                                  List<BookOrderRecord>
                                      listViewBookOrderRecordList =
                                      snapshot.data!;
                                  if (listViewBookOrderRecordList.isEmpty) {
                                    return Center(
                                      child: Image.asset(
                                        'assets/images/No_Orders.png',
                                      ),
                                    );
                                  }
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        listViewBookOrderRecordList.length,
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewBookOrderRecord =
                                          listViewBookOrderRecordList[
                                              listViewIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16, 4, 16, 8),
                                        child: InkWell(
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'DELIVERY_ORDER_LIST_Container_yzjeaq9h_O');
                                            logFirebaseEvent(
                                                'Container_Navigate-To');
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 500),
                                                reverseDuration:
                                                    Duration(milliseconds: 500),
                                                child: OrderTrackingWidget(
                                                  orderRefParam:
                                                      listViewBookOrderRecord
                                                          .reference,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .darkBackground,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 12, 12, 12),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 12, 0),
                                                          child: Text(
                                                            listViewBookOrderRecord
                                                                .receiverName!
                                                                .maybeHandleOverflow(
                                                              maxChars: 12,
                                                              replacement: '…',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .title3,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 20,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(2,
                                                                      0, 2, 0),
                                                          child: Text(
                                                            listViewBookOrderRecord
                                                                .orderStatus!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .darkBackground,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(
                                                    thickness: 1,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .background,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 5),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          listViewBookOrderRecord
                                                              .orderMileageCost!
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(1,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            'km',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(8,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            dateTimeFormat(
                                                                'yMMMd',
                                                                listViewBookOrderRecord
                                                                    .orderTimestamp!),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText2,
                                                          ),
                                                        ),
                                                        if (listViewBookOrderRecord
                                                                .reportOrderActive ??
                                                            true)
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'Under Review',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Lexend Deca',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .errorRed,
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
                                        ).animated([
                                          animationsMap[
                                              'containerOnPageLoadAnimation1']!
                                        ]),
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).background,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                StreamBuilder<List<BookOrderRecord>>(
                                  stream: queryBookOrderRecord(
                                    queryBuilder: (bookOrderRecord) =>
                                        bookOrderRecord
                                            .where('booker_id',
                                                isEqualTo: currentUserUid)
                                            .where('order_status',
                                                isEqualTo: 'Item Delivered')
                                            .orderBy('order_timestamp',
                                                descending: true),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: SpinKitFadingGrid(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 50,
                                          ),
                                        ),
                                      );
                                    }
                                    List<BookOrderRecord>
                                        listViewBookOrderRecordList =
                                        snapshot.data!;
                                    if (listViewBookOrderRecordList.isEmpty) {
                                      return Center(
                                        child: Image.asset(
                                          'assets/images/No_Orders.png',
                                        ),
                                      );
                                    }
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      primary: false,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewBookOrderRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewBookOrderRecord =
                                            listViewBookOrderRecordList[
                                                listViewIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 4, 16, 8),
                                          child: InkWell(
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'DELIVERY_ORDER_LIST_Container_u1558272_O');
                                              logFirebaseEvent(
                                                  'Container_Navigate-To');
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType.fade,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  reverseDuration: Duration(
                                                      milliseconds: 500),
                                                  child: OrderTrackingWidget(
                                                    orderRefParam:
                                                        listViewBookOrderRecord
                                                            .reference,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .darkBackground,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 12, 12, 12),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        12,
                                                                        0),
                                                            child: Text(
                                                              listViewBookOrderRecord
                                                                  .receiverName!
                                                                  .maybeHandleOverflow(
                                                                maxChars: 12,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title3,
                                                            ),
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons.fact_check,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          size: 24,
                                                        ),
                                                      ],
                                                    ),
                                                    Divider(
                                                      thickness: 1,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .grayDark,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 5),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            listViewBookOrderRecord
                                                                .orderMileageCost!
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        1,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'km',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              dateTimeFormat(
                                                                  'yMMMd',
                                                                  listViewBookOrderRecord
                                                                      .orderTimestamp!),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ).animated([
                                            animationsMap[
                                                'containerOnPageLoadAnimation2']!
                                          ]),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
