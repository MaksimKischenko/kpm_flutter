
import 'package:flutter/material.dart';

class TextFormatKeyButton extends StatelessWidget {
  final Function()? onTap;

  const TextFormatKeyButton({
    Key? key,
    this.onTap,
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
        color: const Color(0xffE65222),
        child: InkWell(
          onTap: onTap,
          child: const Center(child: Icon(Icons.text_format, color: Colors.white)),
        ),
      ),
    );
  }
}