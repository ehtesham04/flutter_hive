import 'package:flutter/material.dart';
import 'package:to_do/util/my_button.dart';
//ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          //get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task"
                ),

              ),
          
          //buttons -> save and cancel
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            //save
            MyButton(text: "Save", onPressed: onSave),

            //cancel
            MyButton(text: "Cancel", onPressed: onCancel)

            ],
          )
            ],
        ),
      ),
    );
  }
}