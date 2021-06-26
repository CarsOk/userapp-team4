import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/page/commentPage.dart';
import 'package:flutter_application_1/src/page/newMap.dart';

//import 'package:http/http.dart' as http;

class NewComentarioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newcomentario = new NewComentario(id: '1');

    return Scaffold(
        appBar: AppBar(
          title: Text('registro'),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: [
              TextField(onChanged: (valor) => newcomentario.postId = valor),
              TextField(onChanged: (valor) => newcomentario.name = valor),
              TextField(onChanged: (valor) => newcomentario.email = valor),
              TextField(onChanged: (valor) => newcomentario.body = valor),
              ElevatedButton(
                onPressed: () async {
                  NewComentario comentar =
                      await registrar(newcomentario.toJson());
                  if (comentar != null) {
                    print('Guardado ');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CommentPage(comentar)));
                  } else {
                    print('Guardar');
                  }
                },
                child: Text('guardar'),
              )
            ],
          ),
        ));
  }

  Future<NewComentario> registrar(Map<String, dynamic> datos) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/comments');
    final response = await http.post(url, body: datos);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 201) {
      return newComentarioFromJson(response.body);
    } else {
      return null;
    }
  }
}
