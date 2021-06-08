import 'package:flutter/material.dart';
import 'task_widget.dart';

class TasksPage extends StatefulWidget {
  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final _controller = TextEditingController();

  List<TaskWidget> taskList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo List'),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextField(
                        cursorColor: Colors.white,
                        controller: _controller,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: FlatButton(
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            taskList.add(
                              TaskWidget(taskText: _controller.text),
                            );
                            _controller.text = '';
                          });
                        },
                        child: Text(
                          'ADD',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 10,
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: taskList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          setState(() {
                            taskList.removeAt(index);
                          });
                        },
                        direction: DismissDirection.endToStart,
                        child: Container(
                          child: Center(
                            child: taskList[index],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}


/*
ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return Dismissible(
              // Each Dismissible must contain a Key. Keys allow Flutter to
              // uniquely identify widgets.
              key: Key(item),
              // Provide a function that tells the app
              // what to do after an item has been swiped away.
              onDismissed: (direction) {
                // Remove the item from the data source.
                setState(() {
                  items.removeAt(index);
                });

                // Then show a snackbar.
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('$item dismissed')));
              },

              */