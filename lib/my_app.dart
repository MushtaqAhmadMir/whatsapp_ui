import 'package:flutter/material.dart';
import 'package:whatsapp_ui/presentation/manager/color_manager.dart';
import 'package:whatsapp_ui/presentation/responsive/responsive_layout.dart';
import 'package:whatsapp_ui/presentation/views/mobile_layout_screen.dart';
import 'package:whatsapp_ui/presentation/views/web_layout_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whatsapp UI',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: const ResponsiveLayout(
        mobileScreenLayout: MobileLayoutScreen(),
        webScreenLayout: WebLayoutScreen(),
      ),
    );
  }
}
