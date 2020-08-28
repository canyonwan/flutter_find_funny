import 'package:flutter_find_funny/const/colors.dart';
import 'package:flutter_find_funny/utils/utils.dart';

void get instance {
  EasyLoading.instance.maskType = EasyLoadingMaskType.custom;
  EasyLoading.instance.maskColor = kBlackC.withOpacity(.4);
  EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.rotatingPlain;
}

void showLoading({String msg}) {
  instance;
  EasyLoading.show(status: msg ?? '加载中..');
}

void showErrorToast({String msg}) {
  EasyLoading.showError(msg ?? '发生错误,请稍候重试 〒_〒');
}

void showSuccessToast({String msg}) {
  EasyLoading.showSuccess(msg ?? '操作成功 ^_^');
}

void showInfoToast(String infoMsg) {
  EasyLoading.showInfo(infoMsg);
}

void showToast(String toastMsg) {
  EasyLoading.showToast(toastMsg);
}

void showLoadingProgress(double value) {
  instance;
  EasyLoading.showProgress(value, status: '请稍候..');
}

void dismissLoading() {
  EasyLoading.dismiss();
}
