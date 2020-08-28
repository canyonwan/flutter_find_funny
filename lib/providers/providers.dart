import 'package:flutter/material.dart';
import 'package:flutter_find_funny/providers/location_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

ChangeNotifierProvider<T> buildProvider<T extends ChangeNotifier>(T value) {
  return ChangeNotifierProvider<T>.value(value: value);
}

List<SingleChildWidget> get providers => _providers;

final _providers = [
  buildProvider<LocationProvider>(LocationProvider()),
  // buildProvider<BottomNavigationBarProvider>(BottomNavigationBarProvider()),
];
