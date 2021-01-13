import 'package:flutter/material.dart';
import 'package:fitwith/utils/common_utils.dart';

/// 메인 페이지
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Size _deviceSize; // 기기 사이즈

  @override
  Widget build(BuildContext context) {
    _deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  /// 앱바
  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.notifications,
          color: CommonUtils.getPrimaryColor(),
          size: 30.0,
        ),
      ),
      title: Image.asset(
        'assets/logo_text_primary.png',
        height: 24.0,
      ),
    );
  }

  /// 바디
  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20.0),
          _buildTopButtonWidget(),
          // 상단 버튼 리스트
          _buildItemListWidget('내 수강 목록', [], '현재 수강중인 강의가 없습니다', '강의 보러가기'),
          // 내 수강 목록
          _buildItemListWidget('내 프리미엄 개인관리', [], '현재 진행중인 관리가 없습니다', '프리미엄관리 보러가기',
              suffixIcon: Icon(
                Icons.star,
                size: 22.0,
                color: Color(0xffff9b70),
              )),
          // 내 프리미엄 개인관리
          SizedBox(height: 20.0),
          GestureDetector(
            onTap: () {
              /// fixme :: 트레이너 등록하기 버튼 구현필요
              print('트레이너 등록하기 버튼');
            },
            child: Container(
              padding: const EdgeInsets.only(left: 40.0),
              child: Text(
                '트레이너 등록하기',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w700,
                  color: CommonUtils.getPrimaryColor(),
                ),
              ),
            ),
          ),
          // 트레이너 등록하기
          SizedBox(height: 40.0),
        ],
      ),
    );
  }

  /// 상단 버튼 리스트 위젯
  Widget _buildTopButtonWidget() {
    /// fixme :: 리스트 데이터 수정필요
    List<String> _buttonList = ['HOT', '다이어트', '복부', 'PT', '필라테스', 'HOT', '다이어트', '복부', '필라테스'];

    return Container(
      height: 26.0,
      child: ListView(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        children: [
          ..._buttonList.map((e) => _buildTopButton(e, selected: false)),
        ],
      ),
    );
  }

  /// 상단 버튼 위젯
  Widget _buildTopButton(String text, {bool selected = false}) {
    return GestureDetector(
      onTap: () {
        /// fixme :: 버튼 동작구현 필요
        print('버튼');
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(12.0, 3.0, 12.0, 3.0),
        margin: const EdgeInsets.only(left: 3.0, right: 3.0),
        decoration: BoxDecoration(
          color: selected ? Colors.white : CommonUtils.getAdditionalColor(),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14.0,
              color: selected ? CommonUtils.getPrimaryColor() : CommonUtils.getSecondaryColor(),
            ),
          ),
        ),
      ),
    );
  }

  /// 메인 목록 위젯
  Widget _buildItemListWidget(String title, List<String> data, String noneText, String findText, {Icon suffixIcon}) {
    return Container(
      padding: const EdgeInsets.only(left: 30.0, top: 40.0, right: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: CommonUtils.getSecondaryColor(),
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              suffixIcon ?? SizedBox(),
            ],
          ),
          SizedBox(height: 20.0),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: CommonUtils.getAdditionalColor()),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: (data.length != 0)
                ? ListView(
              shrinkWrap: true,
              children: [],
            ) // 데이터 리스트가 존재할 경우
                : Column(
              children: [
                SizedBox(height: 20.0),
                Center(
                  child: Text(
                    noneText,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
                Image.asset(
                  'assets/img_empty.png',
                  height: 100.0,
                ),
                GestureDetector(
                  onTap: () {
                    /// fixme :: 보러가기 버튼 구현 필요
                    print('보러가기 버튼');
                  },
                  child: Center(
                    child: Text(
                      findText,
                      style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold,
                        color: CommonUtils.getPrimaryColor(),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ), // 데이터 리스트가 없을 경우
          ),
        ],
      ),
    );
  }
}