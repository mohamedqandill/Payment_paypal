import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment/core/utils/styles.dart';
import 'package:payment/features/checkout/presentation/views/widgets/total_price.dart';

class ThankYouContainer extends StatelessWidget {
  const ThankYouContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xffEDEDED),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.only(top: 50 + 16, left: 22, right: 22),
        child: Column(
          children: [
            const Text(
              "Thank You!",
              style: Styles.style24,
            ),
            const Text(
              "Your Transaction Was Succesfully",
              style: Styles.style18,
            ),
            const SizedBox(
              height: 40,
            ),
            const PaymentInfo(
              title: "Date",
              value: "8/2/2024",
            ),
            const SizedBox(
              height: 10,
            ),
            const PaymentInfo(
              title: "Time",
              value: "10:30Pm",
            ),
            const SizedBox(
              height: 10,
            ),
            const PaymentInfo(
              title: "To",
              value: "Mohamed Qandill",
            ),
            const Divider(
              height: 60,
              thickness: 4,
            ),
            const TotalPrice(title: "Total", value: r"100$"),
            const SizedBox(
              height: 20,
            ),
            const CardInfo(),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  FontAwesomeIcons.barcode,
                  size: 70,
                ),
                Container(
                  child: Center(
                      child: Text(
                    "PAID",
                    style: TextStyle(color: Colors.green,fontSize: 22),
                  )),
                  width: 100,
                  height: 50,
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: Colors.green, width: 2))),
                )
              ],
            ),
            SizedBox(height: (MediaQuery.sizeOf(context).height*0.2+10)/2)
          ],
        ),
      ),
    );
  }
}

class PaymentInfo extends StatelessWidget {
  const PaymentInfo({required this.value, required this.title, super.key});

  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Styles.style18,
        ),
        Text(
          value,
          style: Styles.style24,
        ),
      ],
    );
  }
}

class CardInfo extends StatelessWidget {
  const CardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 23),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Image.asset(
            "assets/images/basket_image.png",
            height: 40,
          ),
          SizedBox(
            width: 20,
          ),
          Text.rich(TextSpan(children: [
            TextSpan(text: "Credit Card \n"),
            TextSpan(text: "MasterCard**78")
          ]))
        ],
      ),
    );
  }
}
