import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/App.dart';

class BackIconButton extends StatelessWidget {
  BackIconButton({
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () =>
          this.onPressed != null ? this.onPressed!() : Navigator.pop(context),
      icon: Icon(
        App.isLtr
            ? Icons.chevron_left : Icons.chevron_right,
      ),
    );
  }
}
