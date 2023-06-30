import 'package:finder/data/provider/bachelor_list.dart';
import 'package:finder/data/provider/bachelor_likes.dart';
import 'package:finder/router/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => BachelorLikes()),
      ChangeNotifierProvider(create: (context) => BachelorList()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: ThemeData(primarySwatch: Colors.purple));
  }
}
