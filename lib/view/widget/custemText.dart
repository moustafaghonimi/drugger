import 'package:flutter/material.dart';

class CustemText extends StatelessWidget {
  String Txt;
  Color color;
  double size;
  FontWeight fontWeight;
  int maxLines;

  CustemText(
      {required this.Txt,
      required this.color,
      required this.size,
      this.fontWeight = FontWeight.normal,this.maxLines=1});

  @override
  Widget build(BuildContext context) {
    return Text(Txt,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        softWrap:true,
        style: TextStyle(color: color, fontSize: size, fontWeight: fontWeight));
  }
}
