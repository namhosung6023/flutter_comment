import 'package:fitwith/main.dart';
import 'package:fitwith/utils/common_utils.dart';
import 'package:fitwith/views/main/main_page.dart';
import 'package:fitwith/views/premium/page_premium_member.dart';
import 'package:fitwith/views/premium/page_premium_trainer.dart';
import 'package:fitwith/views/setting/setting_main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '프리미엄 관리',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '게시판',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '트레이닝',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '쇼핑',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '마이페이지',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        final userType = 'MEMBER'; // FIXME : DEBUG 용, 삭제바람.
        // final userType = 'TRAINER'; // FIXME : DEBUG 용, 삭제바람.
        if (index == 0)
          return CupertinoTabView(
            navigatorKey: tabNavKey1,
            builder: (BuildContext context) => (userType == 'MEMBER') ? PremiumMemberPage() : PremiumTrainerPage(),
          );
        else if (index == 1)
          return CupertinoTabView(
            navigatorKey: tabNavKey2,
            builder: (BuildContext context) => MainPage(),
          );
        else if (index == 2)
          return CupertinoTabView(
            navigatorKey: tabNavKey3,
            builder: (BuildContext context) => MainPage(),
          );
        else if (index == 3)
          return CupertinoTabView(
            navigatorKey: tabNavKey4,
            builder: (BuildContext context) => MainPage(),
          );
        else
          return CupertinoTabView(
            navigatorKey: tabNavKey5,
            builder: (BuildContext context) => SettingMainPage(),
          );
      },
    );
  }
}
