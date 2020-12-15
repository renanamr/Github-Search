import 'package:flutter/material.dart';
import 'package:github_search/src/blocs/Home_Bloc.dart';

import 'widgets/ListUser.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController controllerSearch = TextEditingController();


  HomeBloc homeBloc;

  @override
  void initState() {
    homeBloc = HomeBloc();
    super.initState();
  }

  @override
  void dispose() {
    controllerSearch.dispose();
    homeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Github Search'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [

          Padding(
            padding: const EdgeInsets.fromLTRB(8.0,8.0,8.0,2.0),

            child: TextField(
              controller: controllerSearch,
              onChanged: (String text){
                homeBloc.getUsers(controllerSearch.text);
              },
              decoration: InputDecoration(
                labelText: 'Pesquisa',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Colors.blue)),
              ),
            ),
          ),

          StreamBuilder(
            stream: homeBloc.listStream,
            builder: (BuildContext _, snapshot){

              if (snapshot.hasError) {
                return Text('Erro: ${snapshot.error}');
              }

              switch (snapshot.connectionState) {

                case ConnectionState.waiting:
                  return const Text('Carregando...');

                default:
                  return ListUser(snapshot.data);
              }

            },)
        ],
      ),
    );
  }
}

