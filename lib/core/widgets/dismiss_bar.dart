import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class DismissBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 128,
      height: 6,
      decoration: BoxDecoration(
        color: Clr.icon,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
