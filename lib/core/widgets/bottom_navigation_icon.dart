import 'package:flutter/cupertino.dart';
import 'package:netguru_values/utils/colors.dart';

class BottomNavigationIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onTap;

  BottomNavigationIcon({
    @required this.text,
    @required this.icon,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(3),
            child: Icon(
              icon,
              color: Clr.icon,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: Clr.icon,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ],
      ),
      onPressed: onTap,
    );
  }
}
