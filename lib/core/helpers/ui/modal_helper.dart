import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ModalHelper {
  ModalHelper._();

  static Future<T?> showCustomModal<T>({
    required BuildContext context,
    required Widget child,
    bool isDismissible = false,
    bool enableDrag = false,
  }) {
    return showMaterialModalBottomSheet(
      context: context,
      duration: const Duration(milliseconds: 200),
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      builder: (context) {
        return child;
      },
    );
  }
}
