import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../tools/conditional_widget.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.isBusy = false,
    this.label,
    this.onPressed,
    this.color = Palette.primary,
    this.radius = 5,
    this.labelSize,
    this.labelWeight,
    this.labelColor,
    this.isExpanded = false,
    this.focusColor,
    this.child,
    this.visualDensity,
    this.materialTapTargetSize,
    this.padding,
    this.borderColor = Colors.transparent,
    this.minWidth,
    this.top = 0,
    this.bottom = 0,
    this.margin,
  });

  final String? label;
  final double? labelSize;
  final FontWeight? labelWeight;
  final double radius;
  final bool isBusy;
  final Color color;
  final Color? labelColor;
  final Color? focusColor;
  final Color borderColor;
  final VoidCallback? onPressed;
  final bool isExpanded;
  final Widget? child;
  final VisualDensity? visualDensity;
  final MaterialTapTargetSize? materialTapTargetSize;
  final EdgeInsetsGeometry? padding;
  final double? minWidth;
  final double top;
  final double bottom;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.only(top: top, bottom: bottom),
      child: MaterialButton(
        height: 50,
        minWidth: isExpanded ? double.infinity : minWidth,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: BorderSide(color: borderColor, width: 1),
        ),
        disabledColor: color.withOpacity(0.5),
        visualDensity: visualDensity,
        materialTapTargetSize: materialTapTargetSize,
        padding: padding,
        onPressed: onPressed == null
            ? null
            : isBusy
                ? () {}
                : onPressed,
        focusColor: focusColor ?? Colors.white12,
        highlightColor: focusColor ?? Colors.white12,
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        disabledElevation: 0,
        highlightElevation: 0,
        child: If(
          condition: !isBusy,
          builder: (context, value) {
            if (child != null) return child!;

            return Text(
              label ?? "",
              style: TextStyle(
                fontSize: labelSize ?? 15,
                fontWeight: labelWeight ?? FontWeight.w600,
                color: labelColor ?? Colors.white,
                height: 1.2,
              ),
            );
          },
          replacement: const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
