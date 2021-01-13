import 'package:fitwith/utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// 회원 정보 수정 페이지
class SettingUserInfoPage extends StatefulWidget {
  @override
  _SettingUserInfoPageState createState() => _SettingUserInfoPageState();
}

class _SettingUserInfoPageState extends State<SettingUserInfoPage> {
  String _mode;
  String _modeEdit = 'EDIT'; // 편집모드
  String _modeView = 'VIEW'; // 뷰 모드

  @override
  void initState() {
    _mode = _modeView;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      padding: const EdgeInsets.only(bottom: CommonUtils.DEFAULT_PAGE_BOTTOM_PADDING),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(CommonUtils.DEFAULT_PAGE_PADDING),
            child: Column(
              children: [
                _buildMainTitle(),
                SizedBox(height: 10.0),
                _buildUserInfo(),
                SizedBox(height: 10.0),
                _buildUserBodyInfo(),
              ],
            ),
          ),
          SizedBox(height: 30.0),
          _buildSwitch('건강 정보 열람', '트레이너님이 회원님의 건강정보를 열람할 수 있게 합니다.', true, (bool value) {}, isFirst: true),
          _buildSwitch('개인정보 열람', '트레이너님이 회원님의 전화번호 및 이메일을 열람할 수 있게 합니다.', false, (bool value) {}),
          SizedBox(height: 30.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '해당 정보의 열람 설정은 트레이너님이 회원님의 건강정보에 따른 맞춤 운동/식단을 제시해 주기 위한것입니다. 이외의 용도로는 절대 사용되지 않습니다.',
                  style: TextStyle(
                    color: CommonUtils.getColorByHex('#FF9B70'),
                    fontSize: 12.0,
                  ),
                ),
                SizedBox(height: 30.0),
                InkWell(
                  onTap: () {
                    /// fixme :: 회원 탈퇴 기능 추가
                  },
                  child: Text(
                    '회원 탈퇴',
                    style: TextStyle(
                      color: CommonUtils.getColorByHex('#FF9B70'),
                      fontSize: 12.0,
                    ),
                  ),
                ),
                SizedBox(height: 50.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 메인 타이틀 위젯 생성
  Row _buildMainTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '회원 정보 수정',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        InkWell(
          onTap: () {
            // fixme :: 편집 및 확인 기능 추가
            setState(() {
              if (_mode == _modeView) {
                _mode = _modeEdit;
              } else {
                _mode = _modeView;
              }
            });
          },
          child: Text(
            _mode == _modeView ? '편집' : '확인',
            style: TextStyle(
              color: _mode == _modeView ? CommonUtils.getColorByHex('#FF2F2F') : CommonUtils.getPrimaryColor(),
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    );
  }

  /// 유저 정보 위젯 생성
  Widget _buildUserInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Stack(
            overflow: Overflow.visible,
            children: [
              Image.asset('assets/img_empty_profile.png'),
              Positioned(
                bottom: -10.0,
                right: -10.0,
                child: Icon(
                  Icons.add_circle_outlined,
                  color: CommonUtils.getColorByHex('#2E3A59'),
                  size: 60.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          SizedBox(
            width: 200.0,
            child: TextFormField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.edit),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          _buildUserInfoRow('성명', '김회원', isBoldText: true),
          SizedBox(height: 10.0),
          _buildUserInfoRow('성별', '남자', isBoldText: true),
          SizedBox(height: 10.0),
          _buildUserInfoRow('주소', '서울시 성동구 하왕십리동'),
          SizedBox(height: 10.0),
          _buildUserInfoRow('전화번호', '010-1234-5678'),
          SizedBox(height: 10.0),
          _buildUserInfoRow('이메일', 'test@naver.com'),
        ],
      ),
    );
  }

  /// 유저 정보 행 위젯 생성
  Row _buildUserInfoRow(String title, String text, {bool isBoldText = false}) {
    return Row(
      children: [
        SizedBox(
          width: 80.0,
          child: Text(
            title,
            style: TextStyle(
              color: CommonUtils.getPrimaryColor(),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        _mode == _modeView
            ? Text(
                text,
                style: TextStyle(fontWeight: isBoldText ? FontWeight.w700 : FontWeight.w400),
              )
            : SizedBox(
                width: 150.0,
                height: 30.0,
                child: TextFormField(
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 12.0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: CommonUtils.getColorByHex('#C2C9D1')),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: CommonUtils.getColorByHex('#C2C9D1')),
                    ),
                  ),
                ),
              ),
      ],
    );
  }

  /// 유저 몸 정보 위젯 생성
  Widget _buildUserBodyInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildUserBodyInfoRow('키 :', '176.8', 'cm'),
        _buildUserBodyInfoRow('체중 :', '80', 'kg'),
        _buildUserBodyInfoRow('BMI :', '22.34', 'kg/m^2'),
        SizedBox(height: 20.0),
        _buildUserConstitution('소양인'),
        Row(
          children: [
            _buildUserBodyInfoTitle('좋은 음식'),
            SizedBox(width: 10.0),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Image.asset('assets/ic_eggs.png'),
                    Image.asset('assets/ic_eggs.png'),
                    Image.asset('assets/ic_eggs.png'),
                    Image.asset('assets/ic_eggs.png'),
                    Image.asset('assets/ic_eggs.png'),
                    Image.asset('assets/ic_eggs.png'),
                    Image.asset('assets/ic_eggs.png'),
                    Image.asset('assets/ic_eggs.png'),
                    Image.asset('assets/ic_eggs.png'),
                    Image.asset('assets/ic_eggs.png'),
                    Image.asset('assets/ic_eggs.png'),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.0),
        _buildUserBodyInfoTitle('추천 트레이닝'),
        SizedBox(height: 10.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildPill('복부'),
              SizedBox(width: 5.0),
              _buildPill('PT'),
              SizedBox(width: 5.0),
              _buildPill('필라테스'),
              SizedBox(width: 5.0),
              _buildPill('필라테스'),
              SizedBox(width: 5.0),
              _buildPill('필라테스'),
              SizedBox(width: 5.0),
              _buildPill('필라테스'),
              SizedBox(width: 5.0),
              _buildPill('필라테스'),
              SizedBox(width: 5.0),
              _buildPill('필라테스'),
            ],
          ),
        ),
      ],
    );
  }

  /// 유저 몸 정보 제목 위젯 생성
  Text _buildUserBodyInfoTitle(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black.withOpacity(0.5),
        fontWeight: FontWeight.w500,
      ),
    );
  }

  /// 유저 몸 정보 행 위젯 생성
  Widget _buildUserBodyInfoRow(String title, String text, String format) {
    return Container(
      child: Row(
        mainAxisAlignment: _mode == _modeView ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
        children: [
          _buildUserBodyInfoTitle(title),
          SizedBox(width: 5.0),
          _mode == _modeView
              ? Text(
                  '$text$format',
                  style: TextStyle(color: Colors.black.withOpacity(0.5)),
                )
              : SizedBox(
                  width: 150.0,
                  height: 30.0,
                  child: TextFormField(
                    initialValue: text,
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 12.0),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: CommonUtils.getColorByHex('#C2C9D1')),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(color: CommonUtils.getColorByHex('#C2C9D1')),
                      ),
                    ),
                  ),
                ),
        ],
      ),
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black.withOpacity(0.12),
          ),
        ),
      ),
    );
  }

  /// 유저 몸 정보 체질 위젯 생성
  Widget _buildUserConstitution(String constitution) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildUserBodyInfoTitle('체질 :'),
            InkWell(
              onTap: () {
                /// fixme :: 테스트 다시하기 기능 추가
              },
              child: Text(
                '테스트 다시하기',
                style: TextStyle(
                  color: CommonUtils.getPrimaryColor(),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.0),
        Image.asset('assets/img_constitution.png'),
        SizedBox(height: 20.0),
        Text(
          constitution,
          style: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  /// 알약 위젯 생성
  Container _buildPill(String text) {
    return Container(
      child: Text(text),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
      decoration: BoxDecoration(
        color: CommonUtils.getAdditionalColor(),
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }

  /// 스위치 위젯 생성
  Container _buildSwitch(String title, String text, bool value, Function onChanged, {bool isFirst = false}) {
    Border border = Border(
      bottom: BorderSide(
        color: Colors.black.withOpacity(0.12),
      ),
    );

    if (isFirst) {
      border = Border(
        top: BorderSide(
          color: Colors.black.withOpacity(0.12),
        ),
        bottom: BorderSide(
          color: Colors.black.withOpacity(0.12),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(20.0, 3.0, 20.0, 15.0),
      decoration: BoxDecoration(
        border: border,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              Switch(
                value: value,
                onChanged: onChanged,
                activeColor: CommonUtils.getPrimaryColor(),
                inactiveThumbColor: CommonUtils.getColorByHex('#707070'),
              ),
            ],
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.black.withOpacity(0.6),
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
