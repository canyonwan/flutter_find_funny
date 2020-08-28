import 'package:flutter/material.dart';
import 'package:flutter_find_funny/utils/utils.dart';

@FFRoute(name: 'funny://video-list-page', routeName: '搞笑视频页')
class VideoListPage extends StatefulWidget {
  @override
  _VideoListPageState createState() => _VideoListPageState();
}

class _VideoListPageState extends State<VideoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
