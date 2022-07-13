import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kpm_flutter/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PaymentReceiptMenu extends StatefulWidget {

  final SizingInformation sizingInformation;

  const PaymentReceiptMenu({
    Key? key,
    required this.sizingInformation,
  }) : super(key: key);


  @override
  _PaymentReceiptMenuState createState() => _PaymentReceiptMenuState();
}

class _PaymentReceiptMenuState extends State<PaymentReceiptMenu> {
  @override
  Widget build(BuildContext context) {
    
    double width  = widget.sizingInformation.screenSize.width;
    double height = widget.sizingInformation.screenSize.height;
    bool isWideScreen = height < width;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.8), blurRadius: 8),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: isWideScreen? 10 : 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children:   [
                FittedBox(
                  child: AutoSizeText(
                    'Чек оплаты', 
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: isWideScreen? 30 : 60,
                      color: const Color(0xff2D2B5F)
                    )
                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: width,
                    color: Colors.grey[300],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                         Text('Номер телефона:', style: AppStyles.simpleTextStyle),
                         SizedBox(height: 20),
                         Text('Сумма Оплаты:', style: AppStyles.simpleTextStyle)
                      ]
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}