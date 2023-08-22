import 'package:brokr/ui/guest/pages/home/fragments/car/car_camera_page.dart';
import 'package:brokr/ui/guest/pages/home/guest_home_bindings.dart';
import 'package:brokr/ui/guest/pages/home/guest_home_page.dart';
import 'package:get/get.dart';

import '../ui/commons/pages/confirmed_page.dart';
import '../ui/commons/pages/example_page.dart';
import '../ui/commons/pages/login_page.dart';
import '../ui/commons/pages/login_page.dart';
import '../ui/commons/pages/splash_page.dart';
import '../ui/commons/pages/verify_email_page.dart';
import '../ui/commons/pages/verify_phone_page.dart';
import '../ui/guest/pages/home/fragments/car/car_camera_bindings.dart';
import '../ui/guest/pages/home/fragments/chat/chat_room_fragment.dart';
import '../ui/guest/fragments/settings/credits_page.dart';
import '../ui/guest/fragments/settings/language_page.dart';
import '../ui/guest/fragments/settings/notifications_page.dart';
import '../ui/guest/fragments/settings/payments_page.dart';
import '../ui/guest/fragments/settings/personal_page.dart';
import '../ui/guest/fragments/settings/privacy_page.dart';
import '../ui/guest/fragments/settings/refer_page.dart';
import '../ui/guest/fragments/settings/support_page.dart';
import '../ui/guest/fragments/settings/terms_page.dart';

abstract class AppPages {
  static const duration = Duration(milliseconds: 750);

  static final pages = [
    GetPage(
        name: ExamplePage.name,
        page: () => const ExamplePage(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
    GetPage(
        name: SplashPage.name,
        page: () => const SplashPage(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
    GetPage(
        name: LoginPage.name,
        page: () => const LoginPage(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
    GetPage(
        name: VerifyPhonePage.name,
        page: () => const VerifyPhonePage(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
    GetPage(
        name: VerifyEmailPage.name,
        page: () => const VerifyEmailPage(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
    GetPage(
        name: CongratulationsPage.name,
        page: () => const CongratulationsPage(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
    GetPage(
        name: ChatRoomFragment.name,
        page: () => const ChatRoomFragment(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
    GetPage(
        name: PersonalPage.name,
        page: () => const PersonalPage(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
    GetPage(
        name: PaymentsPage.name,
        page: () => PaymentsPage(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
    GetPage(
        name: LanguagePage.name,
        page: () => const LanguagePage(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
    GetPage(
        name: NotificationsPage.name,
        page: () => const NotificationsPage(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
    GetPage(
        name: PrivacyPage.name,
        page: () => const PrivacyPage(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
    GetPage(
        name: PrivacyPage.name,
        page: () => const PrivacyPage(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
    GetPage(
        name: CreditsPage.name,
        page: () => const CreditsPage(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
    GetPage(
        name: ReferalPage.name,
        page: () => const ReferalPage(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
    GetPage(
        name: SupportPage.name,
        page: () => const SupportPage(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
    GetPage(
        name: LegalPage.name,
        page: () => const LegalPage(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
    GetPage(
        name: GuestHomePage.name,
        page: () => GuestHomePage(),
        binding: GuestHomeBinding(),
        transitionDuration: duration,
        transition: Transition.fadeIn),



        GetPage(
        name: CarCameraPage.id,
        page: () => CarCameraPage(),
        binding: CarCameraBinding(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
  ];
}
