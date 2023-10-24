import 'package:flutter/material.dart';
import 'package:lungs_pneumonia_ai/core/base/components/button/base_button.dart';
import 'package:lungs_pneumonia_ai/core/base/state/base_state.dart';

class BaseDialog {
  static Future show({
    required BuildContext context,
    required String text,
    String? buttonText,
    Function? onTap,
    bool? barrierDismissible,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible ?? true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Utility(context).dynamicWidth(
              Utility(context).isTablet() ? 0.16 : 0,
            ),
          ),
          child: Dialog(
            insetPadding: EdgeInsets.only(
              left: Utility(context).dynamicWidthPixel(23),
              right: Utility(context).dynamicWidthPixel(23),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            child: StatefulBuilder(builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: Utility(context).dynamicWidthPixel(50),
                      left: Utility(context).dynamicWidthPixel(32),
                      right: Utility(context).dynamicWidthPixel(32),
                      bottom: Utility(context).dynamicWidthPixel(30),
                    ),
                    child: Text(
                      text,
                      style: Utility(context).textTheme.bodySmall!.copyWith(
                            fontSize: Utility(context).dynamicTextSize(18),
                          ),
                    ),
                  ),
                  buttonText != null
                      ? Padding(
                          padding: EdgeInsets.only(
                            left: Utility(context).dynamicWidthPixel(28),
                            right: Utility(context).dynamicWidthPixel(28),
                            bottom: Utility(context).dynamicWidthPixel(30),
                          ),
                          child: BaseButton(buttonText: buttonText, onPressed: () => onTap!()),
                        )
                      : const SizedBox(),
                ],
              );
            }),
          ),
        );
      },
    );
  }
}
