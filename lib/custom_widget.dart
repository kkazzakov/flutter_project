import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  final String text;
  final bool isSelected;

  CustomWidget({required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: 344),
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        Flexible(
          child: Container(
            constraints: BoxConstraints(minWidth: 10),
            child: CustomPaint(
              size: Size(double.infinity, 0), // Set the height of the dashed line as needed
              painter: DashedLineHorizontalPainter(),
            ),
          ),
        ),
        Checkbox(value: isSelected, onChanged: (bool? value) {}),
      ],
    );
  }
}

class DashedLineHorizontalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 3, dashSpace = 5, startX = 0;

    final paint = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = 2;

    while (startX < size.width && size.width > 10) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashSpace + dashWidth;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}