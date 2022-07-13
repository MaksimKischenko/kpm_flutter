import 'package:flutter/material.dart';
import 'package:kpm_flutter/key_board_handler.dart';
import 'package:kpm_flutter/styles.dart';
import 'package:kpm_flutter/widgets/widgets.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CustomPaymentScreen extends StatefulWidget {
  const CustomPaymentScreen({ Key? key }) : super(key: key);

  @override
  _CustomPaymentScreenState createState() => _CustomPaymentScreenState();
}

class _CustomPaymentScreenState extends State<CustomPaymentScreen> {

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode =  FocusNode();
  bool _isHidden = true;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() { 
      if(_focusNode.hasFocus) {
        setState(() {
          _isHidden = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          child: ResponsiveBuilder(
            builder: (context, sizingInformation) {

              double width = sizingInformation.screenSize.width;
              double height = sizingInformation.screenSize.height;
              bool isMobile = sizingInformation.isMobile;

              return Column(
                children: [
                  TitleSupportText(
                    sizingInformation: sizingInformation,
                  ),
                  Padding(
                    padding: EdgeInsets.all(isMobile? 10 : 20),
                    child: SizedBox(
                      height: isMobile? (height / 12 ) : null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomTextField(
                            controller: _controller,
                            focusNode: _focusNode,
                            width: width,
                            heigth: height,
                          ),
                          HideKeyboardKeyButton(
                            onAction: () {
                              setState(() {
                                var valueFromState = context.findAncestorStateOfType<CustomKeyboardState>()?.isHidden;
                                valueFromState = !(valueFromState ?? true);
                              });
                            } 
                          ),
                          BackspaceKeyButton(
                            onTap: () =>_focusNode.hasFocus? backspace(_controller) : null
                          )
                        ],
                      ),
                    ),
                  ),
                  //remove
                  Expanded(child: Container()),
                  CustomKeyboard(
                    isHidden: _isHidden,
                    onTextInput: (value) => _focusNode.hasFocus? insertText(value, _controller): null,
                    onBackspace: () =>  _focusNode.hasFocus? backspace(_controller): null,
                    heigth: height,
                    width: width,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        ActionButton(
                          name: 'Главное меню',
                          onTap: () => Navigator.popUntil(context, (route) => route.isFirst),                 
                          buttonGradientColors: AppStyles.navigationHomeColor,                    
                        ),
                        const SizedBox(width: 24),
                        ActionButton(
                          name: 'Вперед',
                          onTap: () {},
                          buttonGradientColors: AppStyles.navigationNextColor,
                        ),                    
                      ],
                    ),
                  )        
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}