import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app78/components/cards/normal-card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app78/model/user.dart';

class Setting extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        User user = User(username: '森林迷了鹿', password: '123456789', phone: '15283769781');
        List<Widget> createColumns() {
            return user.toList().map((item){
                final bool isPassword = (item['key'] == 'avatar');
                return NormalCard(
                    height: isPassword ? ScreenUtil().setHeight(150) : null,
                    title: item['name'],
                    trailing: Container(
                        width: ScreenUtil().setWidth(300),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                                item['key'] != 'avatar'
                                    ? Text(item['key'] == 'password' ?  '已设置' : item['data'])
                                    : Container(
                                        width: 60,
                                        height: 60,
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(6.0),
                                            child: Image.network(item['data']),
                                        ),
                                    ),
                                Icon(Icons.navigate_next)
                            ],
                        ),
                    ),
                );
            }).toList();
        }

        return Scaffold(
            appBar: AppBar(
                backgroundColor: Color.fromRGBO(240, 245, 245, 1),
                centerTitle: true,
                title: Text(
                    '个人设置',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1)
                    ),
                ),
                iconTheme: IconThemeData(
                    color: Colors.black,
                )
            ),
            body: Container(
                child: ListView(
                    children: createColumns(),
                ),
            )
        );
    }
}