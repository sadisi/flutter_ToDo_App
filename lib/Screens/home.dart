import 'package:flutter/material.dart';
import 'package:todo_app/constants/colors.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tdBGColor,
        title: Row(children: [
          Icon(Icons.menu,
          color: tdBlack,
          size: 30,
          ),
          Container(
            height: 40,
          )
        ],),
      ),
      body: Container(
        child: Text('This is home Screen'),
      ),
    );
  }
}
