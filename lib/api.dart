import 'post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  String url = "https://jsonplaceholder.typicode.com/";
  Future<List<Post>> get() async {
    var response = await http.get(Uri.parse(url + 'posts'));
    var data = json.decode(response.body);
    List<Post> postList = [];
    for (var d in data) {
      Post p = Post();
      p.settitle(d['title']);
      p.setbody(d['body']);
      postList.add(p);
    }
    return postList;
  }

  Future<List<Post>> getById(id) async {
    print("function called");
    var response = await http.get(Uri.parse(url + 'posts/' + id));
    var data = jsonDecode(response.body);
    List<Post> postList = [];
    for (Map i in data) {
      Post p = Post();
      p.settitle(data['title']);
      p.setbody(data['body']);
      postList.add(p);
    }
    return postList;
  }

  delete(String id) async {
    var response = await http.delete(Uri.parse(url + 'posts/' + id));
    print(response.body);
  }

  Future<Post> add(Post post) async {
    var response = await http.post(
      Uri.parse(url + 'posts'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': post.gettitle(),
        'body': post.getbody(),
        'userId': '1'
      }),
    );
    var data = jsonDecode(response.body);
    Post p = new Post();
    p.settitle(data['title']);
    p.setbody(data['body']);
    p.setuserId(data['userId']);
    p.setid(data['id']);
    return p;
  }

  update(post, id) async {
    var response = await http.put(
      Uri.parse(url + 'posts/' + id),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': '1',
        'body': 'test',
        'userId': '1',
        'id': id
      }),
    );
  }
}
