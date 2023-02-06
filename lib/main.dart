import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_dashboard_ui/dashboard.dart';
import 'package:responsive_dashboard_ui/style/colors.dart';
import 'package:window_size/window_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getWindowInfo().then((window) {
    final screen = window.screen;
    if (screen != null) {
      final screenFrame = screen.visibleFrame;
      final width = max((screenFrame.width / 2).roundToDouble(), 800.0);
      final height = max((screenFrame.height / 2).roundToDouble(), 600.0);
      final left =
          screenFrame.left + ((screenFrame.width - width) / 2).roundToDouble();
      final top =
          screenFrame.top + ((screenFrame.height - height) / 3).roundToDouble();
      final frame = Rect.fromLTWH(left, top, width, height);
      // setWindowFrame(frame);
      setWindowMinSize(Size(0.8 * width, 0.8 * height));
      // setWindowMaxSize(Size(1.5 * width, 1.5 * height));
      setWindowTitle('window_size Example on ${Platform.operatingSystem}');
    }
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: AppColors.primaryBg,
      ),
      home: const Dashboard(),
    );
  }
}
