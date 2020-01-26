import 'package:flutter/material.dart';
import 'Todo.dart';


class ToDoList extends StatefulWidget {
  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<Todo> todos = [];
  TextEditingController  _textFieldController = new TextEditingController();
    _toggleTodo(Todo todo, bool isChecked) {
        setState(() {
      todo.isDone = isChecked;
    });
   }
   
    Widget _buildItem(BuildContext context, int index) {
    final todo = todos[index];

    return CheckboxListTile(
      value: todo.isDone,
      title: Text(todo.title),
      onChanged: (bool isChecked) {
      _toggleTodo(todo, isChecked);
      },
     );
   }
// _addTodo() {}
_addTodo() async {
final todo = await showDialog<Todo>(
       context: context,
       builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
           title: Text('New todo'),
           content: TextField(
           controller:  _textFieldController,
           autofocus: true,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancel"),
               onPressed: () {
               Navigator.of(context).pop(); 
              },    
            ),
            FlatButton(
              child: Text("Add", style: TextStyle(color: Colors.blue),),
              onPressed: () {
              setState(() {
              final todo = new Todo(title:  _textFieldController.value.text);
                  if( _textFieldController.value.text == "") {
                    print("");
                  }else{
                  todos.add(todo);
                  }
                   _textFieldController.clear();
                   _textFieldController.clear();
                  Navigator.of(context).pop();
                });
                // Navigator.of(context).pop(todo);
              },
            ),
          ],
        );    
       },
     );
      if(todo != null) {
       setState(() {
         todos.add(todo);
       });
     }
   } 
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Todo List'),
      ),
      body: ListView.builder(
        itemBuilder: _buildItem,
        itemCount: todos.length,
       ),
       floatingActionButton: FloatingActionButton(
         child: Icon(Icons.add),
         onPressed: _addTodo,
       ),
    );
  }
}