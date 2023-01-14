// ignore_for_file: unused_import, unnecessary_import, unused_local_variable

import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_paystack/flutter_paystack.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_credit_card_form.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main_dashboard/main_dashboard_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SubscribeMileageWidget extends StatefulWidget {
  const SubscribeMileageWidget({Key? key}) : super(key: key);

  @override
  _SubscribeMileageWidgetState createState() => _SubscribeMileageWidgetState();
}

class _SubscribeMileageWidgetState extends State<SubscribeMileageWidget>
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
  final creditCardFormKey = GlobalKey<FormState>();
  CreditCardModel creditCardInfo = emptyCreditCard();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String publicKeyTest =
      'pk_live_88c6cc1477313b676878e1fa5af5cf170c1498c9'; //pass in the public test key obtained from paystack dashboard here

  final plugin = PaystackPlugin();

  @override
  void initState() {
    super.initState();
    plugin.initialize(publicKey: publicKeyTest);

    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'subscribeMileage'});
  }

  //a method to show the message
  void _showMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //used to generate a unique reference for payment
  String _getReference() {
    var platform = (Platform.isIOS) ? 'iOS' : 'Android';
    final thisDate = DateTime.now().millisecondsSinceEpoch;
    // return 'ChargedFrom${platform}_$thisDate';
    return '$thisDate';
  }

  //async method to charge users card and return a response
  chargeCard(int balance, int km) async {
    var user = FirebaseAuth.instance.currentUser;
    var charge = Charge()
      ..amount = balance *
          100 //the money should be in kobo hence the need to multiply the value by 100
      ..reference = _getReference()
      ..putCustomField('custom_id',
          '846gey6w') //to pass extra parameters to be retrieved on the response from Paystack
      ..email = user!.email;

    CheckoutResponse response = await plugin.checkout(
      context,
      method: CheckoutMethod.card,
      charge: charge,
    );

    //check if the response is true or not
    if (response.status == true) {
      //you can send some data from the response to an API or use webhook to record the payment on a database
      updateBalance(km, balance);
    } else {
      //the payment wasn't successsful or the user cancelled the payment
      _showMessage('Payment Failed!!!');
    }
  }

  void updateBalance(int km, int amount) async {
    final usersUpdateData = {
      'mileage_balance': FieldValue.increment(km),
      'subscription_date': DateTime.now(),
      'no_of_payment': FieldValue.increment(1),
    };

    await currentUserReference!
        .set(usersUpdateData, SetOptions(merge: true))
        .then((value) {
      var uid = FirebaseAuth.instance.currentUser!.uid;
      var transcationData = createTransactionsRecordData(
        amount: amount.toDouble(),
        mileagePurchased: km.toDouble(),
        purchaserId: uid,
        transactionTimestamp: DateTime.now(),
      );
      FirebaseFirestore.instance
          .collection('transactions')
          .add(transcationData)
          .then((value) {
        _showMessage('Payment was successful!!!');
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: ((context) => MainDashboardWidget()),
          ),
        );
      });
    });
  }

  void showBottomSheet(int amount, int km) async {
    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      context: context,
      builder: (ctx) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            height: 180,
            // child: MaterialButton(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   height: 40,
            //   color: FlutterFlowTheme.of(context).primaryColor,
            //   onPressed: () {
            //     chargeCard(amount, km);
            //   },
            //   child: Text(
            //     'Pay Now',
            //   ),
            // ),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).background,
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FFButtonWidget(
                          onPressed: () async {
                            chargeCard(amount, km);
                          },
                          text: 'Pay Now',
                          options: FFButtonOptions(
                            width: 200,
                            height: 50,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).title3.override(
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
                      ],
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

  @override
  Widget build(BuildContext context) {
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
        List<UsersRecord> subscribeMileageUsersRecordList = snapshot.data!;
        // Return an empty Container when the document does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final subscribeMileageUsersRecord =
            subscribeMileageUsersRecordList.isNotEmpty
                ? subscribeMileageUsersRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).darkBackground,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).background,
                    boxShadow: [
                      BoxShadow(
                        color: FlutterFlowTheme.of(context).background,
                      )
                    ],
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 44, 20, 20),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Subscribe',
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 30,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'TOPUP_MILEAGE_close_rounded_ICN_ON_TAP');
                                    logFirebaseEvent(
                                        'IconButton_Update-Local-State');
                                    setState(
                                        () => FFAppState().ngnToKmCheck = 0.0);
                                    logFirebaseEvent(
                                        'IconButton_Navigate-Back');
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                            child: Text(
                              'Select a delivery mileage bundle to proceed.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    fontSize: 16,
                                  ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 100,
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.8,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).darkBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: InkWell(
                                onTap: () {
                                  showBottomSheet(10000, 120);

                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           PaystackCardMethod()),
                                  // );
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showBottomSheet(10000, 120);
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           PaystackCardMethod()),
                                        // );
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Starter',
                                            style: FlutterFlowTheme.of(context)
                                                .title3
                                                .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .grayLight),
                                          ),
                                          Text(
                                            'NGN 10,000',
                                            style: FlutterFlowTheme.of(context)
                                                .title3
                                                .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .textColor),
                                          ),
                                          Icon(
                                            Icons.payment,
                                            color: FlutterFlowTheme.of(context)
                                                .grayDark,
                                            size: 30,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      '120km max per month',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            fontFamily: 'Lexend Deca',
                                            fontSize: 16,
                                            fontStyle: FontStyle.italic,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 100,
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.8,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).darkBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => Pro()),
                                  // );
                                  showBottomSheet(20000, 180);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showBottomSheet(20000, 180);
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           PaystackCardMethod()),
                                        // );
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Personal',
                                            style: FlutterFlowTheme.of(context)
                                                .title3
                                                .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .grayLight),
                                          ),
                                          Text(
                                            'NGN 20,000',
                                            style: FlutterFlowTheme.of(context)
                                                .title3
                                                .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .textColor),
                                          ),
                                          Icon(
                                            Icons.payment,
                                            color: FlutterFlowTheme.of(context)
                                                .grayDark,
                                            size: 30,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      '250km max per month',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            fontFamily: 'Lexend Deca',
                                            fontSize: 16,
                                            fontStyle: FontStyle.italic,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 100,
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.8,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).darkBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => Elite()),
                                  // );
                                  showBottomSheet(50000, 800);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showBottomSheet(50000, 800);
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           PaystackCardMethod()),
                                        // );
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Pro',
                                            style: FlutterFlowTheme.of(context)
                                                .title3
                                                .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .grayLight),
                                          ),
                                          Text(
                                            'NGN 50,000',
                                            style: FlutterFlowTheme.of(context)
                                                .title3
                                                .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .textColor),
                                          ),
                                          Icon(
                                            Icons.payment,
                                            color: FlutterFlowTheme.of(context)
                                                .grayDark,
                                            size: 30,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      '800km max per month',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            fontFamily: 'Lexend Deca',
                                            fontSize: 16,
                                            fontStyle: FontStyle.italic,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 100,
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.8,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(context).darkBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x33000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => Elite()),
                                  // );
                                  showBottomSheet(100000, 2000);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showBottomSheet(100000, 2000);
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           PaystackCardMethod()),
                                        // );
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Business',
                                            style: FlutterFlowTheme.of(context)
                                                .title3
                                                .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .grayLight),
                                          ),
                                          Text(
                                            'NGN 100,000',
                                            style: FlutterFlowTheme.of(context)
                                                .title3
                                                .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .textColor),
                                          ),
                                          Icon(
                                            Icons.payment,
                                            color: FlutterFlowTheme.of(context)
                                                .grayDark,
                                            size: 30,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      '2000km max per month',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            fontFamily: 'Lexend Deca',
                                            fontSize: 16,
                                            fontStyle: FontStyle.italic,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ).animated([animationsMap['columnOnPageLoadAnimation']!]),
        );
      },
    );
  }
}
