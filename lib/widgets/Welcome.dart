import 'package:flutter/material.dart';
import 'package:hinder/main.dart';
import 'package:hinder/widgets/feed.dart';
import 'package:hinder/widgets/profile_info.dart';
import 'package:hinder/widgets/user_card.dart';
import 'package:provider/provider.dart';

class TabBarApp extends StatelessWidget {
  const TabBarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(0, 139, 171, 110),
              bottom: const TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.message),
                  ),
                  Tab(
                    icon: Icon(Icons.home),
                  ),
                  Tab(
                    icon: Icon(Icons.person),
                  )
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Container(
                  color: Colors.orange,
                  child: const Icon(Icons.home),
                ),
                Feed(
                  userCards: [
                    UserCard(
                      name: "Edgar",
                      skillLevel: "Intermediate",
                      gender: "Male",
                    )
                  ],
                ),
                ProfileInfo()
              ],
            )));
  }
}
