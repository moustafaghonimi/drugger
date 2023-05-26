import 'package:flutter/material.dart';

class EasyStripper extends StatelessWidget {
  final String itemState ;
  EasyStripper({required this.itemState});
  @override
  Widget build(BuildContext context) {
    final int currentStep;
    if(itemState=="Processing")
      {
        currentStep=0;
      }
    else if (itemState=="Shipped")
      {
        currentStep=1;
      }
    else
      {
        currentStep=2;
      }
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Icon(
                  Icons.pending_actions,
                  size: 35,
                  color: currentStep >= 0 ? Colors.green : Colors.grey,
                ),
                Text('Preparing',style: TextStyle(
                    fontSize: 16
                ),),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 2,
              color:currentStep >= 1 ? Colors.green : Colors.grey,
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Icon(
                  size: 35,

                  Icons.local_shipping,
                  color: currentStep >= 1 ? Colors.green : Colors.grey,
                ),
                Text('Shipping',style: TextStyle(
                  fontSize: 16
                ),),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: 2,
              color:currentStep >= 2 ? Colors.green : Colors.grey,
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Icon(
                  size: 35,

                  Icons.check_circle,
                  color: currentStep >= 2 ? Colors.green : Colors.grey,
                ),
                Text('Delivered',style: TextStyle(
                    fontSize: 16
                ),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}