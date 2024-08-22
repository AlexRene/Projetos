import 'package:crud/controllers/add.dart';
import 'package:crud/models/user.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddUsers extends StatefulWidget {
  const AddUsers({super.key});

  @override
  State<AddUsers> createState() => _AddUsersState();
}

class _AddUsersState extends State<AddUsers> {
  final controllerDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: controllerName,
            decoration: const InputDecoration(
                hintText: 'Name',
                prefixIcon: Icon(Icons.person),
                filled: true,
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue))),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: controllerAge,
            decoration: const InputDecoration(
                hintText: 'Age',
                filled: true,
                prefixIcon: Icon(Icons.numbers),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue))),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 24),
          TextField(
            controller: controllerDate,
            decoration: const InputDecoration(
              labelText: 'DATE',
              filled: true,
              prefixIcon: Icon(Icons.calendar_today),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
            readOnly: true,
            onTap: () {
              selectDate();
            },
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              final user = User(
                name: controllerName.text,
                age: int.parse(controllerAge.text),
                birthday: DateTime.parse(controllerDate.text),
              );

              createUser(user);
              reset();
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: const Text('Usuário cadastrado com sucesso!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Fechar'),
                        ),
                      ],
                    );
                  });
            },
            child: const Text('Add'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => context.go('/lista'),
            child: const Text('Users'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => context.go('/update'),
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }

  Future<void> selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1980),
        lastDate: DateTime(2100));

    if (picked != null) {
      controllerDate.text = picked.toString().split(" ")[0];
    }
  }

  void reset() {
    controllerName.clear();
    controllerAge.clear();
    controllerDate.clear();
  }
}
