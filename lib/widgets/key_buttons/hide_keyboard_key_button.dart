import 'package:flutter/material.dart';

class HideKeyboardKeyButton extends StatelessWidget {
  final Function()? onAction;

  const HideKeyboardKeyButton({
    Key? key,
    this.onAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    late double xDivider;
    late double yDivider;

    if (height < width) {
      xDivider = 12.5;
      yDivider = 20;
    } else {
      xDivider = 20;
      yDivider = 12.5;
    }

    return SizedBox(
      height: height / xDivider,
      width: width / yDivider,
      child: Material(
        borderRadius: BorderRadius.circular(6),
        color: const Color(0xff54A2AE),
        child: InkWell(
          onTap: onAction,
          child: const Center(child: Icon(Icons.keyboard_hide, color: Colors.white)),
        ),
      ),
    );
  }
}




