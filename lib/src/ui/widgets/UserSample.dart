import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:github_search/src/models/User.dart';
import 'package:github_search/src/ui/ExpandedUser.dart';
import 'package:github_search/src/ui/widgets/ImageGit.dart';

class UserSample extends StatelessWidget {

  final User user;
  const UserSample({@required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (_)=> ExpandedUser(user: user,))),

      title: Text(user.nickName, style: TextStyle(fontWeight: FontWeight.bold),),

      subtitle: Text(user.url, overflow: TextOverflow.ellipsis,),

      leading: ImageGit(user.photoUrl, 40)
    );
  }
}
