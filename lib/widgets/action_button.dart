import 'package:flutter/material.dart';
import 'package:kpm_flutter/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ActionButton extends StatelessWidget {

  final String name;
  final List<Color> buttonGradientColors;
  final Function() onTap;

 
  const ActionButton({
    Key? key,
    required this.name,
    required this.buttonGradientColors,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Expanded(
      child: ResponsiveBuilder(
        builder: (context, sizedInformation) {
          return Ink(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(8), 
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: buttonGradientColors
              ),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.8), blurRadius: 8),
              ],
            ),
            child: InkWell(
              onTap: onTap,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: FittedBox(
                  child: Text(
                    name.toUpperCase(), 
                    style: sizedInformation.isMobile? AppStyles.buttonTextStyleMobile : AppStyles.buttonTextStyleTablet, 
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
