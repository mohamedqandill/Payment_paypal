import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required this.onTap,required this.title,super.key});
  final void Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        width: 350,
        height: 60,
        decoration:ShapeDecoration(
            color: const Color(0xff34A853),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)

            )) ,
        child:  Center(
          child: Text(title,style: Styles.style24,),
        ),
      ),
    );
  }
}
