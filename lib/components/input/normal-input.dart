import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app78/components/input/input-attribute.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NormalInput extends StatelessWidget {

    InputAttribute inputAttribute;
    TextEditingController controll;
    FormFieldSetter<String> onChanged;
    NormalInput({@required this.onChanged, this.inputAttribute, this.controll}): super();

    @override
    Widget build(BuildContext context) {

        return ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: inputAttribute.maxHeight,
                maxWidth: inputAttribute.maxWidth,
                minHeight: inputAttribute.minHeight,
                minWidth: inputAttribute.minWidth
            ),
            child: TextField(
                onChanged: this.onChanged,
                controller: this.controll,
                obscureText: inputAttribute.type == 'password',
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: inputAttribute.placeholder,
                    contentPadding: EdgeInsets.only(left: ScreenUtil().setWidth(15)),
                    fillColor: Color.fromRGBO(255, 255, 255, 1),
                    filled: true
                ),
            ),
        );
    }
}