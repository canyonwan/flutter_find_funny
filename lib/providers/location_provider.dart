import 'package:flutter/material.dart';
import 'package:flutter_find_funny/utils/utils.dart';

class LocationProvider extends ChangeNotifier {
  Location location;
  Future<bool> requestLocationPermission() async {
    final permissionStatus = await Permission.location.request();
    if (permissionStatus == PermissionStatus.granted) {
      return true;
    } else {
      showToast('你拒绝了打开定位权限,无法获取到准确的位置');
      return false;
    }
  }

  // 获取单次定位
  Future<void> startUpLocation() async {
    if (await requestLocationPermission()) {
      final result = await AmapLocation.instance.fetchLocation();
      location = result;
      notifyListeners();
    }
  }
}
