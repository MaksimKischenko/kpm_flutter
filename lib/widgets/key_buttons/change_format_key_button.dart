import 'package:flutter/material.dart';

class ChangeFormatKeyButton extends StatelessWidget {

  final String? buttonName;
  final Function()? onAction;

  const ChangeFormatKeyButton({
    Key? key,
    this.onAction,
    this.buttonName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double xDivider;
    double yDivider;

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
          onTap: () {
            onAction?.call();
          },
          child: Center(child: FittedBox(child: Text(buttonName ?? '', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)))),
        ),
      ),
    );
  }
}
