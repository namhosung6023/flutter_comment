import 'package:fitwith/utils/common_utils.dart';
import 'package:fitwith/views/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

/// 신규 회원 스와이프 설명 페이지
class NewMemberSwipePage extends StatefulWidget {
  @override
  _NewMemberSwipePageState createState() => _NewMemberSwipePageState();
}

class _NewMemberSwipePageState extends State<NewMemberSwipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {

            if (index == 0) return _NewMemberFirstPage();

            return Image.asset('assets/bg_new_member_swipe_$index.png', fit: BoxFit.fill);
          },
          itemCount: 4,
          pagination: SwiperPagination(
            builder: new DotSwiperPaginationBuilder(color: CommonUtils.getAdditionalColor()),
          ),
          loop: false,
          onTap: (int index) {
            /// fixme :: 마지막 스와이프 페이지에서 클릭시 로그인 페이지로 가게 임시로 적용
            if (index == 3) CommonUtils.movePage(context, LoginPage());
          },
        ),
      ),
    );
  }
}

/// 신규 회원 스와이프 설명 첫번째 페이지
class _NewMemberFirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: Column(
        children: [
          Text(
            '환영합니다!',
            style: TextStyle(
              color: CommonUtils.getPrimaryColor(),
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            '언제나 함께하는',
            style: TextStyle(
              color: CommonUtils.getSecondaryColor().withOpacity(0.7),
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            '내 손안의 맞춤 트레이너',
            style: TextStyle(
              color: CommonUtils.getSecondaryColor().withOpacity(0.7),
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 30.0),
          Image.asset('assets/logo_text_primary.png'),
          SizedBox(height: 150.0),
          Text('<폭죽 일러스트/모션>'),
        ],
      ),
    );
  }
}
