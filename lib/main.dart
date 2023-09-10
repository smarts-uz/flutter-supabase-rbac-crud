import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_rbac/crud.dart';
import 'package:supabase_rbac/insert.dart';
import 'package:supabase_rbac/udpate.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://rdmythxwzdcbqhaheafv.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJkbXl0aHh3emRjYnFoYWhlYWZ2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODg3MDk0NjgsImV4cCI6MjAwNDI4NTQ2OH0.91F6sZT_9Oz0ajk8JgA8cwV90Rw7cSp_SSDvR62qbM8',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'supabase rbac',
      home: HomePage(),
    );
  }
}

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
        title: const Text('Supabase rbac'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const InsertData(),
                ),
              );
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
          print('data: ${snapshot.data!}');
          final notes = snapshot.data!;
          print('notes list: $notes');
          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: ((context, index) {
              final note = notes[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => UpdateData(
                        title: note['title'],
                        desc: note['description'],
                      ),
                    ),
                  );
                },
                child: ListTile(
                  title: Text(note['title']),
                  subtitle: Text(note['description']),
                  trailing: IconButton(
                    onPressed: () {
                      crudData.deleteData(notes[index]['id']);
                      setState(() {});
                    },
                    icon: const Icon(Icons.delete, color: Colors.red),
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
