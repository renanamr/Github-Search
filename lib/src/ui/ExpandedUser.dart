import 'package:flutter/material.dart';
import 'package:github_search/src/models/User.dart';
import 'package:github_search/src/ui/widgets/ImageGit.dart';

class ExpandedUser extends StatelessWidget {

  final User user;
  const ExpandedUser({@required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImageGit(user.photoUrl, 100),
          ),


          Text(user.nickName, textAlign: TextAlign.center,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),),

          Text(user.url, textAlign: TextAlign.center,style: const TextStyle(fontSize: 16),),
        ],
      ),
    );
  }
}
