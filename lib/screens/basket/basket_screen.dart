import 'package:flutter/material.dart';
import 'package:kpm_flutter/screens/basket/widgets/widgets.dart';
import 'package:kpm_flutter/screens/screens.dart';
import 'package:kpm_flutter/widgets/widgets.dart';
import 'package:kpm_flutter/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({ Key? key }) : super(key: key);

  @override
  _BasketScreenState createState() =>  _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {

  late double width;
  late double height;
  late bool isWideScreen;
  late bool isMobile;
  double get getSize => isWideScreen? (height /  8) : (height / (isMobile? 10 : 12));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          child: ResponsiveBuilder(
            builder: (context, sizingInformation) {

              width = sizingInformation.screenSize.width;
              height = sizingInformation.screenSize.height;
              isWideScreen = height < width;
              isMobile = sizingInformation.isMobile;
              
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                    TitleSupportText(
                      sizingInformation: sizingInformation,
                    ),
                    BasketPaymentMenu(
                      sizingInformation: sizingInformation,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: SizedBox(
                        height: getSize, 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ActionButton(
                              name: 'Оплатить\nкорзину', 
                              buttonGradientColors: AppStyles.payBasketColor, 
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomPaymentScreen())),
                            ),
                            const SizedBox(width: 24),
                            ActionAddButton(
                              name: 'Добавить\nплатеж', 
                              buttonGradientColors: AppStyles.blueGradientColors, 
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentReceiptScreen())),
                            ),
                            const SizedBox(width: 24),
                            ActionButton(
                              name: 'Очистить\nкорзину', 
                              buttonGradientColors: AppStyles.clearBasketColor, 
                              onTap: () {},
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