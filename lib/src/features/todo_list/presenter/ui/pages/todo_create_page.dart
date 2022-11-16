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
      body: BlocListener<TodoCubit, TodoState>(
          listener: (context, state) {
            if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: Duration(seconds: 1),
                  backgroundColor: Colors.redAccent,
                  content: Text(state.errorMessage!)));
            }
          },
          child: _body()),
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
                BlocProvider.of<TodoCubit>(context)
                    .addNewTodo(_textEditingController.text)
                    .then((result) {
                  if (result) {
                    if (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();
                    }
                  }
                });
              },
              child: Text("Save"))
        ],
      ),
    );
  }
}
