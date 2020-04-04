import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unergiagraphapp/Notifers/ActivityNotifer.dart';
import 'package:unergiagraphapp/Notifers/CardEvaliton.dart';
import 'package:unergiagraphapp/Notifers/FirebaseDataRetriver.dart';
import 'package:unergiagraphapp/Notifers/PiechartNotifer.dart';

import 'package:unergiagraphapp/Views/HomeView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<CardElevation>(
            create: (_) => CardElevation(),
          ),
          ChangeNotifierProvider<FirebaseNotfier>(
            create: (_) => FirebaseNotfier(),
          ),
          ChangeNotifierProvider<PiechartNotifir>(
              create: (_) => PiechartNotifir()),
          ChangeNotifierProvider<ActivityNotifier>(
            create: (_) => ActivityNotifier(),
          ),
        ],
        child: Homeview(),
        // child: Test(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
