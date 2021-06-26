// To parse this JSON data, do
//
//     final newComentario = newComentarioFromJson(jsonString);

import 'dart:convert';

NewComentario newComentarioFromJson(String str) =>
    NewComentario.fromJson(json.decode(str));

String newComentarioToJson(NewComentario data) => json.encode(data.toJson());

class NewComentario {
  NewComentario({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  String postId;
  String id;
  String name;
  String email;
  String body;

  factory NewComentario.fromJson(Map<String, dynamic> json) => NewComentario(
        postId: json["postId"],
        id: json["id"].toString(),
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}
