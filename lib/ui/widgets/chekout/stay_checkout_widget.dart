// ignore_for_file: library_private_types_in_public_api

import 'package:brokr/models/policy_model.dart';

import 'package:brokr/ui/widgets/tiles/cancelation_policy_tile_widget.dart';

import 'package:brokr/ui/widgets/normal_button.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_loading/card_loading.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/theme_utils.dart';

class StayCheckoutWidget extends StatefulWidget {
  final String title;
  final String owner;

  final String description;
  final String startDate;
  final String endDate;

  final int guests;
  final double rating;
  final String image;

  final VoidCallback requestBook;

  final double heightImage = 175;
  final BorderRadius borderRadius = const BorderRadius.all(Radius.circular(10));
  final EdgeInsetsGeometry? margin;

  final PolicyModel policy;
  final int days;
  final double dayPrice;
  final double lateFee;
  final double gratuity;
  final double brokrFee;
  final double tax;

  const StayCheckoutWidget({
    super.key,
    required this.title,
    required this.owner,
    required this.rating,
    required this.image,
    this.margin,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.guests,
    required this.days,
    required this.gratuity,
    required this.brokrFee,
    required this.tax,
    required this.dayPrice,
    required this.lateFee,
    required this.policy,
    required this.requestBook,
  });

  @override
  _StayCheckoutWidgetState createState() => _StayCheckoutWidgetState();
}

class _StayCheckoutWidgetState extends State<StayCheckoutWidget> {
  String? paymentMethod;
  String? paymentPlan;
  TextEditingController feedbackController = TextEditingController();

  sendFeedback() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CachedNetworkImage(
              imageUrl: widget.image,
              imageBuilder: (context, imageProvider) => Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: widget.heightImage,
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.only(bottomLeft: Radius.zero),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
              placeholder: (context, url) => CardLoading(
                width: MediaQuery.of(context).size.width,
                height: widget.heightImage,
                borderRadius: widget.borderRadius,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ],
        ),
        Padding(
            padding: widget.margin!,
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${widget.owner}\'s',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.favorite,
                          size: 14,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'Superhost',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(widget.rating.toString(),
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey)),
                        const Icon(
                          Icons.star,
                          size: 14,
                          color: Colors.orange,
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.black,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_month_outlined,
                              size: 22,
                              color: Colors.purple,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              children: [
                                Text(
                                  widget.startDate,
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  widget.endDate,
                                  style: const TextStyle(fontSize: 14),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                          child: VerticalDivider(
                            thickness: 0.5,
                            width: 20,
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.group_outlined,
                              size: 22,
                              color: Colors.purple,
                            ),
                            Text(
                              '${widget.guests} ${'guests'.tr}',
                              style: const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(
                              width: 40,
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                const Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'priceDet'.tr,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${'day'.tr} ${widget.days}h'),
                          Text('\$${widget.days * widget.dayPrice}')
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${'grat'.tr} ${widget.gratuity}%'),
                          Text(
                              '\$${(widget.days * widget.dayPrice) * widget.gratuity / 100}')
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${'brFee'.tr} ${widget.brokrFee}%'),
                          Text(
                              '\$${(widget.days * widget.dayPrice) * widget.brokrFee / 100}')
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${'sTax'.tr} ${widget.tax}%'),
                          Text(
                              '\$${(widget.days * widget.dayPrice) * widget.tax / 100}'),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${'tot'.tr} (USD)',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                              '\$${(widget.days * widget.dayPrice) + ((widget.days * widget.dayPrice) * widget.gratuity / 100) + ((widget.days * widget.dayPrice) * widget.brokrFee / 100) + ((widget.days * widget.dayPrice) * widget.tax / 100)}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold))
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: Card(
                    elevation: 0,
                    borderOnForeground: true,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.black, width: 0.5),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Stack(children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: <Widget>[
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('addDay'.tr,
                                                style: const TextStyle(
                                                    fontSize: 12)),
                                            Text(
                                                'addDayUnd1'.tr +
                                                    'addDayUnd2'.tr,
                                                style: const TextStyle(
                                                    fontSize: 10))
                                          ],
                                        ),
                                        Text('\$${widget.lateFee}')
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('refDep'.tr,
                                                style: const TextStyle(
                                                    fontSize: 12)),
                                            Text('refDepUnd'.tr,
                                                style: const TextStyle(
                                                    fontSize: 10))
                                          ],
                                        ),
                                        Text('\$${widget.lateFee}')
                                      ],
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
                const Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'howPay'.tr,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Align(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('sPay'.tr),
                                  Text(
                                    'sPayUnd'.tr,
                                    style: const TextStyle(fontSize: 10),
                                  )
                                ],
                              ),
                              const Text('shareLink')
                            ]),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('fullPay'.tr),
                                  Text('fullPayUnd'.tr,
                                      style: const TextStyle(fontSize: 10))
                                ],
                              ),
                              Radio(
                                value: 'full',
                                groupValue: paymentPlan,
                                onChanged: (value) {
                                  setState(() {
                                    paymentPlan = value.toString();
                                  });
                                },
                              )
                            ]),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('halfPay'.tr),
                                  Text('halfPayUnd'.tr,
                                      style: const TextStyle(fontSize: 10))
                                ],
                              ),
                              Radio(
                                value: 'half',
                                groupValue: paymentPlan,
                                onChanged: (value) {
                                  setState(() {
                                    paymentPlan = value.toString();
                                  });
                                },
                              )
                            ])
                      ]),
                ),
                const Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'payWith'.tr,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Align(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.add_card_outlined),
                                  Text('cdCard'.tr),
                                ],
                              ),
                              Radio(
                                value: 'card',
                                groupValue: paymentMethod,
                                onChanged: (value) {
                                  setState(() {
                                    paymentMethod = value.toString();
                                  });
                                },
                              )
                            ]),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.attach_money_outlined),
                                  Text('bAcc'.tr),
                                ],
                              ),
                              Radio(
                                value: 'bank',
                                groupValue: paymentMethod,
                                onChanged: (value) {
                                  setState(() {
                                    paymentMethod = value.toString();
                                  });
                                },
                              )
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.paypal_outlined),
                                  Text('paypal'.tr),
                                ],
                              ),
                              Radio(
                                value: 'payPal',
                                groupValue: paymentMethod,
                                onChanged: (value) {
                                  setState(() {
                                    paymentMethod = value.toString();
                                  });
                                },
                              )
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.card_giftcard_outlined),
                                  Text('travCredit'.tr),
                                ],
                              ),
                              Radio(
                                value: 'credit',
                                groupValue: paymentMethod,
                                onChanged: (value) {
                                  setState(() {
                                    paymentMethod = value.toString();
                                  });
                                },
                              )
                            ])
                      ]),
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    child: Text(
                      'entPromo'.tr,
                      style:
                          const TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'canPol'.tr,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                CancelationPolicyTileWidget(policy: widget.policy),
                const Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'messageHost'.tr,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'messageHostUnd'.tr,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    TextField(
                      controller: feedbackController,
                      keyboardType: TextInputType.multiline,
                      minLines: 4,
                      maxLines: null,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '...',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 160,
                    height: 50,
                    child: NormalButton(
                      backgroundColor: ThemeUtils.colorPurple,
                      text: 'sendFeed'.tr,
                      onTap: sendFeedback,
                      cornersRadius: 10,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.black,
                ),
                Text('bookWC'.tr),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                      text: 'agreeBook1'.tr,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                            text: 'agreeBook2'.tr,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text('hostRules'.tr),
                                        content: Text('hostRulesContent'.tr),
                                        actions: <Widget>[
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Ok'))
                                        ],
                                      )),
                            style: const TextStyle(
                                fontSize: 10,
                                decoration: TextDecoration.underline)),
                        TextSpan(
                            text: 'agreeBook3'.tr,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text('brokrRefundPolicy'.tr),
                                        content:
                                            Text('brokrRefundPolicyContent'.tr),
                                        actions: <Widget>[
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Ok'))
                                        ],
                                      )),
                            style: const TextStyle(
                                fontSize: 10,
                                decoration: TextDecoration.underline)),
                        TextSpan(
                            text: 'agreeBook4'.tr,
                            style: const TextStyle(fontSize: 10)),
                        TextSpan(
                            text: 'agreeBook5'.tr,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text('payAgreement'.tr),
                                        content: Text('payAgreementContent'.tr),
                                        actions: <Widget>[
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Ok'))
                                        ],
                                      )),
                            style: const TextStyle(
                                fontSize: 10,
                                decoration: TextDecoration.underline)),
                        TextSpan(
                            text: 'agreeBook4'.tr,
                            style: const TextStyle(fontSize: 10)),
                      ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 240,
                  child: NormalButton(
                    text: 'reqBook'.tr,
                    onTap: widget.requestBook,
                    cornersRadius: 10,
                    backgroundColor: ThemeUtils.colorPurple,
                  ),
                )
              ],
            )),
      ],
    );
  }
}
