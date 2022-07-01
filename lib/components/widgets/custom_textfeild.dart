import 'package:block_agri_mart/components/theme/color_constant.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.controller,
   
    this.disabledBorder,
    this.autofocus, this.minLines, this.maxLines,
    this.cursorColor,
    this.focusedBorder,
    this.keyboardAppearance,
    this.keyboardType,
    this.suffix,
    this.border, this.labelStyle,
    this.enabledBoarder,
    this.focusColor,
    this.onChanged,
    this.validator,
    this.hintText,
    this.label,
  }) : super(key: key);

  final TextEditingController controller;
  final Widget? label;

  final String? hintText;
  final int? maxLines;
  final int? minLines;
  
  final String? Function(String?)? validator;
  final bool? autofocus;
  final Color? cursorColor;
  final Color? focusColor;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final Brightness? keyboardAppearance;
  final Widget? suffix;
  final TextStyle? labelStyle;
  final InputBorder? border;
  final InputBorder? enabledBoarder;
  final InputBorder? focusedBorder;
  final InputBorder? disabledBorder;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      autocorrect: true,
      autofocus: autofocus ?? false,
      cursorColor: cursorColor ?? ColorConstants.greenPantone,
      keyboardType: keyboardType,
      onChanged: onChanged,
      keyboardAppearance: keyboardAppearance,
      minLines: minLines,
      maxLines: maxLines,
       autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      decoration: InputDecoration(
          
          labelStyle: labelStyle,
          focusedBorder: focusedBorder,
          disabledBorder: disabledBorder,
          enabledBorder: enabledBoarder,
          fillColor: ColorConstants.greenPantone,
          focusColor: focusColor,
          label: label,
          hintText: hintText,
          suffix: suffix,
          border: border),
    );
  }
}
