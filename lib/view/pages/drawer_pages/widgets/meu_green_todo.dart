import 'package:flutter/material.dart';

import '../../../../constants/pages_models/Todo.dart';
import '../../../../model/repository/todo_repository.dart';
import '../../../../widgets/todo_list_item.dart';

class MeuGreenTodo extends StatefulWidget {
  MeuGreenTodo({Key? key}) : super(key: key);

  @override
  State<MeuGreenTodo> createState() => _MeuGreenTodoState();
}

class _MeuGreenTodoState extends State<MeuGreenTodo> {
  final TextEditingController textController = TextEditingController();
  final TodoRepository todoRepository = TodoRepository();

  List<Todo> todos = [];
  Todo? deletedTodo; //=> retorna o objeto deletado
  int? deletedTodoPos; //=>retorna a posição do objeto deletado
  late String errorText;

  @override
  void initState() {
    super.initState();
    todoRepository.getTodoList().then((value) {
      setState(() {
        todos = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(elevation: 0, backgroundColor: Colors.green),
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5000),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextBar(),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: textController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Adicione uma Tarefa',
                            hintText: 'Ex.: Paga o Cartão.'
                            //errorText: errorText,
                            ),
                      ),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        String text = textController.text;
                        setState(() {
                          Todo newTodo = Todo(
                            title: text,
                            dateTime: DateTime.now(),
                          );
                          todos.add(newTodo);
                        });
                        textController.clear();
                        todoRepository.saveTodoList(todos);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Flexible(
                  //listasv
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      for (Todo todo in todos)
                        TodoListItem(
                          todo: todo,
                          onDelet: onDelet,
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    Expanded(
                      child:
                          Text('Você possui ${todos.length} Tarefas pendentes'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: showDeleteTodosConfirmationDialog,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.all(14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('Limpar tudo'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onDelet(Todo todo) {
    deletedTodo = todo; // =>retornando o objeto deletado para a lista
    deletedTodoPos =
        todos.indexOf(todo); //=> retornando o objeto deletado para  a posição
    setState(() {
      todos.remove(todo);
    });
    todoRepository.saveTodoList(todos);

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      // => retorna mensagem para o  usuario
      SnackBar(
        content: Text(
          'Tarefa ${todo.title} foi removida com sucesso!',
        ),
        backgroundColor: Colors.green,
        action: SnackBarAction(
          label: 'Desfazer',
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              todos.insert(
                  deletedTodoPos!, deletedTodo!); //=>elementos  inserção
            });
            todoRepository.saveTodoList(todos);
          },
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void showDeleteTodosConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Limpar Tudo?'),
        content: Text('Você tem certeza  que deseja apagar todas as tarefas?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                  backgroundColor: Colors.green, foregroundColor: Colors.white),
              child: Text('Cancelar')),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                deletallTodos();
              },
              style: TextButton.styleFrom(
                  backgroundColor: Colors.red, foregroundColor: Colors.white),
              child: Text('Excluir')),
        ],
      ),
    );
  }

  void deletallTodos() {
    setState(() {
      todos.clear();
      todoRepository.saveTodoList(todos);
    });
  }
}

class TextBar extends StatelessWidget {
  const TextBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // entrar com a logica no lugar do texto
            Text('  Lista de Tarefas',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  height: 0.9,
                )),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
