import 'post.dart';

class Repo {
  static List<Post> list = [];
  static getPostList() {
    return list;
  }

  static setPostList(List<Post> post) {
    list = post;
  }
}
