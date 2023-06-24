import 'package:flutter/material.dart';

class AnsButton extends StatelessWidget {
  final String text;
  final void Function() onTapped;
  const AnsButton({Key? key, required this.text, required this.onTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(40, 10, 40, 10),
      child: ElevatedButton(
        onPressed: onTapped,
        style: ElevatedButton.styleFrom(

            ///the button should take as much space as it can
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: Colors.purple,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            textStyle: const TextStyle(fontSize: 20)),
        child: Text(text, textAlign: TextAlign.center),
      ),
    );
  }
}
