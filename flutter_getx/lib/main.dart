import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:flutter_getx/models/recurso.dart';
import 'package:flutter_getx/models/categoria.dart';
import 'package:flutter_getx/modules/home/splash_page.dart';
import 'package:flutter_getx/repositories/recurso_api.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    defaultTransition: Transition.native,
    locale: Locale('pt', 'BR'),
    getPages: [
      GetPage(
        name: "/",
        page: () => SplashPage(),
      ),
      GetPage(name: "/", page: () => HomePage()),
      GetPage(name: "/", page: () => CategoriaPage(), binding: CategoriaBind()),
    ],
  ));
}
