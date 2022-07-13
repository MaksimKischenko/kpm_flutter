import 'package:flutter/material.dart';

import 'package:kpm_flutter/styles.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:responsive_builder/responsive_builder.dart';

class EripAction extends StatelessWidget {

  final String name;
  final Function() onTap;
  final SizingInformation sizingInformation;



  const EripAction({
    Key? key,
    required this.name,
    required this.onTap,
    required this.sizingInformation,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    double width  = sizingInformation.screenSize.width;
    double height = sizingInformation.screenSize.height;
    bool isWideScreen = height  < width;
    bool isMobile = sizingInformation.isMobile;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Container(
        alignment: Alignment.center,
        width: isWideScreen? (width / 4.5) : (width / 3.5),
        padding: EdgeInsets.symmetric(vertical: isWideScreen? (isMobile? 10 :40):20),
        child: AutoSizeText(
            name.toUpperCase(), 
            style: isMobile? AppStyles.eripActionTextStyleMobile: AppStyles.eripActionTextStyleTablet, 
            textAlign: TextAlign.center, 
            maxLines: 4,
          ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(8), 
          color: const Color(0xff2B3F77),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.8), blurRadius: 8),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
