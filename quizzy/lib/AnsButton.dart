import 'package:flutter/material.dart';

class AnsButton extends StatelessWidget {
  final String text;
  final void Function() onTapped;
  const AnsButton({Key? key, required this.text, required this.onTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTapped,
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(150, 50),
          backgroundColor: Colors.purple,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          textStyle: const TextStyle(fontSize: 20)),
      child: Text(text),
    );
  }
}
