import 'package:flutter/material.dart';
import 'package:payment/core/utils/styles.dart';

class OrderInfo extends StatelessWidget {
  const OrderInfo({required this.title,required this.value,super.key});
  final String title,value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: Styles.style18,),
        Text(value,style: Styles.style18,),
      ],
    );
  }
}
