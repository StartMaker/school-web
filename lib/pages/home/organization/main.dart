import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app78/components/cards/normal-card.dart';

class OrganizationList extends StatelessWidget {
    @override
    Widget build(BuildContext context) {

        return Scaffold(
            backgroundColor: Color.fromRGBO(240, 247, 247, 1),
            appBar: AppBar(
                elevation: 0,
                centerTitle: true,
                iconTheme: IconThemeData(
                    color: Colors.black,
                ),
                title: Text(
                    '机构号',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1)
                    ),
                ),
                backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            ),
            body: ListView(
                padding: EdgeInsets.only(top: 10),
                children: <Widget>[
                    NormalCard(
                        leading: Icon(Icons.book),
                        title: '图书馆'
                    ),
                    NormalCard(
                        title: '电影院',
                        leading: Icon(Icons.movie)
                    )
                ],
            )
        );
    }
}