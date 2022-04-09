import 'package:flutter/material.dart';
import 'form_screen.dart';

import 'api.dart';
import 'post.dart';
import 'repo.dart';
import 'edit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'CRUD APP',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Api api = Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("CRUD"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Formscreen()),
                );
              },
              icon: const Icon(
                Icons.dehaze_outlined,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: api.get(),
                  builder: (context, AsyncSnapshot snapshot) {
                    return ListView.builder(
                      itemCount: Repo.getPostList().length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(Repo.getPostList()[index].gettitle()),
                          onLongPress: () => {
                            api.delete(index.toString()),
                            setState(() {
                              Repo.getPostList()
                                  .remove(Repo.getPostList()[index]);
                            })
                          },
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Editpage(
                                      Repo.getPostList()[index], index)),
                            )
                          },
                        );
                      },
                    );
                  }),
            )
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
    api.get().then((value) => {Repo.setPostList(value)});
  }
}
