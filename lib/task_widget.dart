import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  TaskWidget({@required this.taskText});

  final String taskText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Text(
              taskText,
              style: TextStyle(color: Colors.black, fontSize: 20.0),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
                icon: Icon(Icons.delete),
                color: Colors.black,
                iconSize: 40.0,
                onPressed: () {
                  print('delete element');
                }),
          ),
        ],
      ),
    );
  }
}
