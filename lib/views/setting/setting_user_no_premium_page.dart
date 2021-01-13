import 'package:fitwith/utils/common_utils.dart';
import 'package:flutter/material.dart';

/// 회원 프리미엄 미신청 페이지
class SettingUserNoPremiumPage extends StatefulWidget {
  @override
  _SettingUserNoPremiumPageState createState() => _SettingUserNoPremiumPageState();
}

class _SettingUserNoPremiumPageState extends State<SettingUserNoPremiumPage> {
  Size _deviceSize;
  int _menuIndex = 2;

  @override
  Widget build(BuildContext context) {
    _deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: CommonUtils.getPrimaryColor(),
      ),
      backgroundColor: Colors.white,
      title: SizedBox(
        height: 30.0,
        child: Image.asset('assets/logo_text_primary.png'),
      ),
      centerTitle: true,
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
        left: CommonUtils.DEFAULT_PAGE_PADDING,
        top: CommonUtils.DEFAULT_PAGE_PADDING,
        right: CommonUtils.DEFAULT_PAGE_PADDING,
        bottom: CommonUtils.DEFAULT_PAGE_BOTTOM_PADDING,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '트레이너 등록하기',
            style: TextStyle(
              color: CommonUtils.getPrimaryColor(),
            ),
          ),
          SizedBox(height: 5.0),
          _buildUserInfoContainer(),
          SizedBox(height: 10.0),
          _buildMenu(),
          _buildMenuView(),
          SizedBox(height: 80.0),
        ],
      ),
    );
  }

  Container _buildUserInfoContainer() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          border: Border.all(
        color: CommonUtils.getColorByHex('#E8EAEF'),
      )),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                overflow: Overflow.visible,
                children: [
                  Image.asset(
                    'assets/img_empty_profile.png',
                    height: 60.0,
                  ),
                  Positioned(
                    bottom: -3.0,
                    right: -3.0,
                    child: Icon(
                      Icons.add_circle_outlined,
                      color: CommonUtils.getColorByHex('#2E3A59'),
                      size: 30.0,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 30.0),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start                                                                     ,
                      children: [
                        Text('김회원'),
                        Text('남자 · 24세'),
                      ],
                    ),
                    Icon(Icons.settings),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(
                'assets/img_character.png',
              ),
              Expanded(
                child: Column(
                  children: [
                    Text('LV.1'),
                    LinearProgressIndicator(
                      value: 0.6,
                      valueColor: AlwaysStoppedAnimation<Color>(CommonUtils.getColorByHex('#45B7E9')),
                      backgroundColor: CommonUtils.getColorByHex('#E5E5E5'),
                    ),
                    Text('Lv.2까지 한 개의 트레이닝이 남았어요.'),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text('주소'),
              Text('서울시 성동구'),
            ],
          ),
          Row(
            children: [
              Text('휴대폰'),
              Text('010-1234-5678'),
            ],
          ),
          Row(
            children: [
              Text('이메일'),
              Text('besign_member@naver.com'),
            ],
          ),
        ],
      ),
    );
  }

  /// 메뉴 위젯 생성
  Row _buildMenu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildMenuItem(0),
        _buildMenuItem(1),
        _buildMenuItem(2),
        _buildMenuItem(3),
      ],
    );
  }

  /// 메뉴 아이템 위젯 생성
  Widget _buildMenuItem(int index) {
    String text1;
    String text2;
    String image;

    switch (index) {
      case 0:
        text1 = '트레이닝';
        image = 'assets/ic_${_menuIndex == index ? 'select' : 'unselect'}_training.png';
        break;
      case 1:
        text1 = '관심 트레이닝';
        image = 'assets/ic_${_menuIndex == index ? 'select' : 'unselect'}_favorite.png';
        break;
      case 2:
        text1 = '프리미엄';
        image = 'assets/ic_${_menuIndex == index ? 'select' : 'unselect'}_premium.png';
        break;
      case 3:
        text1 = '구매/문의';
        text2 = '내역';
        image = 'assets/ic_${_menuIndex == index ? 'select' : 'unselect'}_history.png';
        break;
    }

    return InkWell(
      onTap: () {
        setState(() {
          _menuIndex = index;
        });
      },
      child: Column(
        children: [
          Image.asset(image),
          Text(
            text1,
            style: TextStyle(
              color: _menuIndex == index ? CommonUtils.getPrimaryColor() : CommonUtils.getColorByHex('#BABABA'),
              fontWeight: FontWeight.w500,
            ),
          ),
          if (text2 != null)
            Text(
              text2,
              style: TextStyle(
                color: _menuIndex == index ? CommonUtils.getPrimaryColor() : CommonUtils.getColorByHex('#BABABA'),
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMenuView() {
    switch (_menuIndex) {
      case 0:
        return _buildPremiumView();
      case 1:
        return _buildPremiumView();
      case 2:
        return _buildPremiumView();
      case 3:
        return _buildPremiumView();
    }

    return Container();
  }

  Widget _buildPremiumView() {
    return Column(
      children: [
        Text('프리미엄 이란?'),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '회원님들과 트레이너 님을 ',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: '1:1로 매칭',
                style: TextStyle(
                  color: CommonUtils.getPrimaryColor(),
                ),
              ),
              TextSpan(
                text: '시켜주는 서비스 입니다. 회원님들께서 원하는 지역의 트레이너를 매칭시켜 개인 관리를 용이하게 합니다.',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '앱에서는 개인 PT를 용이하게 하기 위한 서비스를 제공합니다. ',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: '운동부터 식단까지 ',
                style: TextStyle(
                  color: CommonUtils.getPrimaryColor(),
                ),
              ),
              TextSpan(
                text: '회원님의 상태를 한눈에 볼 수 있습니다.',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '트레이너님이 회원님과의 미팅 혹은 정보에 따라 운동과 식단 계획을 ',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: '회원님의 맞춤형 ',
                style: TextStyle(
                  color: CommonUtils.getPrimaryColor(),
                ),
              ),
              TextSpan(
                text: '으로 잡아 줄 수 있습니다.',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Text('프리미엄 미리보기'),
        SizedBox(
          width: _deviceSize.width,
          child: RaisedButton(
            padding: const EdgeInsets.all(20.0),
            onPressed: () {},
            child: Text('맞춤 트레이너 보러가기'),
            textColor: Colors.white,
            color: CommonUtils.getPrimaryColor(),
          ),
        ),
      ],
    );
  }
}
