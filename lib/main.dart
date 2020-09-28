import 'package:flutter/material.dart';
import 'screens/local_image_display.dart';
import 'screens/online_image_display.dart';
import 'widgets/custom_tabbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int tab = 0;
  void switchTab() {
    setState(() {
      tab == 0 ? tab = 1 : tab = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Bipolar App'),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            tab == 0 ? OnlineImageDisplay() : LocalImageDisplay(),
            CustomTabBar(onTap: switchTab, currentTab: tab),
          ],
        ),
      ),
    );
  }
}
