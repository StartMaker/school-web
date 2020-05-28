import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NormalCard extends StatelessWidget {

    final String title;
    final double height;
    final Widget leading ;
    final Widget trailing;
    final GestureTapCallback onTap;
    final EdgeInsetsGeometry margin;

    NormalCard({
        Key key,
        @required this.title,
        this.leading,
        this.trailing,
        this.onTap,
        this.margin,
        this.height
    }) : super(key: key);

    @override
    Widget build(BuildContext context) {

    return Container(
        margin: this.margin,
        height: this.height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
            border: Border(
                bottom: BorderSide(
                    width: 1,
                    color: Color.fromRGBO(200, 200, 200, 0.6)
                )
            )
        ),
        child: ListTile(
            leading: this.leading,
            title: Text(this.title),
            trailing: this.trailing,
            onTap: this.onTap,
        ),
    );
  }
}