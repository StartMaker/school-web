import 'package:flutter/cupertino.dart';

class InputAttribute {

    String type;
    String placeholder;
    String label;
    double maxWidth;
    double maxHeight;
    double minHeight;
    double minWidth;
    TextAlign textAlign;
    BoxDecoration boxDecoration;

    InputAttribute({
        this.type = '',
        this.placeholder = '',
        this.label = '',
        this.minHeight = 0,
        this.minWidth = 0,
        this.maxHeight = double.infinity,
        this.maxWidth = double.infinity,
        this.textAlign = TextAlign.start,
        BoxDecoration boxDecoration
    }):
        boxDecoration = boxDecoration ?? BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1)),
            super();
}