import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_animations.dart';
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

class NotificationsSettingsWidget extends StatefulWidget {
  const NotificationsSettingsWidget({Key? key}) : super(key: key);

  @override
  _NotificationsSettingsWidgetState createState() =>
      _NotificationsSettingsWidgetState();
}

class _NotificationsSettingsWidgetState
    extends State<NotificationsSettingsWidget> with TickerProviderStateMixin {
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
  bool? emailSwitchListTileValue;
  bool? pushSwitchListTileValue;
  bool? locationSwitchListTileValue;
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

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'notificationsSettings'});
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).background,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).background,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            logFirebaseEvent('NOTIFICATIONS_SETTINGS_Icon_0i4xqdm1_ON_');
            logFirebaseEvent('Icon_navigate_back');
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left,
            color: FlutterFlowTheme.of(context).primaryColor,
            size: 30,
          ),
        ),
        title: Text(
          'Notification Settings',
          style: FlutterFlowTheme.of(context).title1,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).background,
        ),
        child: StreamBuilder<UsersRecord>(
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
            final columnUsersRecord = snapshot.data!;
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                          child: Text(
                            'Choose what notifcations you want to recieve below and we will update the settings.',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      fontSize: 16,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: AuthUserStreamWidget(
                    builder: (context) => SwitchListTile.adaptive(
                      value: pushSwitchListTileValue ??= valueOrDefault<bool>(
                          currentUserDocument?.pushNotification, false),
                      onChanged: (newValue) async {
                        setState(() => pushSwitchListTileValue = newValue!);
                      },
                      title: Text(
                        'Push Notifications',
                        style: FlutterFlowTheme.of(context).title3,
                      ),
                      subtitle: Text(
                        'Stay up to date on your orders. Receive Push notifications from our application on a semi regular basis.',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              fontSize: 16,
                            ),
                      ),
                      tileColor: Color(0xFFF5F5F5),
                      activeColor: FlutterFlowTheme.of(context).tertiaryColor,
                      activeTrackColor:
                          FlutterFlowTheme.of(context).primaryColor,
                      dense: false,
                      controlAffinity: ListTileControlAffinity.trailing,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
                    ),
                  ),
                ),
                AuthUserStreamWidget(
                  builder: (context) => SwitchListTile.adaptive(
                    value: emailSwitchListTileValue ??= valueOrDefault<bool>(
                        currentUserDocument?.emailNotification, false),
                    onChanged: (newValue) async {
                      setState(() => emailSwitchListTileValue = newValue!);
                    },
                    title: Text(
                      'Email Notifications',
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    subtitle: Text(
                      'Receive email notifications from our marketing team about new features and discounts.',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            fontSize: 16,
                          ),
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    activeColor: FlutterFlowTheme.of(context).tertiaryColor,
                    activeTrackColor: FlutterFlowTheme.of(context).primaryColor,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
                  ),
                ),
                AuthUserStreamWidget(
                  builder: (context) => SwitchListTile.adaptive(
                    value: locationSwitchListTileValue ??= valueOrDefault<bool>(
                        currentUserDocument?.locationServices, false),
                    onChanged: (newValue) async {
                      setState(() => locationSwitchListTileValue = newValue!);
                    },
                    title: Text(
                      'Location Services',
                      style: FlutterFlowTheme.of(context).title3,
                    ),
                    subtitle: Text(
                      'Allow us to track your location, this helps keep track of your orders and helps us understand you better.',
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            fontSize: 16,
                          ),
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    activeColor: FlutterFlowTheme.of(context).tertiaryColor,
                    activeTrackColor: FlutterFlowTheme.of(context).primaryColor,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'NOTIFICATIONS_SETTINGS_Button-Login_ON_T');
                      logFirebaseEvent('Button-Login_backend_call');

                      final usersUpdateData = createUsersRecordData(
                        pushNotification: pushSwitchListTileValue,
                        emailNotification: emailSwitchListTileValue,
                        locationServices: locationSwitchListTileValue,
                      );
                      await currentUserReference!.update(usersUpdateData);
                      logFirebaseEvent('Button-Login_navigate_back');
                      Navigator.pop(context);
                    },
                    text: 'Save Changes',
                    options: FFButtonOptions(
                      width: 190,
                      height: 50,
                      color: FlutterFlowTheme.of(context).primaryColor,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.of(context).background,
                              ),
                      elevation: 3,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ).animateOnPageLoad(animationsMap['columnOnPageLoadAnimation']!);
          },
        ),
      ),
    );
  }
}
