import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app78/components/input/input-attribute.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app78/components/input/input.dart';

class Login extends StatelessWidget{

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    Map<String, dynamic> user = {
        'username': '',
        'password': ''
    };

    @override
    Widget build(BuildContext context) {

        //设置屏幕自适应
        ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
        ScreenUtil().setSp(24, allowFontScalingSelf: true);

        //初始化样式
        BoxDecoration inputDecoration = BoxDecoration(
            border: Border.all(
                width: 1,
                color: Color.fromRGBO(0, 0, 0, 1)
            ),
            borderRadius: BorderRadius.circular(ScreenUtil().setWidth(60))
        );

        //登录
        void submit() {
            var _form = _formKey.currentState;
            _form.save();
            Navigator.pushReplacementNamed(context, '/homepage');
//            if (_form.validate()) {
//                Http()
//                    .post('/login/', data: user)
//                    .then((res){
//                    switch (res.code) {
//                        case 0:
//                            Navigator.replace(context, oldRoute: null, newRoute: null);
//                            break;
//                        default:
//                            showDialog<Null>(
//                                context: context,
//                                barrierDismissible: false,
//                                builder: (BuildContext context) {
//                                    return AlertDialog(
//                                        title: Center(
//                                            child: Text('登陆失败'),
//                                        ),
//                                        content: SingleChildScrollView(
//                                            child: ListBody(
//                                                children: <Widget>[
//                                                    Center(
//                                                        child: Text(res.msg),
//                                                    )
//                                                ],
//                                            ),
//                                        ),
//                                        actions: <Widget>[
//                                            FlatButton(
//                                                child: Text('确定'),
//                                                onPressed: () {
//                                                    Navigator.of(context).pop();
//                                                },
//                                            )
//                                        ],
//                                    );
//                                },
//                            );
//                            break;
//                    }
//                });
//            }
        }

        return Scaffold(
            backgroundColor: Color.fromRGBO(250, 250, 250, 1),
            body: SingleChildScrollView(
                child: Container(
                    padding: EdgeInsets.only(
                        top: ScreenUtil().setHeight(300),
                        left: ScreenUtil().setWidth(80),
                        right: ScreenUtil().setWidth(80)
                    ),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                            Container(
                                padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(80)),
                                child: Text(
                                    'voice  -  登录',
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setSp(50)
                                    ),
                                ),
                            ),

                            Form(
                                key: _formKey,
                                child: Column(
                                    children: <Widget>[
                                        Input(
                                            onSaved: (username) {
                                                user['username'] = username;
                                            },
                                            inputAttribute: InputAttribute(
                                                placeholder: 'Enter Your Username',
                                                type: 'text',
                                                textAlign: TextAlign.center,
                                                boxDecoration: inputDecoration
                                            ),
                                            validator: (value) {
                                                RegExp reg = new RegExp(r'^\d{11}$');
                                                if (!reg.hasMatch(value)) {
                                                    return '请输入11位手机号码';
                                                }
                                                return null;
                                            },
                                        ),
                                        Input(
                                            onSaved: (password) {
                                                user['password'] = password;
                                            },
                                            inputAttribute: InputAttribute(
                                                placeholder: 'Enter Your Password',
                                                type: 'password',
                                                textAlign: TextAlign.center,
                                                boxDecoration: inputDecoration
                                            ),
                                        ),
                                        MaterialButton(
                                            color: Colors.blue,
                                            padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(15)),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(60)),
                                            ),
                                            textColor: Colors.white,
                                            minWidth: ScreenUtil().setWidth(1000),
                                            child: Text(
                                                '登录',
                                                style: TextStyle(
                                                    fontSize: ScreenUtil().setSp(30)
                                                ),
                                            ),
                                            onPressed: submit,
                                        )
                                    ],
                                ),
                            ),
                        ],
                    )
                ),
            ),
        );
    }
}