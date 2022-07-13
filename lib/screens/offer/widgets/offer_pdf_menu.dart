import 'package:flutter/material.dart';
import 'package:kpm_flutter/styles.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class OfferPdfMenu extends StatefulWidget {
  const OfferPdfMenu({ Key? key }) : super(key: key);

  @override
  _OfferPdfMenuState createState() => _OfferPdfMenuState();
}

class _OfferPdfMenuState extends State<OfferPdfMenu> {
 

 late PdfController _pdfController;  

  @override
  void initState() {
    super.initState();
    _pdfController  = PdfController(
    document: PdfDocument.openAsset('assets/offer.pdf'));
  }

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.8), blurRadius: 8),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const FittedBox(child: Text('Оферта', style: AppStyles.basketTitleStyle)),
                Expanded(
                  child: PdfView(
                    controller: _pdfController,
                    scrollDirection: Axis.vertical,
                    renderer: (PdfPage page) {
                      return page.render(
                        width: page.width * 4, 
                        height: page.height * 4,
                      );
                    },
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}