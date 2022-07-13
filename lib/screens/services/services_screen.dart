import 'package:flutter/material.dart';
import 'package:kpm_flutter/screens/screens.dart';
import 'package:kpm_flutter/widgets/widgets.dart';
import 'package:kpm_flutter/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({ Key? key }) : super(key: key);

  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          child: ResponsiveBuilder(
            builder: (context, sizingInformation) {

              return Column(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                TitleSupportText(
                  sizingInformation: sizingInformation,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      EripAction(
                        name: 'Ерип',
                        sizingInformation: sizingInformation,
                        onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => const ServicesPaymentsScreen(),
                            )
                          );                         
                        },
                      ),
                    ],
                  ),
                ),
                const Spacer(),
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