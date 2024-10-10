import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class buttonWidget extends StatelessWidget {
  String text;
  Function xoCallBack;
  int index;

  buttonWidget(this.text, this.index, this.xoCallBack);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )),
        onPressed: () {
          xoCallBack(index);
        },
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Colors.purple),
        ),
      ),
    ));
  }
}
