import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final FocusNode? focusNode;
  final double? width;
  final double? heigth;
  final bool isReadOnly;
  final TextEditingController? controller;
  final Function(String value)? onSaved;
  final int? maxLength;
  final String? hint;
  final Function(String?)? onChanged;
  final String? Function(String)? validator;
 
  const CustomTextField({
    Key? key,
    this.focusNode,
    this.width,
    this.heigth,
    this.isReadOnly = true,
    this.controller,
    this.onSaved,
    this.maxLength,
    this.hint,
    this.onChanged,
    this.validator, 
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    bool isWideScreen = (heigth ?? 0) < (width ?? 0);

    return  SizedBox(
      width: (width ?? 0) / 1.4,
      child: TextFormField(
        enableInteractiveSelection: false,
        focusNode: focusNode,
        cursorColor: const Color(0xffD76107),
        controller: controller,
        showCursor: true, 
        cursorWidth: 3,
        readOnly: isReadOnly,
        minLines: 1,
        maxLines: 1,
        textInputAction: TextInputAction.none,
        style: TextStyle(
          fontSize: isWideScreen? 32: 16,
          fontWeight: FontWeight.w500
        ),
        onChanged: onChanged,
        maxLength: maxLength, 
        decoration: InputDecoration(
          contentPadding: isWideScreen? null : const EdgeInsets.all(12),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffEB9103), width: 3),
            borderRadius: BorderRadius.circular(5)
          ),
          alignLabelWithHint: true,
          filled: true,
          isDense: true,
          hintText: hint,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5)
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:  const BorderSide(color: Color(0xffEB9103), width: 3),
            borderRadius: BorderRadius.circular(6)
          )
        ),
        validator: (value) {
          return validator?.call(value ?? '');
        },
        onSaved: (value) => onSaved?.call(value ?? ''),
      ),
    ); 
  }
}
