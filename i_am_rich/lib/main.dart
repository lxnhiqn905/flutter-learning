import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.grey,
          appBar: AppBar(
            title: Text('I am Rich'),
            backgroundColor: Colors.blueGrey[900],
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Image(
                  image: NetworkImage('https://image.shutterstock.com/image-photo/mountains-during-sunset-beautiful-natural-260nw-407021107.jpg'),
                ),
                Image(
                  image: AssetImage('images/diamond.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
