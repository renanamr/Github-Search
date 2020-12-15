import 'package:flutter/material.dart';
import 'package:github_search/src/models/User.dart';
import 'UserSample.dart';

class ListUser extends StatelessWidget {

  final List<User> users;
  const ListUser(this.users);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (_,index){
          return UserSample(user: users[index]);
        },
      ),
    );
  }
}
