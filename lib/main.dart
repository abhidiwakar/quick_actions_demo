import 'package:flutter/material.dart';
import 'package:flutter_quick_action/pages/page1.dart';
import 'package:flutter_quick_action/pages/page2.dart';
import 'package:flutter_quick_action/pages/page3.dart';
import 'package:flutter_quick_action/pages/page4.dart';
import 'package:flutter_quick_action/pages/page5.dart';
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

    _quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
          type: 'page1', localizedTitle: 'Goto Page1', icon: 'g_earth'),
      const ShortcutItem(
          type: 'page2', localizedTitle: 'Goto Page2', icon: 'star'),
      const ShortcutItem(
          type: 'page3', localizedTitle: 'Goto Page3', icon: 'g_earth'),
      const ShortcutItem(
          type: 'page4', localizedTitle: 'Goto Page4', icon: 'star'),
      const ShortcutItem(
          type: 'page5', localizedTitle: 'Goto Page5', icon: 'g_eath'),
    ]);

    _quickActions.initialize((String shortcut) {
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
        } else if (shortcut == 'page4') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => Page4(),
            ),
          );
        } else if (shortcut == 'page5') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => Page5(),
            ),
          );
        } else {
          debugPrint('No quick action selected!');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
