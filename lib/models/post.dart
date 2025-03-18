import 'package:ecomanga/models/models.dart';

class Post {
  const Post({
    required this.slug,
    required this.title,
    required this.description,
    required this.content,
    this.image,
    required this.author,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  final String slug, title, description, content;
  final String? image;
  final User author;
  final String id;
  final DateTime createdAt, updatedAt;

  Map<String, dynamic> toMap() {
    return {
      'slug': slug,
      'title': title,
      'description': description,
      'content': content,
      'image': image,
      'author': author.toJson(),
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      slug: json['slug'],
      title: json['title'],
      description: json['description'],
      content: json['content'],
      image: json['image'],
      author: json['author'],
      id: json['id'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
