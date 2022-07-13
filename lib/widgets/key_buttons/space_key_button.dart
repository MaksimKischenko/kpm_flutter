

import 'package:flutter/material.dart';

class SpaceKeyButtom extends StatelessWidget {
  final bool isRussian;
  final Function(String)? onTextInput;

  const SpaceKeyButtom({
    Key? key,
    this.isRussian = true,
    this.onTextInput,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String spaceText = ' ';
    
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    late double xDivider;
    late double yDivider;

    if (height < width) {
      xDivider = 12.5;
      yDivider = 3.5;
    } else {
      xDivider = 20;
      yDivider = 2.8;
    }

    return SizedBox(
      height: height / xDivider,
      width: isRussian? width / yDivider : width / (yDivider - 0.6), 
      child: Material(
        borderRadius: BorderRadius.circular(6),
        color: const Color(0xff457e70),
        child: InkWell(
          onTap: () {
            onTextInput?.call(spaceText);
          } 
        ),
      ),
    );
  }
}


