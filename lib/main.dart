import 'package:flutter/material.dart';
import 'package:payment/features/checkout/presentation/views/checkout.dart';

import 'features/checkout/presentation/views/thank_you_view.dart';

void main() {
  runApp(const CheckOutApp());
}

class CheckOutApp extends StatelessWidget {
  const CheckOutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CheckoutScreen(),

     routes: {
       CheckoutScreen.routeName:(context)=>CheckoutScreen(),
       ThankYouView.routeName:(context)=>ThankYouView(),
     },
      initialRoute: CheckoutScreen.routeName,
    );
  }
}
