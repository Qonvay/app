import '../backend/backend.dart';
import '../book_delivery/book_delivery_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookingCompleteWidget extends StatefulWidget {
  const BookingCompleteWidget({
    Key? key,
    this.mileageCost,
    this.bookingParam,
  }) : super(key: key);

  final double? mileageCost;
  final DocumentReference? bookingParam;

  @override
  _BookingCompleteWidgetState createState() => _BookingCompleteWidgetState();
}

class _BookingCompleteWidgetState extends State<BookingCompleteWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'bookingComplete'});
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
        List<UsersRecord> bookingCompleteUsersRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final bookingCompleteUsersRecord =
            bookingCompleteUsersRecordList.isNotEmpty
                ? bookingCompleteUsersRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/package.png',
                      width: 250,
                      height: 250,
                      fit: BoxFit.fitHeight,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: Text(
                    'Delivery Scheduled',
                    style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.of(context).background,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Great work, you successfully placed your order. Allow a few minutes for a Qonvay Pilot to contact you to get started!',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyText2
                              .override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.of(context).background,
                                fontSize: 16,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 70),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'BOOKING_COMPLETE_PAGE_GREAT!_BTN_ON_TAP');
                      logFirebaseEvent('Button_navigate_to');
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.leftToRight,
                          duration: Duration(milliseconds: 200),
                          reverseDuration: Duration(milliseconds: 200),
                          child: BookDeliveryWidget(
                            bookingParam: 0.0,
                          ),
                        ),
                      );
                    },
                    text: 'Great!',
                    options: FFButtonOptions(
                      width: 200,
                      height: 60,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle: FlutterFlowTheme.of(context).title1.override(
                            fontFamily: 'Lexend Deca',
                            color: FlutterFlowTheme.of(context).darkBackground,
                          ),
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).background,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
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
