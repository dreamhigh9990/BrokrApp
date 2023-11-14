import 'package:brokr/ui/commons/pages/confirmed_page.dart';
import 'package:brokr/ui/commons/pages/example_page.dart';
import 'package:brokr/ui/commons/pages/login_page.dart';
import 'package:brokr/ui/commons/pages/splash_page.dart';
import 'package:brokr/ui/commons/pages/verify_email_page.dart';
import 'package:brokr/ui/commons/pages/verify_phone_page.dart';
import 'package:brokr/ui/guest/fragments/chat/chat_room_fragment.dart';

import 'package:brokr/ui/guest/fragments/settings/language_page.dart';
import 'package:brokr/ui/guest/fragments/settings/notifications_page.dart';
import 'package:brokr/ui/guest/fragments/settings/payments_page.dart';
import 'package:brokr/ui/guest/fragments/settings/personal_page.dart';
import 'package:brokr/ui/guest/fragments/settings/privacy_page.dart';
import 'package:brokr/ui/guest/fragments/settings/refer_page.dart';
import 'package:brokr/ui/guest/fragments/settings/support_page.dart';
import 'package:brokr/ui/guest/fragments/settings/terms_page.dart';

import 'package:flutter/material.dart';

import '../ui/guest/fragments/settings/credits_page.dart';
import '../ui/guest/pages/home/guest_home_page.dart';

final routes = <String, WidgetBuilder>{
  ExamplePage.name: (context) => const ExamplePage(),
  SplashPage.name: (context) => const SplashPage(),
  LoginPage.name: (context) => const LoginPage(),
  VerifyPhonePage.name: (context) => const VerifyPhonePage(),
  VerifyEmailPage.name: (context) => const VerifyEmailPage(),
  CongratulationsPage.name: (context) => const CongratulationsPage(),
  GuestHomePage.name: (context) =>  const GuestHomePage(),
  ChatRoomFragment.name: (context) => const ChatRoomFragment(),
  PersonalPage.name: (context) => const PersonalPage(),
  PaymentsPage.name: (context) => const PaymentsPage(),
  LanguagePage.name: (context) => const LanguagePage(),
  NotificationsPage.name: (context) => const NotificationsPage(),
  PrivacyPage.name: (context) => const PrivacyPage(),
  CreditsPage.name: (context) => const CreditsPage(),
  ReferalPage.name: (context) => const ReferalPage(),
  SupportPage.name: (context) => const SupportPage(),
  LegalPage.name: (context) => const LegalPage(),
};
