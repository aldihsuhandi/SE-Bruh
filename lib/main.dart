import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: Home(),
));

class Home extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                // leading: IconButton(
                //     onPressed: null,
                //     icon: Icon(Icons.menu),
                //     tooltip: "Navigation",
                // ),
                title: Text("Homapage"),
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
            drawer: NavMenu(),
            floatingActionButton: FloatingActionButton(
                onPressed: () {},
                child: Text("click"),
                backgroundColor: Colors.black87,
            ),
        );
    }
}

class NavMenu extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return Drawer(
            child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget> [
                    ListTile(title: Text("Test 1"), onTap: () {Navigator.pop(context);},),
                ]
            ),
        );
    }
}
