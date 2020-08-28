import 'package:flutter/material.dart';
import 'package:flutter_find_funny/utils/utils.dart';

@FFRoute(name: 'funny://find-list-page', routeName: '发现页')
class FindListPage extends StatefulWidget {
  @override
  _FindListPageState createState() => _FindListPageState();
}

class _FindListPageState extends State<FindListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发现精彩'),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
