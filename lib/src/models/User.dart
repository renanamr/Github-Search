import 'package:json_annotation/json_annotation.dart';


part 'User.g.dart';
@JsonSerializable()
class User {
  String login; //Nome do usuário
  String avatar_url; //Url da foto do usuário
  String url; //Url para repositorio do usuário

  User();//Contrutor vazio

  //Gerar user a partir de json
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

}
