import 'package:flutter/material.dart';
import 'package:flutter_find_funny/utils/utils.dart';

@FFRoute(name: 'funny://movie-list-page', routeName: '影视页')
class MovieListPage extends StatefulWidget {
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
