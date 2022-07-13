import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    _controller.repeat(period:  const Duration(seconds: 2));   
  
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.grey[600]?.withOpacity(0.5),
          child: Center(
            child: RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
                child: SizedBox(
                  height: height / 4 ,
                  width: width,
                  child: Image.asset('assets/sandhours.png')
                ),
              )
            ),
          ),
        )
    );
  }
}