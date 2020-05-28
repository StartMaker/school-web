import 'package:flutter/material.dart';
import 'package:flutter_app78/pages/home/activity/main.dart';
import 'package:flutter_app78/pages/home/chat/main.dart';
import 'package:flutter_app78/pages/home/contact/main.dart';
import 'package:flutter_app78/pages/home/person/main.dart';

class MyHomePageConfig {
    String title;
    Widget page;
    MyHomePageConfig(this.title, this.page);
}

class MyHomePage extends StatefulWidget {

    @override
    _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    //底部导航
    int _counter = 0;
    List<MyHomePageConfig> myHomePageConfig = <MyHomePageConfig>[
        MyHomePageConfig('消息', Chat()),
        MyHomePageConfig('通讯录', Contact()),
        MyHomePageConfig('动态', Activity()),
        MyHomePageConfig('我', Person())
    ];
    void navigatorChange (int currentCount) {
        setState(() {
            _counter = currentCount;
        });
    }

    BottomNavigationBarItem createBottomNavigationBarItem (String title, Icon icon) {
        return BottomNavigationBarItem(
            backgroundColor: Color.fromRGBO(200, 200, 200, 1),
            icon: icon,
            title: Text(title)
        );
    }

    @override
    Widget build(BuildContext context) {

        return Scaffold(
            appBar: AppBar(
                backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                elevation: 0,
                title: Center(
                    child: Text(
                        myHomePageConfig[_counter].title,
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontWeight: FontWeight.w500
                        ),
                    ),
                )
            ),
            body: myHomePageConfig[_counter].page,
            backgroundColor: Color.fromRGBO(240, 245, 245, 1),
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: <BottomNavigationBarItem> [
                    createBottomNavigationBarItem(
                        '消息',
                        Icon(Icons.chat_bubble)
                    ),
                    createBottomNavigationBarItem(
                        '通讯录',
                        Icon(Icons.account_box)
                    ),
                    createBottomNavigationBarItem(
                        '动态',
                        Icon(Icons.train)
                    ),
                    createBottomNavigationBarItem(
                        '我',
                        Icon(Icons.person)
                    )
                ],
                currentIndex: _counter,
                onTap: navigatorChange
            ),
        );
    }
}
