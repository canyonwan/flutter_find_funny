import 'package:flutter/material.dart';
import 'package:flutter_find_funny/utils/utils.dart';

@FFRoute(name: 'online://noroute-page', routeName: '无路由页')
class NoRoutePage extends StatelessWidget {
  const NoRoutePage({
    @required this.route,
  });
  final String route;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text.rich(
            TextSpan(
              children: <InlineSpan>[
                const TextSpan(text: 'You\'re visiting\n'),
                TextSpan(
                    text: '$route\n',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const TextSpan(text: 'which result nothing...'),
              ],
              style: TextStyle(fontSize: 26),
            ),
          ),
          const BackButton(),
        ],
      ),
    );
  }
}
