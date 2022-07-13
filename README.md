## Guidelines
Run the example of connecting to OpenFin and creating applications

1. Clone this repository

2. If pubspec.yaml file drops error with pockets compatibility try write a command: dart pub upgrade --null-safety 

3. Go to release directory and start void main (run)

4. Once the flutter app starts in emulator you will see screens of app

5. In App that shows just a UI of real project. Adaptive for mobile and Tablet screen.
    #### custom keyboard with insert text logic 
    #### pdf viewer  
    #### adaptive interface for mobile and tablets 



## Source Code Review

Source code for the example is located in /lib/. 
Start point of app is main.dart

We use Bloc core as main statemanagment instrument in all app

1. KeyBoard handler 

```dart
  List<String> rusKeybord = [
    'й','ц','у','к','е','н','г','ш','щ','з','x',
    'ф','ы','в','а','п','р','о','л','д','ж','э',
    'я','ч','с','м','и','т','ь','б','ю','ъ', 
  ];

  List<String> engKeybord = [
    'q','w','e','r','t','y','u','i','o','p',
    'a','s','d','f','g','h','i','k','l',
    'z','x','c','v','b','n','m', 
  ];

  final List<String> numKeybord = List<String>.generate(9, (index) => (index+1).toString());


  void insertText(String myText, TextEditingController controller) {
    final text = controller.text;
    final textSelection = controller.selection;
    final newText = text.replaceRange(
      textSelection.start,
      textSelection.end,
      myText,
    );
    final myTextLength = myText.length;
    controller.text = newText;
    controller.selection = textSelection.copyWith(
      baseOffset: textSelection.start + myTextLength,
      extentOffset: textSelection.start + myTextLength,
    );
  }


  void backspace(TextEditingController controller) {
    final text = controller.text;
    final textSelection = controller.selection;
    final selectionLength = textSelection.end - textSelection.start;

    if (selectionLength > 0) {
      final newText = text.replaceRange(
        textSelection.start,
        textSelection.end,
        '',
      );
      controller.text = newText;
      controller.selection = textSelection.copyWith(
        baseOffset: textSelection.start,
        extentOffset: textSelection.start,
      );
      return;
    }

    if (textSelection.start == 0) {
      return;
    }

    // Delete the previous character
    final previousCodeUnit = text.codeUnitAt(textSelection.start - 1);
    final offset = _isUtf16Surrogate(previousCodeUnit) ? 2 : 1;
    final newStart = textSelection.start - offset;
    final newEnd = textSelection.start;
    final newText = text.replaceRange(
      newStart,
      newEnd,
      '',
    );
    controller.text = newText;
    controller.selection = textSelection.copyWith(
      baseOffset: newStart,
      extentOffset: newStart,
    );
  }

  bool _isUtf16Surrogate(int value) {
    return value & 0xF800 == 0xD800;
  }
```
1. CustomKeyboard widget 

```dart
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
```
