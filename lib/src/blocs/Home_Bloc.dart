import 'package:github_search/src/models/User.dart';
import 'package:dio/dio.dart';
import 'package:rxdart/subjects.dart';

class HomeBloc {

  Dio dio; //Construtor para utilização do dio
  BehaviorSubject<List<User>> _subjectList;// Elemento de controle stream

  //Contrutor da class
  HomeBloc(){
    dio = Dio();
    _subjectList = new BehaviorSubject.seeded(List<User>());
  }

  //Retorna valores
  Stream<List<User>> get listStream => _subjectList.stream;

  //Buscar usuarios do git
  getUsers(String nick)async{

    //Buscar users na API GitHub
    Response response = await dio.get("https://api.github.com/search/users?q=${nick}");
    List<User> temp = List<User>();//Lista temporaria para inserção

    //Organizar valores user
    for(var item in response.data["items"]){
      temp.add(User.fromJson(item));
    }

    //Acionar Stream
    _subjectList.sink.add(temp);

  }

  dispose(){
    _subjectList.close();
  }

}