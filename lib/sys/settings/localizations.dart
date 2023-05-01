import 'dart:ui';
import 'package:flutter_localizations/flutter_localizations.dart';

final localizationsDelegates = [
  // 앱의 로컬라이제이션을 구성합니다.
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate,
];

final supportedLocales = [
  // 앱에서 지원하는 언어 목록을 설정합니다.
  const Locale('ko', 'KR'), // 한국어
  const Locale('en', 'US'), // 영어
];