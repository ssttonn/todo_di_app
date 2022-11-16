class TodoModel {
  final String id;
  final String title;
  bool isFavorite;

  TodoModel({required this.id, required this.title, this.isFavorite = false});
}
