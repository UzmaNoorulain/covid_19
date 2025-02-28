import 'package:flutter/material.dart';
class RoundedSearchInput extends StatefulWidget {
  final TextEditingController textController;
  final String hintText;
  final Function() onChanged;
  const RoundedSearchInput(
      {required this.textController, required this.hintText, Key? key, required this.onChanged,})
      : super(key: key);

  @override
  State<RoundedSearchInput> createState() => _RoundedSearchInputState();
}

class _RoundedSearchInputState extends State<RoundedSearchInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15,left: 15),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(12, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(.1)),
      ]),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        controller: widget.textController,
        onChanged:(value){
          // widget.onChanged;
          setState(() {

          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white70,
          ),
          filled: true,
          fillColor: Colors.black45,
          hintText: widget.hintText,
          hintStyle:
          const TextStyle(color: Colors.white70, fontWeight: FontWeight.w300),
          contentPadding:
          const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(45.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white70, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(45.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(45.0)),
          ),
        ),
      ),
    );
  }
}
