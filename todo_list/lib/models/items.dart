class Items {

  final String? title;
  bool isDone;

  Items({this.title, this.isDone = false});

  void toggleStatus() {
    isDone = !isDone;
  }


  Items.fromMap(Map<String, dynamic> map)
      : title = map["title"],
        isDone = map["isDone"];
  Map<String, dynamic> toMap() => {"title":title, "isDone":isDone};

}