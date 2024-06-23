import 'package:flutter/material.dart';
import 'package:hinder/widgets/user_card.dart';

class Feed extends StatelessWidget {
  final List<UserCard> userCards;

  const Feed({Key? key, required this.userCards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: userCards.length,
      itemBuilder: (context, index) {
        return userCards[index];
      },
    );
  }
}
