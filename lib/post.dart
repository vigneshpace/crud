class Post {
  late int userId;
  late int id;
  late String title = '';
  late String body = '';

  void setuserId(int userId) {
    this.userId = userId;
  }

  void setid(int id) {
    this.id = id;
  }

  void settitle(String title) {
    this.title = title;
  }

  void setbody(String body) {
    this.body = body;
  }

  int getuserId() {
    return userId;
  }

  int getid() {
    return id;
  }

  String gettitle() {
    return title;
  }

  String getbody() {
    return body;
  }

  @override
  String toString() {
    return "title:" + title + ",body:" + body;
  }
}
