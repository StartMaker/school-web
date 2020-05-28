import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app78/components/cards/normal-card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Person extends StatelessWidget{

    static double dividerHeight = ScreenUtil().setHeight(30);

    @override
    Widget build(BuildContext context) {

        return ListView(
            padding: EdgeInsets.only(top: dividerHeight),
            children: <Widget>[
                NormalCard(
                    title: '支付',
                    leading: Icon(Icons.payment),
                    trailing: Icon(Icons.navigate_next),
                    margin: EdgeInsets.only(bottom: dividerHeight),
                ),
                NormalCard(
                    title: '收藏',
                    leading: Icon(Icons.collections),
                    trailing: Icon(Icons.navigate_next),
                ),
                NormalCard(
                    title: '相册',
                    leading: Icon(Icons.photo_album),
                    trailing: Icon(Icons.navigate_next),
                    margin: EdgeInsets.only(bottom: dividerHeight),
                ),
                NormalCard(
                    title: '设置',
                    leading: Icon(Icons.settings),
                    trailing: Icon(Icons.navigate_next),
                    onTap: () {
                        Navigator.pushNamed(context, '/setting');
                    },
                )
            ],
        );
    }
}