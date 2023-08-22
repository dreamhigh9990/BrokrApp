import 'package:flutter/material.dart';

class PaymentsPage extends StatelessWidget {
  static String name = '/payments-page';

  const PaymentsPage({super.key});

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add payment method'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: false,
        elevation: 0,
      ),
      body: Column(
        children: [
          _profileTile(
            icon: Icons.credit_card,
            title: 'Credit or Debit Card',
            onTap: () {},
          ),
          _profileTile(
            icon: Icons.paypal,
            title: 'Paypal',
            onTap: () {},
          ),
          _profileTile(
            icon: Icons.business_center_outlined,
            title: 'Travel Credit',
            onTap: () {},
          )
        ],
      ),
    );
  }
}
