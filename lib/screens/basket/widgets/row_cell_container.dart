import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class RowCellContainer extends StatelessWidget {

  final SizingInformation sizingInformation;
  final List<Widget> dataInfo;

  const RowCellContainer({
    Key? key,
    required this.sizingInformation,
    required this.dataInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double width  = sizingInformation.screenSize.width;
    double height = sizingInformation.screenSize.height;
    bool isWideScreen = height < width;
    bool isMobile = sizingInformation.isMobile;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        width: isWideScreen? (isMobile? 40: 80) : (isMobile? 40 : 80),
        child: Column(
          children: dataInfo
        ),
      ),
    );
  }
}
