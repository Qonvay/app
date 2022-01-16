import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../set_pickup_location2/set_pickup_location2_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SetPickupLocationWidget extends StatefulWidget {
  const SetPickupLocationWidget({
    Key key,
    this.transactionDetails,
    this.userSpent,
  }) : super(key: key);

  final DocumentReference transactionDetails;
  final DocumentReference userSpent;

  @override
  _SetPickupLocationWidgetState createState() =>
      _SetPickupLocationWidgetState();
}

class _SetPickupLocationWidgetState extends State<SetPickupLocationWidget> {
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  TextEditingController textController4;
  bool checkboxListTileValue1;
  bool checkboxListTileValue2;
  bool checkboxListTileValue3;
  bool checkboxListTileValue4;
  bool checkboxListTileValue5;
  bool checkboxListTileValue6;
  bool checkboxListTileValue7;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController(text: 'Customer Name');
    textController2 = TextEditingController(text: 'Email Address');
    textController3 = TextEditingController(text: 'Pickup Phone Number');
    textController4 = TextEditingController(text: 'Pickup Address');
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
        final setPickupLocationTransactionsRecord = snapshot.data;
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
              'Set Pickup Location',
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
                      labelText: 'Customer Name',
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
                  padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                  child: TextFormField(
                    controller: textController2,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Email',
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
                  padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                  child: TextFormField(
                    controller: textController3,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: '+234',
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
                    keyboardType: TextInputType.phone,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                  child: TextFormField(
                    controller: textController4,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Pickup Address',
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
                    keyboardType: TextInputType.phone,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: Text(
                    'Item Category',
                    style: FlutterFlowTheme.title3.override(
                      fontFamily: 'Lexend Deca',
                      fontSize: 16,
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
                    ),
                    child: CheckboxListTile(
                      value: checkboxListTileValue1 ??= false,
                      onChanged: (newValue) =>
                          setState(() => checkboxListTileValue1 = newValue),
                      title: Text(
                        'Food',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Lexend Deca',
                          fontSize: 16,
                        ),
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      activeColor: FlutterFlowTheme.primaryColor,
                      checkColor: FlutterFlowTheme.grayDark,
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
                    ),
                    child: CheckboxListTile(
                      value: checkboxListTileValue2 ??= true,
                      onChanged: (newValue) =>
                          setState(() => checkboxListTileValue2 = newValue),
                      title: Text(
                        'Clothing',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Lexend Deca',
                          fontSize: 16,
                        ),
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      activeColor: FlutterFlowTheme.primaryColor,
                      checkColor: FlutterFlowTheme.grayDark,
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
                    ),
                    child: CheckboxListTile(
                      value: checkboxListTileValue3 ??= true,
                      onChanged: (newValue) =>
                          setState(() => checkboxListTileValue3 = newValue),
                      title: Text(
                        'Shoes',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Lexend Deca',
                          fontSize: 16,
                        ),
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      activeColor: FlutterFlowTheme.primaryColor,
                      checkColor: FlutterFlowTheme.grayDark,
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
                    ),
                    child: CheckboxListTile(
                      value: checkboxListTileValue4 ??= false,
                      onChanged: (newValue) =>
                          setState(() => checkboxListTileValue4 = newValue),
                      title: Text(
                        'Electronics',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Lexend Deca',
                          fontSize: 16,
                        ),
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      activeColor: FlutterFlowTheme.primaryColor,
                      checkColor: FlutterFlowTheme.grayDark,
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
                    ),
                    child: CheckboxListTile(
                      value: checkboxListTileValue5 ??= false,
                      onChanged: (newValue) =>
                          setState(() => checkboxListTileValue5 = newValue),
                      title: Text(
                        'Jewlery/Accessories',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Lexend Deca',
                          fontSize: 16,
                        ),
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      activeColor: FlutterFlowTheme.primaryColor,
                      checkColor: FlutterFlowTheme.grayDark,
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
                    ),
                    child: CheckboxListTile(
                      value: checkboxListTileValue6 ??= false,
                      onChanged: (newValue) =>
                          setState(() => checkboxListTileValue6 = newValue),
                      title: Text(
                        'Documents',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Lexend Deca',
                          fontSize: 16,
                        ),
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      activeColor: FlutterFlowTheme.primaryColor,
                      checkColor: FlutterFlowTheme.grayDark,
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
                    ),
                    child: CheckboxListTile(
                      value: checkboxListTileValue7 ??= false,
                      onChanged: (newValue) =>
                          setState(() => checkboxListTileValue7 = newValue),
                      title: Text(
                        'Other',
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Lexend Deca',
                          fontSize: 16,
                        ),
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      activeColor: FlutterFlowTheme.primaryColor,
                      checkColor: FlutterFlowTheme.grayDark,
                      dense: true,
                      controlAffinity: ListTileControlAffinity.trailing,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      final bookOrderCreateData = createBookOrderRecordData(
                        senderName: textController1.text,
                        senderEmail: textController2.text,
                        senderPhone: int.parse(textController3.text),
                        senderAddress: textController4.text,
                      );
                      await BookOrderRecord.collection
                          .doc()
                          .set(bookOrderCreateData);
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.leftToRight,
                          duration: Duration(milliseconds: 250),
                          reverseDuration: Duration(milliseconds: 250),
                          child: SetPickupLocation2Widget(),
                        ),
                      );
                    },
                    text: 'Next',
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
