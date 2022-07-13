import 'package:flutter/material.dart';
import 'package:kpm_flutter/screens/offer/widgets/widgets.dart';
import 'package:kpm_flutter/widgets/action_button.dart';
import 'package:kpm_flutter/widgets/widgets.dart';
import 'package:kpm_flutter/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({ Key? key }) : super(key: key);

  @override
  _OfferScreenState createState() =>  _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
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
                const OfferPdfMenu(),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      ActionButton(
                        name: 'Главное меню', 
                        buttonGradientColors: AppStyles.navigationHomeColor, 
                        onTap: () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                      ),
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