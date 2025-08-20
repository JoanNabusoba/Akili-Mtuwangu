import 'package:flutter/material.dart';

class AkiliButton extends StatelessWidget {
  const AkiliButton({super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      height: 45,
      decoration: BoxDecoration(
        color: Color.fromRGBO(253, 94, 0, 1),
        borderRadius: BorderRadius.circular(10),
      ),

      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Color.fromRGBO(254, 234, 189, 1),
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
