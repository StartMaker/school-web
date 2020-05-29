import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app78/components/cards/normal-card.dart';
import 'package:flutter_app78/components/search_btn.dart';
import 'package:flutter_app78/pages/home/organization/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Contact extends StatelessWidget{

    static String defaultLogo = 'http://i2.hdslb.com/bfs/face/d79637d472c90f45b2476871a3e63898240a47e3.jpg';
    List<Map<String, dynamic>> contactList = [
        {
            'key': 'A',
            'listData': [
                {
                    'id': '0',
                    'username': 'arf',
                    'logo': defaultLogo
                },
                {
                    'id': '1',
                    'username': 'atr',
                    'logo': defaultLogo
                }
            ]
        },
        {
            'key': 'B',
            'listData': [
                {
                    'id': '2',
                    'username': 'betty',
                    'logo': defaultLogo
                }
            ]
        }
    ];

    @override
    Widget build(BuildContext context) {

        List<Widget> createCategoryList () {
            List<Widget> contractListView = [];
            contactList.forEach((key) {
                 contractListView.add(Padding(
                     padding: EdgeInsets.symmetric(
                         horizontal: ScreenUtil().setWidth(45),
                         vertical: ScreenUtil().setWidth(15)
                     ),
                     child: Text(
                         key['key'],
                         style: TextStyle(
                             fontSize: ScreenUtil().setSp(30)
                         ),
                     ),
                 ));
                 key['listData'].forEach((element){
                     contractListView.add(NormalCard(
                         onTap: (){
                             Navigator.pushNamed(context, '/chat', arguments: element);
                         },
                         title: element['username'],
                         leading: Container(
                             decoration: BoxDecoration(
                                 border: Border.all(
                                     color: Color.fromRGBO(247, 247, 247, 0.75)
                                 )
                             ),
                             width: ScreenUtil().setWidth(75),
                             child: ClipRRect(
                                 borderRadius: BorderRadius.circular(6.0),
                                 child: Image.network(element['logo']),
                             ),
                         ),
                     ));
                 });
            });
            return contractListView;
        }

        return Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: ListView(
                children: <Widget>[
                    SearchBtn(),
                    NormalCard(
                        title: '新朋友',
                        leading: Icon(Icons.supervisor_account)
                    ),
                    NormalCard(
                        title: '学生中心',
                        leading: Icon(Icons.school),
                        onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                                return OrganizationList();
                            }));
                        }
                    ),
                    ...?createCategoryList()
                ],
            )
        );
    }
}