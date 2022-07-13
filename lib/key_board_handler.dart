
  import 'package:flutter/material.dart';



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