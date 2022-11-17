import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/features/todo_list/presenter/ui/views/all_todos_view.dart';
import 'package:todo_app/src/features/todo_list/presenter/ui/views/favorite_todos_view.dart';

import '../../blocs/todo_list/todo_list_bloc.dart';
import '../../blocs/todo_list/todo_list_event.dart';

class TodoMainPage extends StatefulWidget {
  const TodoMainPage({Key? key}) : super(key: key);

  @override
  State<TodoMainPage> createState() => _TodoMainPageState();
}

class _TodoMainPageState extends State<TodoMainPage> {
  List<TodoBaseView> _views = [AllTodosView(), FavoriteTodosView()];
  int selectedTab = 0;

  TodoBaseView get selectedView => _views[selectedTab];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<TodoListBloc>(context)
        ..add(FetchAllTodos())
        ..add(ListenToAllTodosChanged());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: selectedView.buildAppBar(context),
      body: IndexedStack(
          children: [..._views.map((view) => view.buildBody(context))],
          index: selectedTab),
      floatingActionButton: selectedView.buildFloatingButtonAction(context),
      bottomNavigationBar: BottomNavigationBar(
          onTap: ((index) {
            setState(() {
              selectedTab = index;
            });
          }),
          currentIndex: selectedTab,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorite"),
          ]),
    );
  }
}

abstract class TodoBaseView {
  AppBar buildAppBar(BuildContext context);

  Widget buildBody(BuildContext context);

  FloatingActionButton? buildFloatingButtonAction(BuildContext context) {
    return null;
  }
}
