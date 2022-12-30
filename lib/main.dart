import 'package:flutter/material.dart';
//import 'package:startup_name/views/catalogs/HardwareChecklist/list.dart';
import '/menu.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appName = 'Jelp Deliery';
    //const catalogName = 'Hardware checklist';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      //home: const MyHomePage(catalogName),
      home: const Menu(appName),
    );
  }
}
