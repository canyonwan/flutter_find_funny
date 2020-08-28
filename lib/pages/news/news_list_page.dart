import 'package:flutter/material.dart';
import 'package:flutter_find_funny/utils/utils.dart';

@FFRoute(name: 'funny://news-list-page', routeName: '新闻页')
class NewsListPage extends StatefulWidget {
  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
