import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/features/todo_list/presenter/ui/pages/create_new_todo_page.dart';
import 'package:todo_app/src/features/todo_list/presenter/ui/pages/all_todos_page.dart';
import 'package:todo_app/src/features/todo_list/presenter/ui/pages/favorite_todos_page.dart';

import '../../blocs/todo_list/todo_list_bloc.dart';
import '../../blocs/todo_list/todo_list_event.dart';

class TodoMainPage extends StatefulWidget {
  const TodoMainPage({Key? key}) : super(key: key);

  @override
  State<TodoMainPage> createState() => _TodoMainPageState();
}

class _TodoMainPageState extends State<TodoMainPage> {
  List<Widget> _pages = [HomeNavigator(), FavoriteTodosPage()];
  int _selectedTab = 0;

  Widget get selectedPage => _pages[_selectedTab];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<TodoListBloc>(context).add(FetchAllTodos());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
          children: [..._pages.map((page) => page)], index: _selectedTab),
      bottomNavigationBar: BottomNavigationBar(
          onTap: ((index) {
            setState(() {
              _selectedTab = index;
            });
          }),
          currentIndex: _selectedTab,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorite"),
          ]),
    );
  }
}

class HomeNavigator extends StatefulWidget {
  const HomeNavigator({Key? key}) : super(key: key);

  @override
  State<HomeNavigator> createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  GlobalKey<NavigatorState> _homeNavigatorKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _homeNavigatorKey,
      onGenerateRoute: ((settings) {
        late Widget page;
        if (settings.name == "/") {
          page = AllTodosPage();
        } else if (settings.name == "/create") {
          page = CreateNewTodoPage();
        } else {
          page = Container();
        }
        return MaterialPageRoute(builder: (context) => page);
      }),
    );
  }
}
