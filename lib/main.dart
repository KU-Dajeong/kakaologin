import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  KakaoSdk.init(
    nativeAppKey: 'b0c5a41eed93ba3386e6eae72d4ce23a',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: kakaoLogin,
            child: Text('로그인'),
          ),
        ),
      ),
    );
  }

  kakaoLogin() async {
    try {
      OAuthToken token = await isKakaoTalkInstalled()
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();
      print('Access Token : ${token.accessToken}');
      print('Refresh Token : ${token.refreshToken}');
    } catch (e) {
      print(e);
    }
  }
}
