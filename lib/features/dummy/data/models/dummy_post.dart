class DummyPost {
  final int id;
  final String title;
  final String body;

  DummyPost({
    required this.id,
    required this.title,
    required this.body,
  });

  factory DummyPost.fromJson(Map<String, dynamic> json) {
    return DummyPost(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}
