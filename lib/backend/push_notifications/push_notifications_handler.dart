import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Image.asset(
            'assets/images/Copy_of_qonvayappsplash_(4).png',
            fit: BoxFit.cover,
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'greeting': (data) async => GreetingWidget(),
  'loginPage': (data) async => LoginPageWidget(),
  'registerAccount': (data) async => RegisterAccountWidget(),
  'onboarding': (data) async => OnboardingWidget(),
  'completeProfile': (data) async => CompleteProfileWidget(),
  'createDefaultPickup': (data) async => CreateDefaultPickupWidget(),
  'privacyPolicy': (data) async => PrivacyPolicyWidget(),
  'TermsandConditions': (data) async => TermsandConditionsWidget(),
  'forgotPassword': (data) async => ForgotPasswordWidget(),
  'MY_profilePage': (data) async => MYProfilePageWidget(
        userProfile: getParameter(data, 'userProfile'),
      ),
  'editProfile': (data) async => EditProfileWidget(
        userProfile: getParameter(data, 'userProfile'),
      ),
  'createDefaultPickupEdit': (data) async => CreateDefaultPickupEditWidget(),
  'changePassword': (data) async => ChangePasswordWidget(),
  'bookDelivery': (data) async => BookDeliveryWidget(
        bookingParam: getParameter(data, 'bookingParam'),
      ),
  'bookingPageDefault': (data) async => BookingPageDefaultWidget(
        mileageParam: getParameter(data, 'mileageParam'),
        bookingParam: getParameter(data, 'bookingParam'),
      ),
  'bookingPage': (data) async => BookingPageWidget(
        mileageParam: getParameter(data, 'mileageParam'),
        bookingParam: getParameter(data, 'bookingParam'),
      ),
  'bookingComplete': (data) async => BookingCompleteWidget(
        mileageCost: getParameter(data, 'mileageCost'),
        bookingParam: getParameter(data, 'bookingParam'),
      ),
  'deliveryOrderList': (data) async => DeliveryOrderListWidget(
        bookOrderDetails: getParameter(data, 'bookOrderDetails'),
      ),
  'orderTracking': (data) async => OrderTrackingWidget(
        orderRefParam: getParameter(data, 'orderRefParam'),
      ),
  'orderReport': (data) async => OrderReportWidget(
        orderRefParam: getParameter(data, 'orderRefParam'),
      ),
  'paymentPage': (data) async => PaymentPageWidget(),
  'topupMileage': (data) async => TopupMileageWidget(),
  'subscribeMileage': (data) async => SubscribeMileageWidget(),
  'notificationsSettings': (data) async => NotificationsSettingsWidget(),
  'payWall': (data) async => PayWallWidget(
        buyMileageParam: getParameter(data, 'buyMileageParam'),
        subscribeParam: getParameter(data, 'subscribeParam'),
        mileageCostParam: getParameter(data, 'mileageCostParam'),
      ),
  'transactionHistory': (data) async => TransactionHistoryWidget(
        userProfile: getParameter(data, 'userProfile'),
      ),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
