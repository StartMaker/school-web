import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app78/components/input/input-attribute.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Input extends StatelessWidget {

    InputAttribute inputAttribute;
    FormFieldSetter<String> onSaved;
    TextEditingController controll;
    FormFieldValidator validator;
    Input({
        @required this.inputAttribute,
        Key key,
        @required this.onSaved,
        this.controll,
        this.validator
    }) :super(key: key);


    @override
    Widget build(BuildContext context) {

        return Container(
            decoration: inputAttribute.boxDecoration,
            margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(40)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                    Offstage(
                        offstage: inputAttribute.label == '',
                        child: Container(
                            width: ScreenUtil().setWidth(80),
                            child: Text(inputAttribute.label),
                        ),
                    ),
                    Expanded(
                        child: TextFormField(
                            onSaved: this.onSaved,
                            obscureText: inputAttribute.type == 'password',
                            textAlign: TextAlign.center,
//                            onChanged: (text) {
//                                print(text);
//                            },
//                            validator: (d) {
//                                return null;
//                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: inputAttribute.placeholder,
                            ),
                        ),
                    )
                ],
            ),
        );
    }
}