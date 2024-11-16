import 'package:flutter/material.dart';
import 'package:payment/core/utils/styles.dart';
import 'package:payment/features/checkout/presentation/views/widgets/checkout_body.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName="check";
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("My Cart",style: Styles.style25,),
        centerTitle: true,
        leading:const  Icon(Icons.arrow_back,size: 28,),
      ),

      body:const Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20),
        child:  CheckoutBody()
      ),
    );
  }
}


