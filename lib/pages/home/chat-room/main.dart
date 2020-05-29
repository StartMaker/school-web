import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app78/components/input/input-attribute.dart';
import 'package:flutter_app78/components/input/normal-input.dart';
import 'package:flutter_app78/model/message.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_app78/components/cards/bubble-card.dart';

class ChatRoom extends StatefulWidget {
    _ChatRoom createState() => _ChatRoom();
}

class _ChatRoom extends State<ChatRoom> with WidgetsBindingObserver{

    TextEditingController message = new TextEditingController();
    double _focusNodePaddingBottom = 0;
    bool inputHasValue = false;

    Map<String, List<Message>> messagesList = {
        "activities": [
            Message(false, "请问需要咨询什么？\n 可咨询以下几种问题 \n 1、最近活动 \n 2、活动报名")
        ],
        "library": [
            Message(false, "您可以咨询以下问题：\n 1、书籍or作者简介 \n 2、是否可借阅 \n 3、借阅资费")
        ],
        "classes": [
            Message(false, "您可以查询以下问题：\n 1、学期成绩 \n 2、本学期课表 \n 3、最近考试")
        ],
        "other": []
    };

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

        List<Widget> createChat() {
            List<Message> ownerMessage = messagesList[routeArguments['id']]?? messagesList["other"];
            List<Widget> chats = [];
            ownerMessage.forEach((element) {
                chats.add(BubbleCard(
                    child: Text(
                        element.message,
                        softWrap: true,
                        maxLines: 200
                    ),
                    position: element.send ? 'right': 'left',
                ));
            });
            return chats;
        }

        void sendMessage() {
            String message = this.message.text;
            if (message != '' && (routeArguments['id'] == "activities" || routeArguments['id'] == "library"|| routeArguments['id'] == "classes")) {
                Message messageContent = Message(true, message);
                Message messageContent2;
                switch(message) {
                    case "雷雨大概讲了什么？":
                    case "雷雨大概讲了什么":
                        messageContent2 = Message(false, "《雷雨》是剧作家曹禺创作的一部话剧，发表于1934年7月《文学季刊》\n 此剧以1925年前后的中国社会为背景，描写了一个带有浓厚封建色彩的资产阶级家庭的悲剧。剧中以两个家庭、八个人物、三十年的恩怨为主线，伪善的资本家大家长周朴园，受新思想影响的单纯的少年周冲，被冷漠的家庭逼疯了和被爱情伤得体无完肤的女人蘩漪，对过去所作所为充满了罪恶感、企图逃离的周萍，还有意外归来的鲁妈，单纯着爱与被爱的四凤，受压迫的工人鲁大海，贪得无厌的管家等，不论是家庭秘密还是身世秘密，所有的矛盾都在雷雨之夜爆发，在叙述家庭矛盾纠葛、怒斥封建家庭腐朽顽固的同时，反映了更为深层的社会及时代问题");
                        break;
                    case "曹禺的介绍":
                    case "曹禺是谁":
                        messageContent2 = Message(false, "曹禺（1910年9月24日—1996年12月13日），原名万家宝，字小石，小名添甲，汉族，祖籍湖北潜江，出生于天津一个没落的封建官僚家庭，中国杰出的现代话剧剧作家。曹禺自小随继母辗转各个戏院听曲观戏，故而从小心中便播下了戏剧的种子。其代表作品有《雷雨》、《日出》、《原野》、《北京人》");
                        break;
                    case  "雷雨是否可以借":
                        messageContent2 = Message(false, "可以借出");
                       break;
                    case "我本学期的成绩咋样":
                    case "看一下我本学期的成绩":
                        messageContent2 = Message(false, "你的本学期成绩如下：\n 数学：145 \n 语文：120 \n 英语：120");
                        break;
                    case "本学期课表":
                    case "查看我的本学期课表":
                        messageContent2 = Message(false, "你本学期的课表如下：\n 周一 周二 周三 周四 周五 \n 英语 语文 数学 物理 数学 \n 语文 英语 语文 数学 物理 \n 语文 英语 语文 数学 物理 \n 语文 英语 语文 数学 物理");
                        break;
                    case "最近我的考试有哪些":
                        messageContent2 = Message(false, "你最近暂无考试");
                        break;
                    case "学校最近有哪些活动":
                        messageContent2 = Message(false, "最近学校的活动 \n 1、2020-5-4 五四青年节演讲 \n 2、2020-5-8 校运动会");
                        break;
                    default:
                        messageContent2 = Message(false, "未明白你的意思");
                        break;
                }
                this.setState(() {
                    messagesList[routeArguments['id']].add(messageContent);
                    messagesList[routeArguments['id']].add(messageContent2);
                    this.message.text = '';
                });
            }
            else {
                Message messageContent = Message(true, message);
                this.setState(() {
                   messagesList['other'].add(messageContent);
                   this.message.text = '';
                });
            }
        }

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
            body: ListView(
                children: createChat(),
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
                                                if (message != null || message != '') {
                                                    this.setState(() {
                                                        inputHasValue = true;
                                                    });
                                                }
                                                else {
                                                    inputHasValue = false;
                                                }
                                            },
                                            controll: this.message,
                                            inputAttribute: InputAttribute(
                                                maxHeight: ScreenUtil().setHeight(70)
                                            ),
                                        ),
                                    ),
                                ),
                                Offstage(
                                    offstage: inputHasValue,
                                    child: IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: (){
                                            this.setState(() {});
                                        },
                                    ),
                                ),
                                Offstage(
                                    offstage: !inputHasValue,
                                    child: Container(
                                        width: ScreenUtil().setWidth(180),
                                        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                                        child: MaterialButton(
                                            color: Colors.blue,
                                            textColor: Colors.white,
                                            child: Text(
                                                '发送'
                                            ),
                                            onPressed: sendMessage,
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