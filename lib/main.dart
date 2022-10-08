// ignore_for_file: unused_import, duplicate_ignore, unused_local_variable

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
// ignore: unused_import
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:qonvay/backend/backend.dart';

import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';
import 'backend/push_notifications/push_notifications_util.dart';
// ignore: unused_import
import 'package:stream_transform/stream_transform.dart';
// ignore: unused_import
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FFAppState(); // Initialize FFAppState

  var key;
  runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = ThemeMode.system;

  late Stream<QonvayFirebaseUser> userStream;
  QonvayFirebaseUser? initialUser;
  bool displaySplashImage = true;

  final authUserSub = authenticatedUserStream.listen((_) {});
  final fcmTokenSub = fcmTokenUserStream.listen((_) {});

  // ignore: non_constant_identifier_names
  int no_of_payment = 0;
  DateTime? subscriptionDate;
  DateTime? accountCreatedDate;
  double? balance;
  void getData() async {
    if (FirebaseAuth.instance.currentUser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((value) {
        try {
          accountCreatedDate = value.get('created_time').toDate();
        } catch (e) {
          // subscriptionDate = DateTime.now();
        }
        try {
          subscriptionDate = value.get('subscription_date').toDate();
        } catch (e) {
          subscriptionDate = null;
        }

        no_of_payment = value.get('no_of_payment');
        balance = double.parse(value.get('mileage_balance').toString());
        // if (value.data()!.containsKey('subscription_date')) {
        //   subscriptionDate = value.get('subscription_date').toDate();
        // }
      });
    }
  }

  @override
  void initState() {
    super.initState();

    getData();
    userStream = qonvayFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    Future.delayed(
      Duration(seconds: 5),
      () => setState(() => displaySplashImage = false),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();
    fcmTokenSub.cancel();
    super.dispose();
  }

  void setLocale(String language) =>
      setState(() => _locale = createLocale(language));
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  @override
  Widget build(BuildContext context) {
    if (subscriptionDate == null) {
      log('subscription date is null');
    } else {
      print('subscription date is : $subscriptionDate');
    }
    print('no of payment is : $no_of_payment');
    return MaterialApp(
      title: 'Qonvay',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
      ],
      theme: ThemeData(brightness: Brightness.light),
      themeMode: _themeMode,
      home: initialUser == null || displaySplashImage
          ? Container(
              color: Colors.transparent,
              child: Builder(
                builder: (context) => Image.asset(
                  'assets/images/Copy_of_qonvayappsplash_(4).png',
                  fit: BoxFit.cover,
                ),
              ),
            )
          : currentUser!.loggedIn
              ? (subscriptionDate != null &&
                          DateTime.now().difference(subscriptionDate!).inDays >
                              30 &&
                          DateTime.now()
                                  .difference(accountCreatedDate!)
                                  .inDays >
                              30 &&
                          no_of_payment > 0) ||
                      (accountCreatedDate != null &&
                          DateTime.now()
                                  .difference(accountCreatedDate!)
                                  .inDays >
                              30 &&
                          no_of_payment > 0 &&
                          balance! <= 0.7)
                  ? PayWallWidget()
                  : PushNotificationsHandler(child: MainDashboardWidget())
              : GreetingWidget(),
    );
  }
}
