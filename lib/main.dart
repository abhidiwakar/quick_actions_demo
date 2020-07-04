import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quick_action/pages/page1.dart';
import 'package:flutter_quick_action/pages/page2.dart';
import 'package:flutter_quick_action/pages/page3.dart';
import 'package:quick_actions/quick_actions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quick Shortcuts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Quick Shortcuts'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final QuickActions _quickActions = QuickActions();

  @override
  void initState() {
    super.initState();

    _quickActions.initialize((String shortcut) {
      print(shortcut);
      if (shortcut != null) {
        if (shortcut == 'page1') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => Page1(),
            ),
          );
        } else if (shortcut == 'page2') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => Page2(),
            ),
          );
        } else if (shortcut == 'page3') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => Page3(),
            ),
          );
        } else {
          debugPrint('No quick action selected!');
        }
      }
    });

    _quickActions.setShortcutItems(
      <ShortcutItem>[
        const ShortcutItem(
          type: 'page1',
          localizedTitle: 'Goto Page1',
          icon: 'ic_home_black_24',
        ),
        const ShortcutItem(
          type: 'page2',
          localizedTitle: 'Goto Page2',
          icon: 'ic_trending_black_24',
        ),
        const ShortcutItem(
          type: 'page3',
          localizedTitle: 'Goto Page3',
          icon: 'ic_category_black_24',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Platform.isIOS
          ? CupertinoNavigationBar(
              middle: Text(widget.title),
            )
          : AppBar(
              title: Text(widget.title),
            ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This is homepage',
            ),
          ],
        ),
      ),
    );
  }
}
