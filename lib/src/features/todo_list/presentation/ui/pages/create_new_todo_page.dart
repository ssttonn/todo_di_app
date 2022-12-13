import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/src/shared/widgets/spacing_column.dart';

import '../../blocs/todo_list/todo_list_bloc.dart';
import '../../blocs/todo_list/todo_list_event.dart';
import '../../blocs/todo_list/todo_list_state.dart';

class CreateNewTodoPage extends StatefulWidget {
  const CreateNewTodoPage({Key? key}) : super(key: key);

  @override
  State<CreateNewTodoPage> createState() => _CreateNewTodoPageState();
}

class _CreateNewTodoPageState extends State<CreateNewTodoPage> {
  final TextEditingController _textEditingController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Todo"),
        centerTitle: true,
        leading: CupertinoButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            padding: EdgeInsets.zero,
            child: Icon(Icons.arrow_back_ios, color: Colors.white)),
      ),
      body: FutureBuilder(
        future: getIt.allReady(),
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return BlocListener<TodoListBloc, TodoListState>(
                listenWhen: ((previousState, currentState) {
                  return currentState.state == TodoState.newTodoAdded;
                }),
                listener: (context, state) {
                  if (state.state == TodoState.newTodoAdded) {
                    Navigator.of(context).pop();
                  }
                },
                child: _body());
          return Container();
        },
      ),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SpacingColumn(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Form(
            key: _key,
            child: TextFormField(
              controller: _textEditingController,
              validator: (value) {
                if (value?.isEmpty ?? false) {
                  return "Enter todo title here";
                }
                return null;
              },
              decoration: InputDecoration(hintText: "Title"),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (!_key.currentState!.validate()) return;
                FocusManager.instance.primaryFocus?.unfocus();
                BlocProvider.of<TodoListBloc>(context)
                    .add(AddNewTodo(newTodoTitle: _textEditingController.text));
              },
              child: Text("Save"))
        ],
      ),
    );
  }
}
