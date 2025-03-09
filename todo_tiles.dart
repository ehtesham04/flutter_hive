import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

//ignore: must_be_immutable
class ToDoTile extends StatelessWidget {

  final String taskName;

  final bool taskCompleted;

  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  ToDoTile({
    super.key, 
    required this.taskName, 
    required this.taskCompleted, 
    required this.onChanged,
    required this.deleteFunction,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),

              ),
              
          ]
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
        
              //check box
              Checkbox(
                value: taskCompleted, 
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
        
              //task name
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none),
              ),
        
            ],
          ),
        
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12)),
        
        ),
      )
      );
  }
}

