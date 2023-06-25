import 'package:flutter/material.dart';
import 'package:mechanic/core/manager/colors_manager.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.padding = const EdgeInsets.symmetric(vertical: 10),
    this.margin,
    this.backgroundColor = ColorsManager.primary,
    this.titleColor = Colors.white,
    this.elevation,
    this.displayChild = false,
    this.child,
  }) : super(key: key);

  final String text;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final void Function()? onPressed;
  final Color backgroundColor;
  final Color titleColor;
  final double? elevation;
  final bool displayChild;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: double.maxFinite,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(padding),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          elevation: MaterialStateProperty.all(elevation),
        ),
        onPressed: onPressed,
        child: displayChild
            ? child
            : Text(
                text,
                style: TextStyle(color: titleColor),
              ),
      ),
    );
  }
}
