import 'package:fitwith/utils/common_utils.dart';
import 'package:fitwith/views/login/email_login_page.dart';
import 'package:fitwith/views/main/main_page.dart';
import 'package:fitwith/views/root_page.dart';
import 'package:flutter/material.dart';

/// 로그인 페이지
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonUtils.getPrimaryColor(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: Column(
          children: [
            Image.asset('assets/logo.png'),
            SizedBox(height: 10.0),
            Image.asset('assets/logo_text_white.png'),
            SizedBox(height: 80.0),
            Text(
              '시작하기',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 22.0,
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialLoginButton('google', () => _socialLogin('google')),
                SizedBox(width: 15.0),
                _buildSocialLoginButton('naver', () => _socialLogin('naver')),
                SizedBox(width: 15.0),
                _buildSocialLoginButton('email', () => CommonUtils.movePage(context, EmailLoginPage())),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 소셜로그인 버튼 위젯 생성
  Widget _buildSocialLoginButton(String type, Function onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Image.asset('assets/ic_${type}.png'),
      ),
    );
  }

  /// 소셜 로그인
  /// fixme :: 소셜 로그인 처리
  void _socialLogin(String type) {
    CommonUtils.movePage(context, RootPage());
  }
}
