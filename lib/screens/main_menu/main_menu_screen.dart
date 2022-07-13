import 'package:flutter/material.dart';
import 'package:kpm_flutter/screens/screens.dart';
import 'package:kpm_flutter/widgets/widgets.dart';
import 'package:kpm_flutter/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'widgets.dart/widget.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({ Key? key }) : super(key: key);

  @override
  _MainMenuScreenState createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {

  final List<PaymentElement> paymentElements = [
    PaymentElement(onTap: () {}, elementName: 'mts'),
    PaymentElement(onTap: () {}, elementName: 'mts'),
    PaymentElement(onTap: () {}, elementName: 'mts'),
    PaymentElement(onTap: () {}, elementName: 'mts'),
    PaymentElement(onTap: () {}, elementName: 'mts'),
    PaymentElement(onTap: () {}, elementName: 'mts'),
    PaymentElement(onTap: () {}, elementName: 'mts'),
    PaymentElement(onTap: () {}, elementName: 'mts'),
    PaymentElement(onTap: () {}, elementName: 'mts'),
    PaymentElement(onTap: () {}, elementName: 'mts'),
    PaymentElement(onTap: () {}, elementName: 'mts'),
    PaymentElement(onTap: () {}, elementName: 'mts'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Scrollbar(
            child: ResponsiveBuilder(
              builder: (context, sizingInformation) {

                double width = sizingInformation.screenSize.width;
                double height = sizingInformation.screenSize.height;
                bool isWideScreen = height < width;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TitleSupportText(
                      sizingInformation: sizingInformation,
                    ),
                    SizedBox(
                      height: height / 6,
                      width: width,
                      child: Image.asset('assets/main_banner.png', fit: BoxFit.fill)
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: GridView(
                          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: isWideScreen? 4.4 : 2.2,
                            crossAxisCount: isWideScreen? 4 : 3,
                            mainAxisSpacing: 30,
                            crossAxisSpacing: 30
                          ),
                          children: paymentElements
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ActionButton(
                            name: 'Корзина', 
                            buttonGradientColors: AppStyles.redGradientColors, 
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const BasketScreen())),
                          ),
                          const SizedBox(width: 24),
                          ActionButton(
                            name: 'Все услуги', 
                            buttonGradientColors: AppStyles.orangeGradientColors, 
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ServicesScreen())),
                          ),
                          const SizedBox(width: 24),
                          ActionButton(
                            name: 'Офёрта', 
                            buttonGradientColors: AppStyles.greyGradientColors, 
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const OfferScreen())),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        )
      )
    );
  }
}