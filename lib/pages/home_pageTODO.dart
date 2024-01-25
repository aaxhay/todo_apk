import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:todo_apk/utils/databseTodo.dart';

import 'package:todo_apk/utils/showalert.dart';

import '../utils/todoTile.dart';

class HomePage extends StatefulWidget {

 const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

final _controller = TextEditingController(); 

final _myBox = Hive.box('myBox');

todoDB db = todoDB();

@override
  void initState() {
    if(_myBox.get("TODOLIST") == null){
      db.intialTodo();
    }
    else{
      db.loadData();
    }
    super.initState();
  }

  void checkboxChanged(bool? value , int index){
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDB();
  }

  
  void saveNewTODO(){
    setState(() {
      db.todoList.add([_controller.text , false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDB();
  }

  void createNewTask(){
    showDialog(context: context, builder: (context){
    return ShowAlertWindow(
      controller: _controller,
      onsave: saveNewTODO,
      onCancel: () => Navigator.of(context).pop(),
    );
    });
  }

  void deleteTask(int index){
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDB();
  }

  Future<void> _handleRefresh () async{
    return await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor: Colors.deepPurple[300],
      appBar: AppBar(
        title: const Text("T  O  D  O",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
        // text
      ),

       floatingActionButton: FloatingActionButton(
        onPressed: createNewTask, 
        child: const Icon(Icons.add),
      ),

      body: LiquidPullToRefresh(
        onRefresh: _handleRefresh,
        height: 250,
        showChildOpacityTransition: false,
        backgroundColor: Colors.deepPurple[300],
        animSpeedFactor: 1,
        child: ListView.builder(
         itemCount: db.todoList.length,
         itemBuilder: (context, index) {
           return TodoTile(
            text: db.todoList[index][0],
            taskChanged: db.todoList[index][1],
            onChanged: (value) => checkboxChanged(value, index),
            onPressed: (context) => deleteTask(index),
      
           );
         },
          ),
      )
    );
  }
}