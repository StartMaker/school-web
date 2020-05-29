import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app78/components/cards/normal-card.dart';

class OrganizationList extends StatelessWidget {
    @override
    Widget build(BuildContext context) {

        Map<String, String> createRouteParams (username, id) {
            Map<String, String> routeParams = {
                "id": id,
                "username": username,
                "defaultLogo": "http://i2.hdslb.com/bfs/face/d79637d472c90f45b2476871a3e63898240a47e3.jpg"
            };
            return routeParams;
        }

        return Scaffold(
            backgroundColor: Color.fromRGBO(240, 247, 247, 1),
            appBar: AppBar(
                elevation: 0,
                centerTitle: true,
                iconTheme: IconThemeData(
                    color: Colors.black,
                ),
                title: Text(
                    '学生中心',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1)
                    ),
                ),
                backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            ),
            body: ListView(
                padding: EdgeInsets.only(top: 10),
                children: <Widget>[
                    NormalCard(
                        leading: Icon(Icons.book),
                        title: '图书馆',
                        onTap: (){
                            Navigator.pushNamed(context, '/chat', arguments: createRouteParams("图书馆", "library"));
                        },
                    ),
                    NormalCard(
                        title: '活动中心',
                        leading: Icon(Icons.accessibility_new),
                        onTap: (){
                            Navigator.pushNamed(context, '/chat', arguments: createRouteParams("活动中心", "activities"));
                        }
                    ),
                    NormalCard(
                        title: "教务处",
                        leading: Icon(Icons.school),
                        onTap: (){
                            Navigator.pushNamed(context, '/chat', arguments: createRouteParams("教务处", "classes"));
                        },
                    )
                ],
            )
        );
    }
}