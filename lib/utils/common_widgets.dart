import 'package:fitwith/utils/common_utils.dart';
import 'package:flutter/material.dart';

/// Common widget set.
class CommonWidgets {
  /// Build default app bar.
  static Widget buildAppBar({Widget leading, Widget trailing}) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: (leading != null) ? leading : Container(),
      actions: [
        if (trailing != null) trailing,
      ],
      title: Image.asset('assets/logo_text_primary.png', height: 24.0),
    );
  }

  /// Build notification icon.
  static Widget buildNotificationIcon({bool isNew = false, double size = 20.0}) {
    // badge widget.
    final badge = Container(
      width: 8.0,
      height: 8.0,
      decoration: BoxDecoration(
        color: Colors.red,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(32.0),
      ),
    );
    return Stack(
      children: [
        Icon(Icons.notifications, size: size, color: CommonUtils.getPrimaryColor()),
        if (isNew) Positioned(top: 0.0, left: 12.0, child: badge),
      ],
    );
  }

  /// build default style button.
  static Widget buildDefaultButton(String text, Function onPressed) {
    return RaisedButton(
      onPressed: onPressed,
      padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      color: CommonUtils.getPrimaryColor(),
    );
  }
}
