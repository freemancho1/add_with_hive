import 'dart:io';
import 'package:add_with_hive/settings/hive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:window_size/window_size.dart';

import 'constants.dart';

final Logger appLog = Logger(AppConst.appName);

void setupWindow() {
  /// 웹을 제외한 데스크톱 운영체제일 경우 수행하는 것으로
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    /// Flutter는 데스크톱 앱을 빌드하기 위한 Flutter Desktop Embedding을 사용하는데,
    /// 아직 실험적인 단계이며, 안정성이 보장되지 않아 강제로 초기화를 시켜줌
    WidgetsFlutterBinding.ensureInitialized();

    setWindowTitle('Provider Demo');
    setWindowMinSize(AppConst.windowSize);
    setWindowMaxSize(AppConst.windowSize);
    getCurrentScreen().then((screen) {
      setWindowFrame(Rect.fromCenter(
        center: screen!.frame.center,
        width: AppConst.windowSize.width,
        height: AppConst.windowSize.height,
      ));
    });
  }
}

void loggerInit() {
  Logger.root.level =
    kReleaseMode ? AppConst.releaseLogLevel : AppConst.debugLogLevel;
  Logger.root.onRecord.listen((record) {
    debugPrint(
      /// 아래 두개는 LogCat에서 중복되기 때문에 주석 처
      // '${record.level.name}: '
      // '${record.time}: '
      '${record.loggerName}: '
      '${record.message}'
    );
  });
}

Future<void> appInit() async {
  loggerInit();
  setupWindow();
  await hiveInit();
}