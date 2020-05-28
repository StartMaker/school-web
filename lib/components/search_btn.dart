import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class SearchBtn extends StatelessWidget{
    @override
    Widget build(BuildContext context) {

    return Container(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
        height: ScreenUtil().setHeight(60),
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(15), bottom: ScreenUtil().setHeight(25)),
        child: MaterialButton(
            onPressed: () {
                Navigator.pushNamed(context, '/search');
            },
            height: ScreenUtil().setHeight(60),
            child: Row(
                children: <Widget>[
                    Icon(Icons.search),
                    Text(
                        '搜索',
                        style: TextStyle(
                            color: Color.fromRGBO(100, 100, 100, 1)
                        ),
                    )
                ],
                mainAxisAlignment: MainAxisAlignment.center
            ),
            color: Color.fromRGBO(254, 254, 254, 1),
        ),
    );
  }
}