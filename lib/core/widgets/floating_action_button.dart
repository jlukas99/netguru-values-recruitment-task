import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final Function onTap;

  CustomFloatingActionButton(this.onTap);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 82,
      height: 82,
      child: FloatingActionButton(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(82),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Get.theme.primaryColor,
                Get.theme.accentColor,
              ],
            ),
          ),
          width: Get.width,
          height: Get.height,
          child: Icon(
            Icons.add_rounded,
            color: Colors.white,
            size: 48,
          ),
        ),
        onPressed: onTap,
      ),
    );
  }
}
