import 'dart:async';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_paystack/flutter_paystack.dart';

import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_credit_card_form.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main_dashboard/main_dashboard_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class TopupMileageWidget extends StatefulWidget {
  const TopupMileageWidget({Key? key}) : super(key: key);

  @override
  _TopupMileageWidgetState createState() => _TopupMileageWidgetState();
}

class _TopupMileageWidgetState extends State<TopupMileageWidget>
    with TickerProviderStateMixin {
  TextEditingController? amountNGNmileageController = TextEditingController();

  final creditCardFormKey = GlobalKey<FormState>();
  CreditCardModel creditCardInfo = emptyCreditCard();
  final formKey = GlobalKey<FormState>();
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
    'textFieldOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 40),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
  };
  String publicKeyTest =
      'pk_live_88c6cc1477313b676878e1fa5af5cf170c1498c9'; //pass in the public test key obtained from paystack dashboard here

  final plugin = PaystackPlugin();

  @override
  void initState() {
    super.initState();
    FFAppState().ngnToKmCheck = 0.0;
    plugin.initialize(publicKey: publicKeyTest);

    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    amountNGNmileageController = TextEditingController();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'topupMileage'});
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
    return '$thisDate';
    // return 'ChargedFrom${platform}_$thisDate';
  }

  //async method to charge users card and return a response
  chargeCard() async {
    var user = FirebaseAuth.instance.currentUser;
    var charge = Charge()
      ..amount = amountNGNmileageController!.text == null ||
              amountNGNmileageController!.text == '' ||
              amountNGNmileageController == null
          ? 0
          : int.parse(amountNGNmileageController!.text) *
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
      updateBalance();
      //you can send some data from the response to an API or use webhook to record the payment on a database
      // _showMessage('Payment was successful!!!');
      //

    } else {
      //the payment wasn't successsful or the user cancelled the payment
      _showMessage('Payment Failed!!!');
    }
  }

  void updateBalance() async {
    if (amountNGNmileageController!.text == '') {
      _showMessage('Balance should be greater than 0');
    } else {
      final usersUpdateData = {
        'mileage_balance': FieldValue.increment(FFAppState().ngnToKmCheck),
        'no_of_payment': FieldValue.increment(1),
      };

      await currentUserReference!
          .set(usersUpdateData, SetOptions(merge: true))
          .then((value) {
        var uid = FirebaseAuth.instance.currentUser!.uid;
        var transcationData = createTransactionsRecordData(
          amount: double.parse(amountNGNmileageController!.text),
          mileagePurchased: FFAppState().ngnToKmCheck,
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
  }

  void showBottomSheet() async {
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
                            chargeCard();
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
    // print('value of price is : ${amountNGNmileageController!.text}');
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
        List<UsersRecord> topupMileageUsersRecordList = snapshot.data!;
        // Return an empty Container when the document does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final topupMileageUsersRecord = topupMileageUsersRecordList.isNotEmpty
            ? topupMileageUsersRecordList.first
            : null;
        return Scaffold(
          resizeToAvoidBottomInset: false,
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).darkBackground,
          body: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
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
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 44, 20, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Top Up Mileage',
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
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 100,
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.8,
                            ),
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                              child: TextFormField(
                                controller: amountNGNmileageController,
                                onChanged: (_) => EasyDebounce.debounce(
                                  'amountNGNmileageController',
                                  Duration(milliseconds: 500),
                                  () async {
                                    logFirebaseEvent(
                                        'TOPUP_MILEAGE_amountNGNmileage_ON_TEXTFI');
                                    logFirebaseEvent(
                                        'amountNGNmileage_Update-Local-State');
                                    setState(() => FFAppState().ngnToKmCheck =
                                        functions.ngnToKm(double.parse(
                                            amountNGNmileageController!.text)));
                                  },
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .grayLight,
                                        fontWeight: FontWeight.w300,
                                      ),
                                  hintText: 'Amount (NGN)',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .title1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .grayLight,
                                        fontWeight: FontWeight.w300,
                                      ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).grayDark,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).grayDark,
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          20, 24, 24, 24),
                                ),
                                style: FlutterFlowTheme.of(context).title1,
                                textAlign: TextAlign.center,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        signed: true, decimal: true),
                              ).animated([
                                animationsMap['textFieldOnPageLoadAnimation']!
                              ]),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 5, 0, 10),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 50,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    FFAppState().ngnToKmCheck.toString(),
                                    style: FlutterFlowTheme.of(context).title3,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2, 0, 0, 0),
                                    child: Text(
                                      'km',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: FlutterFlowTheme.of(context).grayDark,
                          ),
                          // Padding(
                          //   padding:
                          //       EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                          //   child: FlutterFlowCreditCardForm(
                          //     formKey: creditCardFormKey,
                          //     creditCardModel: creditCardInfo,
                          //     obscureNumber: true,
                          //     obscureCvv: true,
                          //     spacing: 10,
                          //     textStyle: FlutterFlowTheme.of(context).title3,
                          //     inputDecoration: InputDecoration(
                          //       enabledBorder: OutlineInputBorder(
                          //         borderSide: BorderSide(
                          //           color:
                          //               FlutterFlowTheme.of(context).grayDark,
                          //           width: 3,
                          //         ),
                          //         borderRadius: BorderRadius.circular(4),
                          //       ),
                          //       focusedBorder: OutlineInputBorder(
                          //         borderSide: BorderSide(
                          //           color:
                          //               FlutterFlowTheme.of(context).grayDark,
                          //           width: 3,
                          //         ),
                          //         borderRadius: BorderRadius.circular(4),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 40, 20, 20),
                            child: FFButtonWidget(
                              onPressed: () async {
                                showBottomSheet();
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => Toper()),
                                // );
                              },
                              text: 'Top Up',
                              icon: Icon(
                                Icons.payment,
                                color:
                                    FlutterFlowTheme.of(context).darkBackground,
                                size: 24,
                              ),
                              options: FFButtonOptions(
                                width: 300,
                                height: 80,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
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
                  ),
                ),
              ],
            ).animated([animationsMap['columnOnPageLoadAnimation']!]),
          ),
        );
      },
    );
  }
}
