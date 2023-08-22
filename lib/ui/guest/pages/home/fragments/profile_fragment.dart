// ignore_for_file: library_private_types_in_public_api

import 'package:brokr/ui/commons/pages/splash_page.dart';

import 'package:brokr/ui/guest/fragments/settings/language_page.dart';
import 'package:brokr/ui/guest/fragments/settings/payments_page.dart';

import 'package:brokr/ui/guest/fragments/settings/privacy_page.dart';
import 'package:brokr/ui/guest/fragments/settings/terms_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/theme_utils.dart';
import '../../../../widgets/appbar_widget.dart';
import '../../../../widgets/bottom_bar_widget.dart';
import '../../../../widgets/normal_button.dart';
import '../../../fragments/settings/credits_page.dart';
import '../../../fragments/settings/header_page.dart';
import '../../../fragments/settings/notifications_page.dart';
import '../../../fragments/settings/personal_page.dart';
import '../../../fragments/settings/refer_page.dart';
import '../../../fragments/settings/support_page.dart';
import '../guest_home_controller.dart';


class ProfileFragment extends StatefulWidget {
  const ProfileFragment({super.key});

  @override
  _ProfileFragmentState createState() => _ProfileFragmentState();
}

class _ProfileFragmentState extends State<ProfileFragment> {

    final GuestHomeController guestHomeController = Get.find();
    
  Widget _divider() {
    return const Divider(
      color: Colors.black,
      endIndent: 24,
      indent: 24,
    );
  }

  Widget _profileTile({
    required IconData icon,
    required String title,
    required Function() onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      onTap: onTap,
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
           appBar: const CustomBar(
        title: 'Profile',
        showLeading: false,
      ),
        body: SafeArea(
          child: Stack(


            children: [
              ListView(
            padding: const EdgeInsets.only(bottom: 24),
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 24,
                ),
                child: HeaderFragment(),
              ),
              const SizedBox(height: 16),
              _divider(),
              _profileTile(
                icon: Iconsax.profile_circle,
                title: 'Personal Information',
                onTap: () {
                  Get.toNamed(
                    PersonalPage.name,
                  );
                },
              ),
              _profileTile(
                icon: Iconsax.wallet_2,
                title: 'Payment methods',
                onTap: () {
                  Get.toNamed(
                    PaymentsPage.name,
                  );
                },
              ),
              _profileTile(
                icon: Iconsax.language_square,
                title: 'Language',
                onTap: () {
                  Get.toNamed(
                    LanguagePage.name,
                  );
                },
              ),
              _profileTile(
                icon: Iconsax.notification,
                title: 'Notifications',
                onTap: () {
                  Get.toNamed(
                    NotificationsPage.name,
                  );
                },
              ),
              _profileTile(
                icon: Iconsax.shield_cross,
                title: 'Privacy and sharing',
                onTap: () {
                  Get.toNamed(
                    PrivacyPage.name,
                  );
                },
              ),
              _profileTile(
                icon: Iconsax.cup,
                title: 'Travel credits',
                onTap: () {
                  Get.toNamed(
                    CreditsPage.name,
                  );
                },
              ),
              _profileTile(
                icon: Iconsax.crown_1,
                title: 'Referrals & Bonuses',
                onTap: () {
                  Get.toNamed(
                    ReferalPage.name,
                  );
                },
              ),
              _profileTile(
                icon: Iconsax.alarm,
                title: 'Support',
                onTap: () {
                  Get.toNamed(
                    SupportPage.name,
                  );
                },
              ),
              _profileTile(
                icon: Iconsax.folder_2,
                title: 'Legal',
                onTap: () {
                  Get.toNamed(
                    LegalPage.name,
                  );
                },
              ),
              _divider(),
              const SizedBox(height: 32),
              NormalButton(
                backgroundColor: ThemeUtils.colorPurple,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                text: 'Log Out',
                onTap: () {
                  Get.offAll(
                    const SplashPage(),
                  );
                },
                cornersRadius: 8,
              ),
            ],
          ),

           GetBuilder<GuestHomeController>(
                id: 'bottom_bar',
                builder: (controller) => AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      bottom: guestHomeController.percent <= 0.1 ? -50.0 : 0.0,
                      child: BottomBarWidget(
                        labels: guestHomeController.labelFragments,
                        iconsPath: guestHomeController.iconFragments,
                        index: guestHomeController.index,
                        countNotifications:
                            guestHomeController.countNewNotifications,
                        onTabItemSelected: (int value) {
                          guestHomeController.updatePage(value);
                        },
                      ),
                    )),
                    
            ],
          )
        ),
      );
}
