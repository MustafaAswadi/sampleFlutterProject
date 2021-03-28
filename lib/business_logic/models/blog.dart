class Blog {
  final int id;
  final String title;
  final String createdAt;
  final String imageUrl;

  Blog({this.createdAt, this.imageUrl, this.title, this.id});

  factory Blog.fromJson(Map<String, dynamic> map) {
    return Blog(
      createdAt: map['createdAt'] as String,
      imageUrl: map['imageUrl'],
      title: map['title'],
      id: int.parse(map['id']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'title': title,
      'createdAt': createdAt
    };
  }
}
