import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: Home(),
));


class Home extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
            title: Text('Homepage'),
            centerTitle: true,
            backgroundColor: Colors.black87,
        ),
        body: Center(
            child: Text(
                "Test text",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    color: Colors.grey[600],
                    fontFamily: 'Roboto',
                ),
            ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Text("click"),
            backgroundColor: Colors.black87,
        ),
    );
    }
}
