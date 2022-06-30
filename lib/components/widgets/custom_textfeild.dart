import 'package:block_agri_mart/components/theme/color_constant.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.controller,
     this.width,
    required this.height,
    this.autofocus,
    this.cursorColor,
    this.keyboardAppearance,
    this.keyboardType,
    this.suffix,this.border, this.enabledBoarder, this.focusColor,
    this.onChanged,
    this.validator,
    this.hintText,
     this.label,
  }) : super(key: key);

  final TextEditingController controller;
  final Widget? label;

  final String? hintText;
  final double? width;
  final double height;
  final String? Function(String?)? validator;
  final bool? autofocus;
  final Color? cursorColor;
  final Color? focusColor;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final Brightness? keyboardAppearance;
  final Widget? suffix;
  final InputBorder? border;
  final InputBorder? enabledBoarder;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: width,
      height: height,
      child: TextFormField(
        validator: validator,
        autocorrect: true,
        autofocus: autofocus ?? true,
        cursorColor: cursorColor ?? ColorConstants.greenPantone,
        keyboardType: keyboardType,
        onChanged: onChanged,
        
        keyboardAppearance: keyboardAppearance,
        controller: controller,
        decoration: InputDecoration(enabledBorder: enabledBoarder, focusColor: focusColor,
            label: label, hintText: hintText, suffix: suffix, border: border),
      ),
    );
  }
}
