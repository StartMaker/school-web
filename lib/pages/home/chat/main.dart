import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app78/components/search_btn.dart';

class Chat extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(0.5),
            child: Row(
                children: <Widget>[
                    Expanded(
                        child: SearchBtn(),
                    ),
                ],
            ),
        );
  }
}