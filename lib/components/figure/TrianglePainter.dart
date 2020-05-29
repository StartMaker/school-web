import 'package:flutter/material.dart';

/// 绘制三角形
class TrianglePainter extends CustomPainter{

    Color color; //填充颜色
    Paint _paint;//画笔
    Path _path;  //绘制路径
    String position;

    TrianglePainter({this.color, this.position}){
        _paint = Paint()
            ..strokeWidth = 1.0 //线宽
            ..color = color
            ..isAntiAlias = true;
        _path = Path();
    }

    @override
    void paint(Canvas canvas, Size size) {
        // TODO: implement paint
        final baseX = size.width * 0.5;
        final baseY = size.height * 0.5;
        //起点
        if (position == 'left') {
            _path.moveTo(0, baseY);
            _path.lineTo(baseX*2.0, 0.2*baseY);
            _path.lineTo(baseX*2.0, 1.8*baseY);
        }
        else if (position == 'right') {
            _path.moveTo(baseX*2, baseY*0.75);
            _path.lineTo(0, baseY*0.2);
            _path.lineTo(0, baseX*1.8);
        }

        canvas.drawPath(_path,_paint);
    }

    @override
    bool shouldRepaint(CustomPainter oldDelegate) {
        // TODO: implement shouldRepaint
        return false;
    }

}