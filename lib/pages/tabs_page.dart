import 'package:flutter/material.dart';
import 'package:flutter_find_funny/const/colors.dart';
import 'package:flutter_find_funny/const/resource.dart';
import 'package:flutter_find_funny/pages/find/find_list_page.dart';
import 'package:flutter_find_funny/pages/movies/movie_list_page.dart';
import 'package:flutter_find_funny/pages/news/news_list_page.dart';
import 'package:flutter_find_funny/pages/videos/video_list_page.dart';
import 'package:flutter_find_funny/utils/utils.dart';

@FFRoute(name: 'funny://tabs-page', routeName: '底部导航页')
class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  PageController _pageController;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController?.dispose();
  }

  final List<Widget> pages = [
    FindListPage(),
    MovieListPage(),
    VideoListPage(),
    NewsListPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (int tapIndex) {
          _pageController.jumpToPage(tapIndex);
        },
        items: <BottomNavigationBarItem>[
          _item(R.ASSETS_IMAGES_FIND_NO_PNG, R.ASSETS_IMAGES_FIND_PNG, '发现'),
          _item(R.ASSETS_IMAGES_MOVIE_NO_PNG, R.ASSETS_IMAGES_MOVIE_PNG, '好看'),
          _item(R.ASSETS_IMAGES_VIDEO_NO_PNG, R.ASSETS_IMAGES_VIDEO_PNG, '视频'),
          _item(R.ASSETS_IMAGES_NEWS_NO_PNG, R.ASSETS_IMAGES_NEWS_PNG, '资讯'),
        ],
      ),
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        itemCount: pages.length,
        itemBuilder: (_, int index) => pages[index],
        onPageChanged: (int tapIndex) {
          currentIndex = tapIndex;
          setState(() {});
        },
      ),
    );
  }

  BottomNavigationBarItem _item(String icon, String activeIcon, String title) {
    return BottomNavigationBarItem(
      icon: Image.asset(icon, width: 68.w),
      activeIcon: Image.asset(activeIcon, width: 68.w),
      title: Text(title, style: TextStyle(color: kAppC)),
    );
  }
}
