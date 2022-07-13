import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TitleSupportText extends StatelessWidget {


  final SizingInformation sizingInformation;
  const TitleSupportText({
    Key? key,
    required this.sizingInformation
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    double width  = sizingInformation.screenSize.width;
    double height = sizingInformation.screenSize.height;    
    bool isWideScreen = height < width;
    
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/logo_dom.png', width: (isWideScreen? width / 1.4: width) / 2.5),
          SizedBox(
            width: (isWideScreen? width / 1.4: width) / 2.5,
            child: const FittedBox(
              child: Text(
                'ТЕХНИЧЕСКАЯ ПОДЕРЖКА\n+375 17 279-87-88\nМинск, пр. Независимости, 172\nMdom.by', 
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

