import 'package:flutter/material.dart';

import 'widgets/thank_you_container.dart';

class ThankYouView extends StatelessWidget {
  static const String routeName="thank";
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,size: 30,)),
      ),

      body: Padding(
        padding: const EdgeInsets.all(34),
        child: Column(

          children: [
            SizedBox(height: 15,),
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [


                  ThankYouContainer(),
                  Positioned(
                    left: -18,
                      bottom: MediaQuery.sizeOf(context).height *0.2,
                      child:const CircleAvatar(
                    backgroundColor: Colors.white,
              
                  )),
              
                   Positioned(
                      right: -18,
                      bottom: MediaQuery.sizeOf(context).height *0.2,
                      child:const CircleAvatar(
                        backgroundColor: Colors.white,
              
                      )),
                  Positioned(
                      left: 0,
                      right: 0,
                      bottom: MediaQuery.sizeOf(context).height*0.2+20,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: List.generate(20, (index) {
                            return Expanded(child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 2),
                              child: Container(
                                height: 4,
                                color: Colors.grey,
                              ),
                            ));
                          },),
                        ),
                      )),
                  const Positioned(
                    left: 0,
                      right: 0,
                      top: -50,
                      child:
                  CircleAvatar(
                    radius: 50,
                    backgroundColor:Color(0xffD9D9D9),
                    child: CircleAvatar(
                      child: Icon(Icons.check,size: 50,color: Colors.white,),
                      radius: 40,
                      backgroundColor: Color(0xff34A853),
                    ),
                  )
                  ),

              
                ],
              
              
              ),
            ),
          ],
        ),
      ),
    );
  }
}
