import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/page/newMap.dart';

class CommentPage extends StatelessWidget {
  final NewComentario newcomentario;

  CommentPage(this.newcomentario);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Respuesta'),
      ),
      body: Column(
        children: [
          Text(newcomentario.postId),
          Text(newcomentario.name),
          Text(newcomentario.email),
          Text(newcomentario.body),
        ],
      ),
    );
  }
}
