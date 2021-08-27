import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class IconButtonAtom extends StatelessWidget {
  final void Function() onPressed;
  final Widget icon;
  final Color? color;
  final double padding;
  final NeumorphicShape shape;

  IconButtonAtom({
    required this.onPressed,
    required this.icon,
    this.color,
    this.padding = 0,
    this.shape = NeumorphicShape.flat,
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      style: NeumorphicStyle(
        color: color,
        boxShape: NeumorphicBoxShape.circle(),
        shape: shape,
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: icon,
      ),
      onPressed: onPressed,
    );
  }
}
