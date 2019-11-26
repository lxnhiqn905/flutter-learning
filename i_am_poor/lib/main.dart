import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.blue,
            appBar: AppBar(
              backgroundColor: Colors.blue[900],
              title: Text('I Am Poor'),
            ),
            body: Center(
              child: Image(
                image: AssetImage('images/poor.png'),
              ),
            )),
      ),
    );
