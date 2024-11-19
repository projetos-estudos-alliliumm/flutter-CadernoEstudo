import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatelessWidget {
  SplashPage() {
    startTimeout();
  }
  startTimeout() async {
    return Timer(Duration(seconds: 6), changeScreen);
  }

  changeScreen() async {
    Get.toNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }
}
