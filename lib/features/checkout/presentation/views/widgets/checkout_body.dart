import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment/core/utils/apis.dart';
import 'package:payment/core/utils/styles.dart';
import 'package:payment/features/checkout/presentation/data/models/amount_model.dart';
import 'package:payment/features/checkout/presentation/data/models/item_model.dart';
import 'package:payment/features/checkout/presentation/views/checkout.dart';
import 'package:payment/features/checkout/presentation/views/thank_you_view.dart';
import 'package:payment/features/checkout/presentation/views/widgets/order_info.dart';
import 'package:payment/features/checkout/presentation/views/widgets/total_price.dart';

import 'custom_button.dart';

class CheckoutBody extends StatelessWidget {
  const CheckoutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const  SizedBox(height: 20,),
        Expanded(
            child: Image.asset(
          "assets/images/basket_image.png",
          height: 480,
        )),
        // const SizedBox(height: 20,),
        const OrderInfo(
          title: "Order Subtotal",
          value: r"$47.24",
        ),
        const SizedBox(
          height: 3,
        ),
        const OrderInfo(
          title: "Discount",
          value: r"$0",
        ),
        const SizedBox(
          height: 3,
        ),
        const OrderInfo(
          title: "Shipping",
          value: r"$8",
        ),
        const Divider(
          height: 34,
          thickness: 3,
        ),
        const TotalPrice(title: "Total", value: r"200$"),
        const SizedBox(
          height: 20,
        ),
        CustomButton(
          title: "Complete Payment",
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return PaymentMethodsBottomSheet();
              },
            );
          },
        )
      ],
    );
  }
}

class PaymentMethodsBottomSheet extends StatefulWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  State<PaymentMethodsBottomSheet> createState() =>
      _PaymentMethodsBottomSheetState();
}

bool isCredit = true;

class _PaymentMethodsBottomSheetState extends State<PaymentMethodsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    isCredit = !isCredit;
                    setState(() {});
                  },
                  child: Container(
                    width: 100,
                    height: 65,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 3,
                            color: !isCredit ? Colors.blue : Colors.grey),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Icon(
                      FontAwesomeIcons.creditCard,
                      size: 60,
                    )),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () {
                    isCredit = !isCredit;
                    setState(() {});
                  },
                  child: Container(
                    width: 100,
                    height: 65,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 3,
                            color: isCredit ? Colors.blue : Colors.grey),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Icon(
                      FontAwesomeIcons.ccPaypal,
                      size: 60,
                    )),
                  ),
                ),
              ],
            ),
          ),
          CustomButton(
            title: "Continue",
            onTap: () {
              var transactionData = getTransactionData();

              excutePaypalNavigation(context, transactionData);
            },
          )
        ],
      ),
    );
  }

  void excutePaypalNavigation(BuildContext context,
      ({AmountModel amount, ItemListModel items}) transactionData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApisKeys.clientID,
        secretKey: ApisKeys.secretKey,
        transactions: [
          {
            "amount": transactionData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transactionData.items.toJson()
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
         Navigator.pushNamedAndRemoveUntil(context, ThankYouView.routeName, (route) => true,);
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }

  ({AmountModel amount, ItemListModel items}) getTransactionData() {
    var amount = AmountModel(
        total: "100",
        currency: "USD",
        details:
            Details(subtotal: "100", shipping: "0", shippingDiscount: 0));
    List<OrderItemModel> orders = [
      OrderItemModel(name: "apple", quantity: 10, price: "4", currency: "USD"),
      OrderItemModel(name: "orange", quantity: 12, price: "5", currency: "USD"),
    ];
    var itemsList = ItemListModel(orders: orders);
    return (amount: amount, items: itemsList);
  }
}
