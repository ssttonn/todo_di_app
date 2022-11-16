import 'package:flutter/material.dart';
import 'package:todo_app/src/base/extensions.dart';

class SpacingRow extends Row {
  SpacingRow(
      {super.key,
      super.mainAxisAlignment,
      super.mainAxisSize,
      super.crossAxisAlignment,
      super.textDirection,
      super.verticalDirection,
      super.textBaseline,
      bool leadSpacing = false,
      bool tailSpacing = false,
      required List<Widget> children,
      double spacing = 0})
      : super(children: [
          if (leadSpacing) SizedBox(width: spacing),
          ...spacing > 0
              ? children.addBetweenItems(SizedBox(width: spacing))
              : children,
          if (tailSpacing) SizedBox(width: spacing)
        ]);
}
