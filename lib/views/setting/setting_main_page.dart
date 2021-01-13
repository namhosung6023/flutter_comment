import 'package:fitwith/utils/common_utils.dart';
import 'package:fitwith/views/setting/setting_trainer_info_page.dart';
import 'package:fitwith/views/setting/setting_user_info_page.dart';
import 'package:fitwith/views/setting/setting_user_no_premium_page.dart';
import 'package:flutter/material.dart';

/// 임시용 세팅 메인 페이지
/// fixme :: 차후에 연결해야됨.
class SettingMainPage extends StatefulWidget {
  @override
  _SettingMainPageState createState() => _SettingMainPageState();
}

class _SettingMainPageState extends State<SettingMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: Text('회원정보 수정_회원'),
            onTap: () => CommonUtils.movePage(context, SettingUserInfoPage()),
          ),
          ListTile(
            title: Text('마이페이지_회원_프리미엄미신청 - 진행중'),
            onTap: () => CommonUtils.movePage(context, SettingUserNoPremiumPage()),
          ),
          ListTile(
            title: Text('회원정보 수정_트레이너 - 진행중'),
            onTap: () => CommonUtils.movePage(context, SettingTrainerInfoPage()),
          ),
        ],
      ),
    );
  }
}
