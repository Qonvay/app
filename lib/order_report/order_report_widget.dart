import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderReportWidget extends StatefulWidget {
  const OrderReportWidget({
    Key? key,
    this.orderRefParam,
  }) : super(key: key);

  final DocumentReference? orderRefParam;

  @override
  _OrderReportWidgetState createState() => _OrderReportWidgetState();
}

class _OrderReportWidgetState extends State<OrderReportWidget>
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
  String? statusSelectValue;
  TextEditingController? descriptionController;
  final formKey = GlobalKey<FormState>();
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

    descriptionController = TextEditingController();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'orderReport'});
  }

  @override
  void dispose() {
    descriptionController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<BookOrderRecord>(
      stream: BookOrderRecord.getDocument(widget.orderRefParam!),
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
        final orderReportBookOrderRecord = snapshot.data!;
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
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 44, 20, 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Report Order',
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
                                      'ORDER_REPORT_close_rounded_ICN_ON_TAP');
                                  logFirebaseEvent('IconButton_navigate_back');
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                        if (orderReportBookOrderRecord.reportOrderActive ??
                            true)
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: Text(
                              'Already Under Review...',
                              style: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color:
                                        FlutterFlowTheme.of(context).errorRed,
                                  ),
                            ),
                          ),
                        FutureBuilder<List<BookOrderRecord>>(
                          future: queryBookOrderRecordOnce(
                            queryBuilder: (bookOrderRecord) => bookOrderRecord
                                .where('booker_id', isEqualTo: currentUserUid),
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
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 50,
                                  ),
                                ),
                              );
                            }
                            List<BookOrderRecord>
                                reportOrderFormBookOrderRecordList =
                                snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final reportOrderFormBookOrderRecord =
                                reportOrderFormBookOrderRecordList.isNotEmpty
                                    ? reportOrderFormBookOrderRecordList.first
                                    : null;
                            return Form(
                              key: formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          constraints: BoxConstraints(
                                            maxWidth: 570,
                                          ),
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Divider(
                                                height: 1,
                                                thickness: 1,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 12, 16, 0),
                                                child:
                                                    FlutterFlowDropDown<String>(
                                                  options: [
                                                    'Not Deiivered',
                                                    'Order not picked up',
                                                    'Cancel Order',
                                                    'Rude Rider'
                                                  ],
                                                  onChanged: (val) => setState(
                                                      () => statusSelectValue =
                                                          val),
                                                  width: double.infinity,
                                                  height: 60,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            fontSize: 16,
                                                          ),
                                                  hintText: 'Select Status',
                                                  icon: Icon(
                                                    Icons
                                                        .keyboard_arrow_down_rounded,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 15,
                                                  ),
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .darkBackground,
                                                  elevation: 2,
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .darkBackground,
                                                  borderWidth: 2,
                                                  borderRadius: 8,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(24, 4, 12, 4),
                                                  hidesUnderline: true,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 16, 16, 0),
                                                child: TextFormField(
                                                  controller:
                                                      descriptionController,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        'Enter further details here...',
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyText2
                                                            .override(
                                                              fontFamily:
                                                                  'Lexend Deca',
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .grayLight,
                                                              fontSize: 16,
                                                            ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .darkBackground,
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .darkBackground,
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0x00000000),
                                                        width: 2,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .darkBackground,
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20, 32, 20, 12),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .textColor,
                                                        fontSize: 16,
                                                      ),
                                                  textAlign: TextAlign.start,
                                                  maxLines: 4,
                                                  keyboardType:
                                                      TextInputType.multiline,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 24, 0, 16),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              logFirebaseEvent(
                                                  'ORDER_REPORT_PAGE_REPORT_BTN_ON_TAP');
                                              logFirebaseEvent(
                                                  'Button_validate_form');
                                              if (formKey.currentState ==
                                                      null ||
                                                  !formKey.currentState!
                                                      .validate()) {
                                                return;
                                              }

                                              logFirebaseEvent(
                                                  'Button_backend_call');

                                              final bookOrderUpdateData =
                                                  createBookOrderRecordData(
                                                reportOrderStatus:
                                                    statusSelectValue,
                                                reportOrderDescription:
                                                    descriptionController!.text,
                                                reportOrderActive: true,
                                              );
                                              await reportOrderFormBookOrderRecord!
                                                  .reference
                                                  .update(bookOrderUpdateData);
                                              logFirebaseEvent(
                                                  'Button_navigate_back');
                                              Navigator.pop(context);
                                            },
                                            text: 'Report',
                                            options: FFButtonOptions(
                                              width: 270,
                                              height: 50,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              textStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .subtitle1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .darkBackground,
                                                  ),
                                              elevation: 3,
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!),
        );
      },
    );
  }
}
