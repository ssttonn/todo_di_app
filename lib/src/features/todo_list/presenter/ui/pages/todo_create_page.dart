import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/features/todo_list/presenter/bloc/todo_cubit.dart';
import 'package:todo_app/src/features/todo_list/presenter/bloc/todo_state.dart';
import 'package:todo_app/src/shared/widgets/spacing_column.dart';

class TodoCreatePage extends StatefulWidget {
  const TodoCreatePage({Key? key}) : super(key: key);

  @override
  State<TodoCreatePage> createState() => _TodoCreatePageState();
}

class _TodoCreatePageState extends State<TodoCreatePage> {
  final TextEditingController _textEditingController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<TodoCubit, TodoState>(
      listenWhen: (previous, current) {
        return previous.isAddingNewTodo != current.isAddingNewTodo;
      },
      listener: (BuildContext context, state) {
        if (!state.isAddingNewTodo) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
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
        body: _body(),
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
                BlocProvider.of<TodoCubit>(context)
                    .addNewTodo(_textEditingController.text);
              },
              child: Text("Save"))
        ],
      ),
    );
  }
}
