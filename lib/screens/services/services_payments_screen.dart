import 'package:flutter/material.dart';
import 'package:kpm_flutter/widgets/widgets.dart';
import 'package:kpm_flutter/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ServicesPaymentsScreen extends StatefulWidget {
  const ServicesPaymentsScreen({ Key? key }) : super(key: key);

  @override
  _ServicesPaymentsScreenState createState() => _ServicesPaymentsScreenState();
}

class _ServicesPaymentsScreenState extends State<ServicesPaymentsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          child: ResponsiveBuilder(
            builder: (context, sizingInformation) {
              double width = sizingInformation.screenSize.width;
              double height = sizingInformation.screenSize.height;
              bool isWideScreen  = height < width;
              bool isMobile = sizingInformation.isMobile;

              final List<EripAction> paymentElements = [
                EripAction(onTap: () {}, name: 'Оплата за государственный реестр', sizingInformation: sizingInformation),
                EripAction(onTap: () {}, name: 'Интернте', sizingInformation: sizingInformation),
                EripAction(onTap: () {}, name: 'Телефония МТС и любая', sizingInformation: sizingInformation),
                EripAction(onTap: () {}, name: 'кекекекеке', sizingInformation: sizingInformation),
                EripAction(onTap: () {}, name: 'mtкекекекекекеs', sizingInformation: sizingInformation),
                EripAction(onTap: () {}, name: 'mкекекts', sizingInformation: sizingInformation),
                EripAction(onTap: () {}, name: 'mк ек екеке ts', sizingInformation: sizingInformation),
                EripAction(onTap: () {}, name: 'mкекее кеке кек ек ts', sizingInformation: sizingInformation),
                EripAction(onTap: () {}, name: 'mtкекекекккккеке ке кеке кекs', sizingInformation: sizingInformation),
                EripAction(onTap: () {}, name: 'mеееееееts', sizingInformation: sizingInformation),
                EripAction(onTap: () {}, name: 'mкекеts', sizingInformation: sizingInformation),
                EripAction(onTap: () {}, name: 'mкекекеts', sizingInformation: sizingInformation),
                EripAction(onTap: () {}, name: 'Оплата Горингаза', sizingInformation: sizingInformation),
                EripAction(onTap: () {}, name: 'Интернте', sizingInformation: sizingInformation),
                EripAction(onTap: () {}, name: 'Телефония МТС и любая', sizingInformation: sizingInformation),
                EripAction(onTap: () {}, name: 'кекекекеке', sizingInformation: sizingInformation),
                EripAction(onTap: () {}, name: 'mtкекекекекекеs', sizingInformation: sizingInformation),
                EripAction(onTap: () {}, name: 'mкекекts', sizingInformation: sizingInformation),
                EripAction(onTap: () {}, name: 'mк ек екеке ts', sizingInformation: sizingInformation),
                EripAction(onTap: () {}, name: 'mкекее кеке кек ек ts', sizingInformation: sizingInformation),
                EripAction(onTap: () {}, name: 'mtкекекекккккеке ке кеке кекs', sizingInformation: sizingInformation),
                EripAction(onTap: () {}, name: 'mеееееееts', sizingInformation: sizingInformation),
                EripAction(onTap: () {}, name: 'mкекеts', sizingInformation: sizingInformation),
                EripAction(onTap: () {}, name: 'mкекекеts fgfg fg fg fgfg fg fg fg fgfgfgfgfgfg dfdkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkfdf df df d ', sizingInformation: sizingInformation),
              ];

              return Column(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                TitleSupportText(
                  sizingInformation: sizingInformation,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: GridView(
                      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: isWideScreen? 3.4 : (isMobile? 1.2 : 2.2),
                        crossAxisCount: isWideScreen? 4 : 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10
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
                        name: 'Назад', 
                        buttonGradientColors: AppStyles.navigationBackColor, 
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(width: 24),
                      ActionButton(
                        name: 'Главное меню', 
                        buttonGradientColors: AppStyles.navigationHomeColor, 
                        onTap: () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                      )
                    ],
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