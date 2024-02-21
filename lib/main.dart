import 'dart:io';

import 'package:flutter/material.dart';
import 'package:matrimony_app/view/screens/home_page.dart';
import 'package:provider/provider.dart';

import 'view/screens/navigation_page.dart';
import 'view_model/user_view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UsersViewmodel()),
      ],
      child: MaterialApp(
       
        home: NavigationScreen(),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
