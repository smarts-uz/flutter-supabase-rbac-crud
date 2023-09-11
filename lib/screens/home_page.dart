import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_rbac/crud.dart';
import 'package:supabase_rbac/screens/insert.dart';
import 'package:supabase_rbac/screens/udpate.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _future = Supabase.instance.client
      .from('notes')
      .select<List<Map<String, dynamic>>>();

  late CrudData crudData = CrudData();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Supabase Crud Auth'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(
                MaterialPageRoute(
                  builder: (ctx) => const InsertData(),
                ),
              )
                  .then((value) {
                if (value ?? false) {
                  setState(() {
                    _future;
                  });
                }
              });
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          // print('data: ${snapshot.data!}');
          final notes = snapshot.data!;
          print('notes list: $notes');
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: ((context, index) {
              final note = notes[index];
              print(note);
              return ListTile(
                title: Text(note['title']),
                subtitle: Text(note['description']),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) =>
                                UpdateData(
                                  title: note['title'],
                                  desc: note['description'],
                                ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit, color: Colors.yellow),
                    ),
                    IconButton(
                      onPressed: () {
                        crudData.deleteData(notes[index]['id']);
                        setState(() {});
                      },
                      icon: const Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
