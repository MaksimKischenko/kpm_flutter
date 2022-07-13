
import 'package:flutter/material.dart';

class TextKeyButton extends StatelessWidget {
  final String? text;
  final Function(String)? onTextInput;

  const TextKeyButton({
    Key? key,
    required this.text,
    this.onTextInput,
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
        color: const Color(0xff9D9EA8),
        child: InkWell(
          onTap: () {
            onTextInput?.call(text ?? '');
          },
          child: Center(child: Text(text ?? '', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600))),
        ),
      ),
    );
  }
}
