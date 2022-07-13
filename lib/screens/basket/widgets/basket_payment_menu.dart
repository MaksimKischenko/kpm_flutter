

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kpm_flutter/screens/basket/widgets/widgets.dart';

import 'package:kpm_flutter/styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BasketPaymentMenu extends StatefulWidget {

  final SizingInformation sizingInformation;

  const BasketPaymentMenu({
    Key? key,
    required this.sizingInformation,
  }) : super(key: key);


  @override
  _BasketPaymentMenuState createState() => _BasketPaymentMenuState();
}

class _BasketPaymentMenuState extends State<BasketPaymentMenu> {

  late double width;
  late double height;
  late bool isWideScreen;
  late bool isMobile;
  TextStyle get getHeadingColumnStyle => isMobile? AppStyles.basketTableHeadingStyleMobile: AppStyles.basketTableHeadingStyleTablet;

  @override
  Widget build(BuildContext context) {
    
    width  = widget.sizingInformation.screenSize.width;
    height = widget.sizingInformation.screenSize.height;
    isWideScreen = height < width;
    isMobile = widget.sizingInformation.isMobile;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.8), blurRadius: 8),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: isWideScreen? 10 : 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children:   [
                AutoSizeText(
                  'Корзина платежей', 
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: isWideScreen? 30 : 60,
                    color: const Color(0xff2D2B5F)
                  )
                ),
                Expanded(
                  flex: isWideScreen? 1:0,
                  child: SizedBox(
                    width: width,
                    child: DataTable(
                      columnSpacing: isWideScreen? width / 80 : width / 40,
                      headingRowColor: MaterialStateProperty.all(Colors.transparent),
                      columns:  [
                        DataColumn(label: Text('№ в ЕРИП', style: getHeadingColumnStyle)),
                        DataColumn(label: Text('Дата', style: getHeadingColumnStyle)),
                        DataColumn(label: Text('Наименование', style: getHeadingColumnStyle)),
                        DataColumn(label: Text('Счет', style: getHeadingColumnStyle)),  
                        DataColumn(label: Text('Сумма', style: getHeadingColumnStyle)),                 
                      ],
                      rows:  [
                        DataRow(
                          cells: [
                            DataCell(
                              RowCellContainer(
                                sizingInformation: widget.sizingInformation,
                                dataInfo: [
                                  Text('123456789', maxLines: 2, style: isMobile? AppStyles.tableTextStyleMobile : null),
                                ],
                              )
                            ),
                            DataCell(
                              RowCellContainer(
                                sizingInformation: widget.sizingInformation,
                                dataInfo: [
                                  Text('12.12.2023', maxLines: 2, style: isMobile? AppStyles.tableTextStyleMobile : null),
                                ],
                              )
                            ),
                             DataCell(
                              RowCellContainer(
                                sizingInformation: widget.sizingInformation,
                                dataInfo:  [
                                  Text('мтс платежи', maxLines: 2, style: isMobile? AppStyles.tableTextStyleMobile : null),
                                ],
                              )
                            ),
                             DataCell(
                              RowCellContainer(
                                sizingInformation: widget.sizingInformation,
                                dataInfo: [
                                  Text('12345678910abc', maxLines: 2, style: isMobile? AppStyles.tableTextStyleMobile : null),
                                ],
                              )
                            ),
                            DataCell(
                              RowCellContainer(
                                sizingInformation: widget.sizingInformation,
                                dataInfo:  [
                                  Text('1234.34', maxLines: 2, style: isMobile? AppStyles.tableTextStyleMobile : null),
                                ],
                              )
                            ),                                                                                                          
                          ]
                        )
                      ] 
                    ),
                  ),
                ), 
              ],
            ),
          ),
        ),
      ),
    );
  }
}