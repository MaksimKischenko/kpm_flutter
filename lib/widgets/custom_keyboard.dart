
import 'package:flutter/material.dart';
import 'package:kpm_flutter/key_board_handler.dart';
import 'package:kpm_flutter/widgets/widgets.dart';

class CustomKeyboard extends StatefulWidget {
  
  final Function(String)? onTextInput;
  final Function? onBackspace;
  final double? heigth;
  final double? width;

  bool isHidden;


  CustomKeyboard({
    Key? key,
    this.onTextInput,
    this.onBackspace,
    this.heigth,
    this.width,
    this.isHidden = true
  }) : super(key: key);


  @override
  State<CustomKeyboard> createState() => CustomKeyboardState();
}

class CustomKeyboardState extends State<CustomKeyboard> {

  bool _isUpperCase = false;
  bool _isRussian = true;
  bool _isNumeric = false;
  late bool isHidden;

  void _textInputHandler(String text) => widget.onTextInput?.call(text);

  void _backspaceHandler() => widget.onBackspace?.call();

  @override
  void initState() {
    super.initState();
    isHidden = widget.isHidden;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      color: Colors.grey[350],
      alignment: Alignment.center,
      child: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 6,
        children: _keyBoardChanger(context),
      ),
    );
  }

  List<Widget> _keyBoardChanger(BuildContext context) {
    if(widget.isHidden) return [];

    if(_isNumeric) {
      return [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SizedBox(
            width: widget.width,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    direction: Axis.vertical,
                    spacing: 6,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: numKeybord.getRange(0, 3).
                        map((e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: NumericKeyButton(text: e, onTextInput: _textInputHandler),
                        )).toList()
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: numKeybord.getRange(3, 6).
                        map((e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: NumericKeyButton(text: e, onTextInput: _textInputHandler),
                        )).toList()
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: numKeybord.getRange(6, 9).
                        map((e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: NumericKeyButton(text: e, onTextInput: _textInputHandler),
                        )).toList()
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: NumericKeyButton(text: '.', onTextInput: _textInputHandler),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                              child: NumericKeyButton(text: '0', onTextInput: _textInputHandler),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                              child: BackspaceNumericKeyButton(
                                onTap: _backspaceHandler,
                              ),
                          )
                        ]
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        HideKeyboardKeyButton(onAction: _hideKeeboardAction),
                        TextFormatKeyButton(
                          onTap: _changeNumericAction,
                        ),
                      ].expand((widget) => [widget, const Padding(padding:EdgeInsets.symmetric(vertical: 2))]).toList(),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ];
    } else if(_isRussian) {
      return [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: rusKeybord.getRange(0, 11).
          map((e) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: TextKeyButton(text: e, onTextInput: _textInputHandler),
          )).toList()
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: rusKeybord.getRange(11,22).
          map((e) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1),
            child: TextKeyButton(text: e, onTextInput: _textInputHandler),
          )).toList()
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...rusKeybord.getRange(22,32).
            map((e) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: TextKeyButton(text: e, onTextInput: _textInputHandler),
            )).toList(),
            ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: BackspaceKeyButton(onTap: _backspaceHandler),
            )]
          ]
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ChangeFormatKeyButton(
              buttonName: 'Shift',
              onAction: _shiftAction
            ),
            ChangeFormatKeyButton(
              buttonName: 'EN',
              onAction: _changeLanguageAction
            ),
            SpaceKeyButtom(
              isRussian: _isRussian,
              onTextInput: _textInputHandler
            ),
            NumberFormatKeyButton(
              buttonName: '123',
              onAction: _changeNumericAction
            ),
            PunctuationKeyButton(
              buttonName: ',',
              onTextInput: _textInputHandler
            ),
            PunctuationKeyButton(
              buttonName: '.',
              onTextInput: _textInputHandler
            ),
            PunctuationKeyButton(
              buttonName: '-',
              onTextInput: _textInputHandler
            ),
            HideKeyboardKeyButton(
              onAction: _hideKeeboardAction,
            )
          ].expand((widget) => [widget, const Padding(padding:EdgeInsets.symmetric(horizontal: 1))]).toList()
        )
      ];
    } else if(!_isRussian) {
      return [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: engKeybord.getRange(0, 10).
          map((e) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: TextKeyButton(text: e, onTextInput: _textInputHandler),
          )).toList()
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...engKeybord.getRange(10,19).
            map((e) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: TextKeyButton(text: e, onTextInput: _textInputHandler),
            )).toList(),
            ...[Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: PunctuationKeyButton(
                    buttonName: '-',
                    onTextInput: _textInputHandler
                  ),
                )
              ]
          ],
        ),      
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...engKeybord.getRange(19,26).
            map((e) => TextKeyButton(text: e, onTextInput: _textInputHandler)).toList(),
            ...[ 
              PunctuationKeyButton(
                buttonName: ',',
                onTextInput: _textInputHandler
              ),
              PunctuationKeyButton(
                buttonName: '.',
                onTextInput: _textInputHandler
              ), 
              BackspaceKeyButton(
                onTap: _backspaceHandler,
              )
            ]
          ].expand((widget) => [widget, const Padding(padding:EdgeInsets.symmetric(horizontal: 2))]).toList()
        ),      
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ChangeFormatKeyButton(
              buttonName: 'Shift',
              onAction: _shiftAction
            ),
            ChangeFormatKeyButton(
              buttonName: 'RU',
              onAction: _changeLanguageAction
            ),
            SpaceKeyButtom(
              isRussian: _isRussian,
              onTextInput: _textInputHandler
            ),
            NumberFormatKeyButton(
              buttonName: '123',
              onAction: _changeNumericAction
            ),
            PunctuationKeyButton(
              buttonName: ',',
              onTextInput: _textInputHandler
            ),
            HideKeyboardKeyButton(
              onAction: _hideKeeboardAction,
            )
          ].expand((widget) => [widget, const Padding(padding:EdgeInsets.symmetric(horizontal: 2))]).toList()
        )
      ];
    } 
    return [];
  }

  void _shiftAction() {
    _isUpperCase = !_isUpperCase;

    if(_isRussian) {
      setState(() {
        if(_isUpperCase) {
         rusKeybord = rusKeybord.map((e) => e.toUpperCase()).toList();
      } else {
         rusKeybord = rusKeybord.map((e) => e.toLowerCase()).toList();
        }
      });
    } else if (!_isRussian) {
      setState(() {
        if(_isUpperCase) {
         engKeybord = engKeybord.map((e) => e.toUpperCase()).toList();
      } else {
         engKeybord = engKeybord.map((e) => e.toLowerCase()).toList();
      }
      });
    }
  }

  void _changeLanguageAction() {
    setState(() {
      _isRussian = !_isRussian;
    });
  }

  void _hideKeeboardAction() {
    setState(() {
      widget.isHidden = !widget.isHidden;
    });
  }

  void _changeNumericAction() {
    setState(() {
      _isNumeric = !_isNumeric;
    });
  }
}




