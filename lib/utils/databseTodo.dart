import 'package:hive/hive.dart';

class todoDB{
  final _myBox = Hive.box('myBox');
  List todoList = [];  

  void intialTodo(){
    todoList = [
     ["Do Exercise",false],["Code App",false],
    ];
  }

  void loadData(){
    todoList = _myBox.get("TODOLIST");
  }

  void updateDB(){
   _myBox.put("TODOLIST", todoList);
  }
}