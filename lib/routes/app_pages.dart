
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
import '../ui/guest/fragments/chat/chat_room_fragment.dart';
import '../ui/guest/fragments/settings/credits_page.dart';
import '../ui/guest/fragments/settings/language_page.dart';
import '../ui/guest/fragments/settings/notifications_page.dart';
import '../ui/guest/fragments/settings/payments_page.dart';
import '../ui/guest/fragments/settings/personal_page.dart';
import '../ui/guest/fragments/settings/privacy_page.dart';
import '../ui/guest/fragments/settings/refer_page.dart';
import '../ui/guest/fragments/settings/support_page.dart';
import '../ui/guest/fragments/settings/terms_page.dart';

import '../src/pages/Listing/car/address_in.page.dart' as CarAddress;
import '../src/pages/Listing/car/car.page.dart';
import '../src/pages/Listing/car/car_done.page.dart';
import '../src/pages/Listing/car/info_vim.page.dart';
import '../src/pages/Listing/car/manual_vin.page.dart';
import '../src/pages/Listing/car/scan_vin.page.dart';
import '../src/pages/Listing/yacht/address_in.page.dart';
import '../src/pages/Listing/yacht/confirm_address.page.dart';
import '../src/pages/Listing/yacht/yacht.page.dart';
import '../src/pages/profile/profile.page.dart';
import '../src/pages/Listing/car/confirm_address.page.dart' as CarConfirm;

import '../src/pages/Listing/building/confirm_address.page.dart'
    as BuildingConfirm;
import '../src/pages/Listing/building/address_in.page.dart' as BuildingAddress;
import '../src/pages/Listing/building/building.page.dart';
import '../src/pages/Listing/building/building_done.page.dart';

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
        page: () => const PaymentsPage(),
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
        name: CarPage.name,
        page: () => CarPage(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
    GetPage(
        name: CarDonePage.name,
        page: () => CarDonePage(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
    GetPage(
        name: InfoVIMPage.name,
        page: () => InfoVIMPage(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
    GetPage(
        name: ScanVinPage.name,
        page: () => ScanVinPage(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
    GetPage(
        name: YachtPage.name,
        page: () => YachtPage(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
    GetPage(
        name: ManualVinPage.name,
        page: () => ManualVinPage(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
    GetPage(
        name: ProfilePage.name,
        page: () => ProfilePage(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
    GetPage(
        name: AddressInPage.name,
        page: () => AddressInPage(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
    GetPage(
        name: CarAddress.AddressInPage.name,
        page: () => CarAddress.AddressInPage(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
    GetPage(
        name: ConfirmAddressPage.name,
        page: () => ConfirmAddressPage(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
    GetPage(
        name: CarConfirm.ConfirmAddressPage.name,
        page: () => CarConfirm.ConfirmAddressPage(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
    
    GetPage(
        name: BuildingPage.name,
        page: () => BuildingPage(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
    GetPage(
        name: BuildingDonePage.name,
        page: () => BuildingDonePage(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
    GetPage(
        name: BuildingAddress.AddressInPage.name,
        page: () => BuildingAddress.AddressInPage(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
    GetPage(
        name: BuildingConfirm.ConfirmAddressPage.name,
        page: () => BuildingConfirm.ConfirmAddressPage(),
        transitionDuration: duration,
        transition: Transition.fadeIn),
  ];
}
