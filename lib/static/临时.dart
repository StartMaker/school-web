TextField(
textAlignVertical: TextAlignVertical.top,
focusNode: focusNode,
textInputAction: TextInputAction.search,
autofocus: true,
cursorColor: Colors.blueAccent,
cursorWidth: 1.0,
decoration: InputDecoration(
contentPadding: EdgeInsets.only(bottom: 5, top: 0, left: 0, right: 0),
fillColor: Colors.black,
border: InputBorder.none,
icon: Icon(Icons.search),
hintText: "输入要搜索的内容",
hintStyle: TextStyle(
fontSize: ScreenUtil().setSp(32),
color: Color.fromRGBO(0, 0, 0, 0.6)
)),
style: TextStyle(
fontSize: ScreenUtil().setSp(32),
color: Colors.black,
),
)