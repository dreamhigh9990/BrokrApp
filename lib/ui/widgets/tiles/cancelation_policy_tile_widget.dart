import 'package:brokr/models/policy_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CancelationPolicyTileWidget extends StatelessWidget {
  final PolicyModel policy;

  const CancelationPolicyTileWidget({super.key, required this.policy});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          policy.policyIconPath,
          color: Colors.black,
          width: 20,
          height: 20,
        ),
      const   SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(policy.policyName,
                style: const TextStyle(fontWeight: FontWeight.w400)),
          const  SizedBox(
              height: 5,
            ),
            policy.refund
                ? Text(
                    'Full refund before ${policy.policyDate}',
                    style: const TextStyle(fontSize: 10),
                  )
                : const Text(
                    'No refunds available',
                    style: TextStyle(fontSize: 10),
                  )
          ],
        )
      ],
    );
  }
}
