import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class ViewUtils {
  static ProgressDialog? pr;

  static void showProgressDialog(context) {
    if (pr == null) pr = new ProgressDialog(context: context);
    pr?.show(
      max: 100,
      msg: 'File Downloading...',
      progressBgColor: Colors.transparent,
    );
  }

  static void dismissProgressDialog() {
    if (pr != null) pr?.close();
  }
}
