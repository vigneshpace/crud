import 'package:crud_app/api.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'post.dart';
import 'repo.dart';

class Editpage extends StatefulWidget {
  Post post = new Post();
  int index = -1;
  Editpage(this.post, this.index);

  @override
  State<Editpage> createState() =>
      _EditState(post.gettitle(), post.getbody(), index);
}

class _EditState extends State<Editpage> {
  String title = '';
  String body = '';
  Post p = new Post();
  Api api = new Api();
  int index = -1;
  _EditState(this.title, this.body, this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit page")),
      body: Container(
        padding: const EdgeInsets.all(25),
        margin: EdgeInsets.only(bottom: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: const Text(
                'submit',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                ),
              ),
              onPressed: () {
                api.update(p, index.toString());
                Repo.getPostList()[index] = p;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
            SizedBox(),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Enter title'),
              initialValue: '' + title,
              onChanged: (value) {
                title = value;
                p.settitle(title);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Enter Body'),
              initialValue: '' + body,
              onChanged: (value) {
                body = value;
                p.setbody(value);
              },
              textInputAction: TextInputAction.newline,
              keyboardType: TextInputType.multiline,
              maxLines: 8,
            ),
          ],
        ),
      ),
    );
  }
}
