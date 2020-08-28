import 'package:flutter/material.dart';
import 'package:flutter_find_funny/utils/utils.dart';

class DialogUtil {
  static void showCommonAlert(BuildContext context, String content,
      {String title = '', FlatButton confirmButton}) {
    showDialog(
      barrierDismissible: false, // 设置点击 dialog 外部不取消 dialog，默认能够取消
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        titleTextStyle: TextStyle(color: Colors.black),
        content: Text(content),
        contentTextStyle: TextStyle(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 8.0, // 投影的阴影高度
        semanticLabel: 'Label', // 这个用于无障碍下弹出 dialog 的提示
        shape: Border.all(),
        actions: <Widget>[
          confirmButton != null
              ? confirmButton
              : FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("确定"),
                ),
        ],
      ),
    );
  }

  /// `showGeneraDialog`
  /// 一种带动画的Alert Dialog
  static void showScaleDialog(
    BuildContext context, {
    @required Widget child,
    bool barrierDismissible = false,
  }) {
    showGeneralDialog(
      context: context,
      barrierLabel: '',
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.black.withOpacity(.5),
      transitionDuration: Duration(milliseconds: 250),
      transitionBuilder: (context, animation, _, widget) {
        return Transform.scale(scale: animation.value, child: widget);
      },
      pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) {
        return Center(
          child: Material(
            child: child,
            borderRadius: BorderRadius.circular(14.w),
          ),
        );
      },
    );
  }

  /// 可以实现 从上 从下 从左 从右 进入的dialog
  static void showOffsetDialog(
    BuildContext context, {
    @required Widget child,
    bool barrierDismissible = false,
  }) {
    showGeneralDialog(
      context: context,
      barrierLabel: '',
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(.5),
      transitionDuration: Duration(milliseconds: 250),
      transitionBuilder: (context, animation, _, widget) {
        return FractionalTranslation(
          translation: Offset(0, animation.value - 1.4),
          child: widget,
        );
      },
      pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) {
        return Center(
          child: Material(
            child: child,
            borderRadius: BorderRadius.circular(14.w),
          ),
        );
      },
    );
  }
}
