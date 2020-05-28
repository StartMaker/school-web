import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import 'dart:io';

class Search extends StatefulWidget {
    @override
    _Search createState() => _Search();
}

class _Search extends State<Search> {

    bool _floatBtnVisible = false;
    FocusNode focusNode = new FocusNode();
    FlutterSound flutterSound = new FlutterSound();

    void voiceRecord () async{
        String result = await flutterSound.startRecorder(codec: t_CODEC.CODEC_AAC,);
        print(result);
    }

    @override
    void initState() {
        super.initState();
        focusNode.addListener(() {
            setState(() {
                _floatBtnVisible  = !focusNode.hasFocus;
            });
        });
        flutterSound.setSubscriptionDuration(0.01);
        flutterSound.setDbPeakLevelUpdate(0.8);
        flutterSound.setDbLevelEnabled(true);
    }

    @override
    Widget build(BuildContext context) {

        return Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(ScreenUtil().setHeight(100)),
                child: AppBar(
                    backgroundColor: Color.fromRGBO(237, 237, 237, 0.75),
                    title: Container(
                        height: ScreenUtil().setWidth(70),
                        margin: EdgeInsets.only(top: ScreenUtil().setHeight(8)),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.all(
                                Radius.circular(ScreenUtil().setWidth(35)), //边角为30
                            ),
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(left: ScreenUtil().setWidth(17.5)),
                            child: Row(
                                children: <Widget>[
                                    Icon(Icons.search, color: Colors.grey,),
                                    Expanded(
                                        child: TextField(
                                            decoration: InputDecoration(
                                                contentPadding: EdgeInsets.only(bottom: ScreenUtil().setHeight(20), top: 0, left: 5, right: 0),
                                                fillColor: Colors.black,
                                                border: InputBorder.none,
                                                hintText: "输入要搜索的内容",
                                                hintStyle: TextStyle(
                                                    fontSize: ScreenUtil().setSp(32),
                                                    color: Color.fromRGBO(0, 0, 0, 0.6)
                                                )),
                                        ),
                                    ),
                                    IconButton(
                                        icon: new Icon(Icons.cancel),
                                        color: Colors.grey,
                                        iconSize: 18.0,
                                        onPressed: () {
                                            Navigator.pop(context);
                                        },
                                    )
                                ],
                            ),
                        )
                    ),
                    automaticallyImplyLeading: false,
                ),
            ) ,
            body: Container(
                child: Column(
                    children: <Widget>[
                        Center(
                            child: Column(
                                children: <Widget>[
                                    Text(
                                        '搜索内容',
                                        style: TextStyle(
                                            height: ScreenUtil().setHeight(8),
                                            fontSize: ScreenUtil().setSp(35)
                                        ),
                                        textAlign: TextAlign.center
                                    ),
                                    Container(
                                        width: 200,
                                        child: Row(
                                            children: <Widget>[
                                                Expanded(
                                                    child: Text(
                                                        '文章',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: ScreenUtil().setSp(30)
                                                        ),
                                                    ),
                                                ),
                                                Expanded(
                                                    child: Text(
                                                        '文章',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: ScreenUtil().setSp(30)
                                                        )
                                                    ),
                                                ),
                                                Expanded(
                                                    child: Text(
                                                        '文章',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: ScreenUtil().setSp(30)
                                                        )
                                                    ),
                                                ),
                                            ],
                                        ),
                                    ),
                                ],
                            ),
                        )
                    ],
                ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Offstage(
                offstage: _floatBtnVisible,
                child: RaisedButton(
                    shape: CircleBorder(),
                    child: Padding(
                        padding: EdgeInsets.all(ScreenUtil().setWidth(25)),
                        child: Icon(
                            Icons.keyboard_voice,
                            size: ScreenUtil().setWidth(60),
//                        color: Color.fromRGBO(r, g, b, opacity),
                        ),
                    ),
                    onHighlightChanged: (a){
                        print(a);
                        if (a) {
                            Future<String> result =  flutterSound.startRecorder(codec: t_CODEC.CODEC_AAC);
                            result.then((path) {
                                print('$path');
                            });
                        }
                        else {
                            Future<String> a = flutterSound.stopRecorder();
                            a.then((value) async{
                                File fin = File (value);
                                Future<String> b =  flutterSound.startPlayer(fin.path);
                                b.then((success) {

                                });
                            });
                        }
                    },
                    onPressed: (){

                    }
                )
            )
        );
    }
}