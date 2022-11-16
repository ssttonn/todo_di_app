class TodoModel {
  final int id;
  final String title;
  bool isFavorite;

  TodoModel({required this.id, required this.title, this.isFavorite = false});
}
