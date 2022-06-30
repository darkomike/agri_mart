import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {Key? key,
      required this.title,
      required this.height,
      this.buttonOutlineColor,
      this.titleStyle,
      this.margin,
      this.padding,
      this.borderRadius,
      this.backgroundColor, this.alignment,
      this.elevation,
      this.width,
      this.overlayColor,
      this.onHover,
      this.onPressed})
      : super(key: key);

  final String title;
  final double height;
  final double? width;
  final double? elevation;
  final double? borderRadius;
  final Color? buttonOutlineColor;
  final TextStyle? titleStyle;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;

  final Function()? onPressed;
  final Function(bool)? onHover;
  final MaterialStateProperty<Color?>? backgroundColor;
  final MaterialStateProperty<Color?>? overlayColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      alignment: alignment,
      height: height,
      width: width,
      child: ElevatedButton(
          onHover: onHover,
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(elevation ?? 0),
              side: MaterialStateProperty.all(
                BorderSide(color: buttonOutlineColor ?? Colors.green.shade100),
              ),
              backgroundColor: backgroundColor,
              overlayColor: overlayColor,
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius ?? 10)))),
          onPressed: onPressed,
          child: Text(
            title,
            style: titleStyle ?? Theme.of(context).textTheme.headline6,
          )),
    );
  }
}
