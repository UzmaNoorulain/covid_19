import 'package:flutter/material.dart';

class GradientButtonFb4 extends StatefulWidget {
  final String text;
  final Function() onPressed;

  const GradientButtonFb4(
      {required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  State<GradientButtonFb4> createState() => _GradientButtonFb4State();
}

class _GradientButtonFb4State extends State<GradientButtonFb4> {
  final double borderRadius = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 10,right: 10),
      child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(color: Colors.black45),
              gradient: const LinearGradient(
                  colors: [Color(0xff69e39a), Color(0xff0c5337)])),
          child: ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  alignment: Alignment.center,
                  padding: MaterialStateProperty.all(const EdgeInsets.only(
                      right: 75, left: 75, top: 15, bottom: 15)),
                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                  )),
              onPressed: widget.onPressed,
              child: Text(
                widget.text,
                style: const TextStyle(color: Colors.white,fontSize: 20),
              ))),
    );
  }
}