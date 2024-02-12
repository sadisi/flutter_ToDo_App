import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/widgets/todo_item.dart';

class Home extends StatefulWidget {
   Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todosList = ToDo.todoList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20, 
              vertical: 15,
              ),
            child: Column(
              children: [
               searchBox(),
               Expanded(
                 child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 50, 
                        bottom: 20,
                        ),

                      child: Text(
                        'My ToDos',
                        style: TextStyle(
                          fontSize: 30,
                           fontWeight: FontWeight.w500,
                           ),
                         ),
                    ),
                    for(ToDo toDo in todosList)
                    ToDoItem(
                      toDo: toDo,
                      onToDoChanged: _handleToDoChange,
                      onDeleteItem: _deleteToDoItem,
                      ),
                
                  ],
                 ),
               )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    decoration:  BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0,0.0),
                      blurRadius: 10.0,
                      spreadRadius: 0.0,
                      ),],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Add new ToDo Item',
                        border: InputBorder.none
                      ),
                    ),
                    ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20,right: 20),
                      child: ElevatedButton(
                        child: Text('+',style: TextStyle(fontSize: 40),),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: tdBlue,
                          minimumSize: Size(60, 69),
                          elevation: 10,
                        ),
                      ),
                    )
            ],),
          )
        ],
      ),
    );
  }
  //handeling changes in todo list
void _handleToDoChange(ToDo toDo){
      setState(() {
        toDo.isDone = !toDo.isDone;
      });     
}
//handeling delete events in todo list
void _deleteToDoItem(String id){
  setState(() {
     todosList.removeWhere((item) => item.id == id);
  });
 
}

Widget searchBox(){
  return  Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  prefixIcon: Icon(
                    Icons.search,
                    color: tdBlack,
                    size: 20,
                    ),
                    prefixIconConstraints: BoxConstraints(
                      maxHeight: 20,
                      minWidth: 25
                      ),
                      border: InputBorder.none,
                      hintText:'Search',
                      hintStyle: TextStyle(color:tdGrey),
                ),
              ),
            );

}

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Icon(Icons.menu,
        color: tdBlack,
        size: 35,
        ),
        Container(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/avatar.jpg'),
          ),
        )
      ],),
    );
  }
}
