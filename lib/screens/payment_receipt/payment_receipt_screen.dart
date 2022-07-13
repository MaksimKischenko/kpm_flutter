import 'package:flutter/material.dart';
import 'package:kpm_flutter/styles.dart';
import 'package:kpm_flutter/widgets/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'widgets/widgets.dart';

class PaymentReceiptScreen extends StatefulWidget {
  const PaymentReceiptScreen({ Key? key }) : super(key: key);

  @override
  State<PaymentReceiptScreen> createState() => _PaymentReceiptScreenState();
}

class _PaymentReceiptScreenState extends State<PaymentReceiptScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          child: ResponsiveBuilder(
            builder: (context, sizingInformation) {
              double width = sizingInformation.screenSize.width;
              double height = sizingInformation.screenSize.height;
              bool isWideScreen = height < width;
              
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                    TitleSupportText(
                      sizingInformation: sizingInformation,
                    ),
                    PaymentReceiptMenu(
                      sizingInformation: sizingInformation,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: SizedBox(
                        height: isWideScreen? (height / 8) : (height / 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ActionButton(
                              name: 'Добавить\nв корзину', 
                              buttonGradientColors: AppStyles.clearBasketColor, 
                              onTap: () {},
                            ),
                            const SizedBox(width: 24),
                            ActionButton(
                              name: 'Оплатить', 
                              buttonGradientColors: AppStyles.payBasketColor, 
                              onTap: () => Navigator.pop(context),
                            ),
                            const SizedBox(width: 24),
                            ActionButton(
                              name: 'В начало', 
                              buttonGradientColors: AppStyles.navigationNextColor, 
                              onTap: () {},
                            ),
                            const SizedBox(width: 24),
                            ActionButton(
                              name: 'Главное\nменю', 
                              buttonGradientColors: AppStyles.navigationHomeColor, 
                              onTap: () => Navigator.pop(context),
                            )
                          ],
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        )
      ),
    );
  }
}