import 'package:flutter/material.dart';

class PaymentElement extends StatelessWidget {

  final Function() onTap;
  final String elementName;

  const PaymentElement({
    Key? key,
    required this.onTap,
    required this.elementName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8), 
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.8))
          ),
          child: Image.asset('assets/$elementName.png', fit: BoxFit.fill),
        ),
      ),
    );
  }
}
