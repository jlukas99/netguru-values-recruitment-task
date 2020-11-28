import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';
import '../controllers/add_value_controller.dart';
import 'custom_fade_button.dart';
import 'dismiss_bar.dart';

class AddOurValueBottomSheet extends StatelessWidget {
  final bool favorite;

  const AddOurValueBottomSheet({Key key, this.favorite = false})
      : super(key: key);

  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.put<AddOurValueController>(AddOurValueController()),
      builder: (controller) => Container(
        decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        ),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(26),
            child: Column(
              children: [
                DismissBar(),
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.format_quote_rounded,
                      color: Clr.icon,
                    ),
                  ),
                ),
                _textField(context, controller),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 24),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.format_quote_rounded,
                      color: Clr.icon,
                    ),
                  ),
                ),
                context.mediaQuery.viewInsets.bottom > 0
                    ? SizedBox()
                    : FadeButton(
                        text: 'add_value'.tr,
                        onTap: () async =>
                            await controller.addValueToDB(favorite),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textField(BuildContext context, AddOurValueController controller) =>
      Expanded(
        child: CupertinoTextField(
          autocorrect: true,
          controller: controller.getValueTextController,
          cursorColor: context.theme.primaryColor,
          keyboardType: TextInputType.text,
          placeholder: 'enter_value'.tr,
          textAlign: TextAlign.center,
          maxLines: 99,
          minLines: 1,
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          style: GoogleFonts.kalam(
            color: context.theme.textTheme.bodyText1.color,
            textStyle: TextStyle(fontSize: 24),
          ),
          placeholderStyle: GoogleFonts.kalam(
            color: Clr.icon,
            textStyle: TextStyle(fontSize: 24),
          ),
        ),
      );
}
