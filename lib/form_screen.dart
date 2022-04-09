// ignore_for_file: deprecated_member_use

import 'package:crud_app/api.dart';
import 'package:flutter/material.dart';
import 'post.dart';
import 'repo.dart';
import 'main.dart';

class Formscreen extends StatefulWidget {
  const Formscreen({Key? key}) : super(key: key);

  @override
  State<Formscreen> createState() => _FormscreenState();
}

class _FormscreenState extends State<Formscreen> {
  final formkey = GlobalKey<FormState>();
  Api api = Api();
  Post p = Post();
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: const Text("Formscreen")),
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
                submit(p);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),
            SizedBox(height: height * 0.2),
            TextFormField(
              decoration: const InputDecoration(labelText: "Enter Title"),
              onChanged: (value) {
                p.settitle(value);
              },
            ),
            TextFormField(
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Enter Body'),
              onChanged: (value) {
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

  submit(post) {
    Repo.getPostList().insert(0, p);
    print(Repo.getPostList());
  }
}
