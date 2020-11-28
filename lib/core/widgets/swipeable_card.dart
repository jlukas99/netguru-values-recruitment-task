import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netguru_values/core/controllers/values_controller.dart';
import 'package:netguru_values/core/models/value.dart';
import 'package:netguru_values/utils/colors.dart';

class SwipeableCard extends StatelessWidget {
  final ValueModel value;
  final int index;
  final Function(int type) callback;

  const SwipeableCard({
    Key key,
    this.value,
    this.index,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 6,
      child: ClipRRect(
        child: Dismissible(
          key: Key(value.text),
          confirmDismiss: (d) async {
            if (d == DismissDirection.endToStart) {
              return callback(0);
            } else if (d == DismissDirection.startToEnd) {
              await Get.find<ValuesController>().setFavoriteForValue(value);
              return callback(1);
            }

            return null;
          },
          onDismissed: (d) async {
            if (d == DismissDirection.endToStart) {
              await Get.find<ValuesController>().removeValue(value);
              return callback(2);
            } else if (d == DismissDirection.startToEnd) {
              return callback(3);
            }
          },
          background: Container(
            constraints: BoxConstraints(
              minHeight: 64,
            ),
            decoration: BoxDecoration(
              color: value.isFavorite ? Clr.icon : Get.theme.primaryColor,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Icon(
                  value.isFavorite
                      ? Icons.favorite_outline_rounded
                      : Icons.favorite_rounded,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  value.isFavorite
                      ? 'remove_favorite'.tr
                      : 'add_favorite'.tr,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          secondaryBackground: Container(
            constraints: BoxConstraints(
              minHeight: 64,
            ),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: EdgeInsets.all(16),
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.delete_forever_rounded,
              color: Colors.white,
            ),
          ),
          child: Container(
            constraints: BoxConstraints(
              minHeight: 64,
            ),
            padding: EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Text(
              "“${value.text}“",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
