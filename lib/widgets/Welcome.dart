import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hinder/main.dart';
import 'package:provider/provider.dart';

class TabBarApp extends StatelessWidget {
  const TabBarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.settings),
              ),
              Tab(
                icon: Icon(Icons.person),
              )
            ],
          ),
          title: const Text('Flutter mapp'),
        ),
        body: TabBarView(
          children: [
            Container(
              color: Colors.orange,
              child: const Icon(Icons.home),
            ),
            Container(
              color: Colors.orange,
              child: const Icon(Icons.home),
            ),
            Container(
              color: Colors.orange,
              child: const Icon(Icons.home),
            )
          ],
          )
      )
    );
  }
}
