import 'package:flutter/material.dart';
import 'package:to_do/util/dialog_box.dart';
import 'package:to_do/util/todo_tiles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text controller
  final _controller = TextEditingController();

  //list of tasks
  List toDoList = [
    ["Make a Robot!", false],
    ["Make an artificial brain", false]
  ];

  //checkbox was tapped
  void checkBoxChanged(bool? value, index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  //save a task
  void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.pop(context);
  }

  //delete a task
  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }

  //create a task
  void createTask(){
    showDialog(
      context: context, 
      builder: (context){
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: Navigator.of(context).pop,
        );
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Center(child: Text("TO DO",),),
        backgroundColor: Colors.yellow,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,
        
        ),
        backgroundColor: Colors.yellow,
        onPressed: createTask
        ,),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0], 
            taskCompleted: toDoList[index][1], 
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index) ,
            );

        },
      ),

    );
  }
}