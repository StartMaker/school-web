import 'package:flutter/cupertino.dart';
import 'package:flutter_app78/components/figure/TrianglePainter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BubbleCard extends StatelessWidget {

    final Widget child;
    String position;
    BubbleCard({
        Key key,
        this.position = 'left',
        @required this.child
    }):super(key: key);

    @override
    Widget build(BuildContext context) {

        CustomPaint trianglePainter = CustomPaint(
            painter: TrianglePainter(
                color:  Color.fromRGBO(234, 244, 244, 1),
                position: position
            ),
            size: Size(12.00, 12.00),
        );

        return Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Row(
                mainAxisAlignment: position == 'left' ? MainAxisAlignment.start: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                    Offstage(
                        offstage: position != 'left',
                        child: trianglePainter,
                    ),
                    Container(
                        child: child,
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
                        margin: EdgeInsets.only(top: 10, bottom: 10, left: 0),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(234, 244, 244, 1),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        constraints: BoxConstraints(
                            maxWidth: ScreenUtil().setWidth(580)
                        )
                    ),
                    Offstage(
                        offstage: position != 'right',
                        child: trianglePainter,
                    )
                ],
            ),
        );
    }
}