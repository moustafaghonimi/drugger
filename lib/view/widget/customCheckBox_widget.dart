import 'package:flutter/material.dart';

class CustomCheckBoxWidget extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double size;
  final Color activeColor;

  const CustomCheckBoxWidget({
    Key? key,
    required this.value,
    required this.onChanged,
    this.size = 22.0,
    this.activeColor = Colors.blue,
  }) : super(key: key);

  @override
  State<CustomCheckBoxWidget> createState() => _CustomCheckBoxWidgetState();
}

class _CustomCheckBoxWidgetState extends State<CustomCheckBoxWidget> {
  bool _value = false;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _value = !_value;
          widget.onChanged(_value);
        });
      },
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: _value ? Colors.blue : Colors.orange,
            width: 2.0,
          ),
        ),
        child: _value
            ? Center(
                child: Icon(
                  Icons.check,
                  size: widget.size / 2,
                  color: widget.activeColor,
                ),
              )
            : Container(),
      ),
    );
  }
}
