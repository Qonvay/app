import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SetReceiverLocation2Widget extends StatefulWidget {
  const SetReceiverLocation2Widget({
    Key key,
    this.transactionDetails,
    this.userSpent,
  }) : super(key: key);

  final DocumentReference transactionDetails;
  final DocumentReference userSpent;

  @override
  _SetReceiverLocation2WidgetState createState() =>
      _SetReceiverLocation2WidgetState();
}

class _SetReceiverLocation2WidgetState
    extends State<SetReceiverLocation2Widget> {
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  TextEditingController textController4;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController(text: 'Search Location');
    textController2 = TextEditingController(text: 'Full Address');
    textController3 = TextEditingController(text: 'Landmark (Optional)');
    textController4 = TextEditingController(text: 'Direction (Optional)');
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TransactionsRecord>(
      stream: TransactionsRecord.getDocument(widget.transactionDetails),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: SpinKitSquareCircle(
                color: FlutterFlowTheme.primaryColor,
                size: 40,
              ),
            ),
          );
        }
        final setReceiverLocation2TransactionsRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.background,
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.chevron_left_rounded,
                color: FlutterFlowTheme.textColor,
                size: 32,
              ),
            ),
            title: Text(
              'Set Receiver\'s Location',
              style: FlutterFlowTheme.title3,
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: FlutterFlowTheme.background,
          body: Container(
            width: double.infinity,
            height: 700,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.background,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                  child: TextFormField(
                    controller: textController1,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Search Location',
                      labelStyle: FlutterFlowTheme.bodyText1,
                      hintText: '[Some hint text...]',
                      hintStyle: FlutterFlowTheme.bodyText1,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.grayDark,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.grayDark,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    ),
                    style: FlutterFlowTheme.bodyText1,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.streetAddress,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                  child: TextFormField(
                    controller: textController2,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Full Address',
                      labelStyle: FlutterFlowTheme.bodyText1,
                      hintText: '[Some hint text...]',
                      hintStyle: FlutterFlowTheme.bodyText1,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.grayDark,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.grayDark,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    ),
                    style: FlutterFlowTheme.bodyText1,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.streetAddress,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                  child: TextFormField(
                    controller: textController3,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Landmark',
                      labelStyle: FlutterFlowTheme.bodyText1,
                      hintText: '[Some hint text...]',
                      hintStyle: FlutterFlowTheme.bodyText1,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.grayDark,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.grayDark,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    ),
                    style: FlutterFlowTheme.bodyText1,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                  child: TextFormField(
                    controller: textController4,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Direction',
                      labelStyle: FlutterFlowTheme.bodyText1,
                      hintText: '[Some hint text...]',
                      hintStyle: FlutterFlowTheme.bodyText1,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.grayDark,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.grayDark,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    ),
                    style: FlutterFlowTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () {
                      print('Button pressed ...');
                    },
                    text: 'Save',
                    options: FFButtonOptions(
                      width: 330,
                      height: 40,
                      color: FlutterFlowTheme.primaryColor,
                      textStyle: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.darkBackground,
                      ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 12,
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
