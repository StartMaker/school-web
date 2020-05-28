import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app78/components/input/input-attribute.dart';
import 'package:flutter_app78/components/input/normal-input.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatRoom extends StatefulWidget {
    _ChatRoom createState() => _ChatRoom();
}

class _ChatRoom extends State<ChatRoom> with WidgetsBindingObserver{

    TextEditingController message = new TextEditingController();
    double _focusNodePaddingBottom = 0;

    @override
    void initState() {
        WidgetsBinding.instance.addObserver(this);
        this.message.text  = '';
        super.initState();
    }

    @override
    void didChangeMetrics() {
        WidgetsBinding.instance.addPostFrameCallback((_) {
            this.setState(() {
                _focusNodePaddingBottom  =  MediaQuery.of(context).viewInsets.bottom;
            });
        });
    }

    @override
    void dispose() {
        WidgetsBinding.instance.removeObserver(this);
        super.dispose();
    }

    @override
    Widget build(BuildContext context) {

        final Map<String, String> routeArguments = ModalRoute.of(context).settings.arguments;

        return Scaffold(
            appBar: AppBar(
                title: Text(
                    routeArguments['username'],
                    style: TextStyle(
                        color: Colors.black
                    ),
                ),
                backgroundColor: Color.fromRGBO(245, 245, 245, 1),
                elevation: 0,
                iconTheme: IconThemeData(
                    color: Colors.black,
                ),
                centerTitle: true,
            ),
            backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            body: Column(
                children: <Widget>[

                ],
            ),
            bottomNavigationBar: BottomAppBar(
                child: Container(
                    color: Color.fromRGBO(245, 245, 245, 1),
                    child: Padding(
                        padding: EdgeInsets.only(bottom: _focusNodePaddingBottom),
                        child: Row(
                            children: <Widget>[
                                IconButton(
                                    icon: Icon(Icons.keyboard_voice),
                                    onPressed: (){

                                    },
                                ),
                                Expanded(
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(15)),
                                        child: NormalInput(
                                            onChanged: (message){
                                                this.setState(() {
                                                    this.message.text = message;
                                                });
                                            },
                                            controll: this.message,
                                            inputAttribute: InputAttribute(
                                                maxHeight: ScreenUtil().setHeight(70)
                                            ),
                                        ),
                                    ),
                                ),
                                Offstage(
                                    offstage: this.message.text != '',
                                    child: IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: (){},
                                    ),
                                ),
                                Offstage(
                                    offstage: this.message.text == '',
                                    child: Container(
                                        width: ScreenUtil().setWidth(160),
                                        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                                        child: MaterialButton(
                                            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(0)),
                                            color: Colors.blue,
                                            textColor: Colors.white,
                                            child: Text('发送'),
                                            onPressed: (){
                                                this.setState(() {
                                                    this.message.text = '';
                                                });
                                            },
                                        ),
                                    ),
                                )
                            ],
                        ),
                    ),
                ),
            )
        );
    }
}