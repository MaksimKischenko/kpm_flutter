import 'package:flutter/material.dart';

class AppStyles {

  final BuildContext context;
  
  AppStyles({
    required this.context,
  });

  static const List<Color> redGradientColors = [
    Color(0xffE53823),
    Color(0xffE53823),
    Color(0xffA81904)
  ];

  static const List<Color> orangeGradientColors = [
    Color(0xffEB9103),
    Color(0xffD76107),
    Color(0xffBD280C)
  ];

  static const List<Color> greyGradientColors = [
    Color(0xffB0B1B1),
    Color(0xff929393),
    Color(0xff6F7070)
  ];

  static const List<Color> blueGradientColors = [
    Color(0xff2B4490),
    Color(0xff2C3878),
    Color(0xff2D2B5F)
  ];

  static const List<Color> payBasketColor = [
    Color(0xff478B79),
    Color(0xff478B79),
  ];

  static const List<Color> clearBasketColor = [
    Color(0xffD65F09),
    Color(0xffBD240B),
  ];

  static const List<Color> navigationBackColor = [
    Color(0xffF7A83B),
    Color(0xffF7A83B),
  ];

  static const List<Color> navigationHomeColor = [
    Color(0xff2B3F77),
    Color(0xff2B3F77),
  ];

  static const List<Color> navigationNextColor = [
    Color(0xffA5B51D),
    Color(0xffA5B51D),
  ];




  static const TextStyle buttonTextStyleWidthScreen = TextStyle(
    fontWeight: FontWeight.w700,
    color: Colors.white,
    fontSize: 30,
  );

  static const TextStyle basketTitleStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 54,
    color: Color(0xff2D2B5F),
  );

  static const TextStyle simpleTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 25,
  );


//!
  static const TextStyle eripActionTextStyleMobile = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 12,
    color: Colors.white,
  );

  
  static const TextStyle eripActionTextStyleTablet = TextStyle(
    fontWeight: FontWeight.w800,
    color: Colors.white,
  );

  static const TextStyle tableTextStyleMobile = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 10,
  );


  static const TextStyle buttonTextStyleTablet = TextStyle(
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static const TextStyle buttonTextStyleMobile = TextStyle(
    fontWeight: FontWeight.w900,
    color: Colors.white,
    fontSize: 10
  );

  static const TextStyle basketTableHeadingStyleTablet = TextStyle(
    fontWeight: FontWeight.w800,
    color: Color(0xffEB9103),
    fontSize: 15
  );

  static const TextStyle basketTableHeadingStyleMobile = TextStyle(
    fontWeight: FontWeight.w800,
    color: Color(0xffEB9103),
    fontSize: 10
  );
}
