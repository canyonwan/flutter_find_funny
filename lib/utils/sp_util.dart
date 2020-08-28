import 'package:flutter_find_funny/utils/utils.dart';

class SpUtil {
  // 初始化
  static SharedPreferences sp;
  static Future initSp() async => sp = await SharedPreferences.getInstance();
}
