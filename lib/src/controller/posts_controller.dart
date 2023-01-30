class postsController {
  List? posts;
  bool? status;

  postsController({
    this.posts,
    this.status,
  });

  postsController.fromJson(Map<String, dynamic> json) {
    posts = json['posts'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['posts'] = posts;
    data['status'] = status;

    return data;
  }
}
