import 'package:flutter/material.dart';
import 'package:flutter_app78/pages/entry/login/main.dart';
import 'package:flutter_app78/pages/home/chat-room/main.dart';
import 'package:flutter_app78/pages/home/main.dart';
import 'package:flutter_app78/pages/search/main.dart';
import 'package:flutter_app78/pages/setting/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
    static Map<String, WidgetBuilder> routes;
    static Map<String, WidgetBuilder> initRoute () {
        routes = {
            '/': (context) => Login(),
            '/homepage': (context) => MyHomePage(),
            '/search': (context) => Search(),
            '/setting': (context) => Setting(),
            '/chat': (context) => ChatRoom()
        };
        return routes;
    }

    @override
    Widget build(BuildContext context) {

        return MaterialApp(
            routes: initRoute(),
            initialRoute: '/'
        );
    }
}