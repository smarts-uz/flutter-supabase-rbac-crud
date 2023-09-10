import 'package:flutter/material.dart';
import 'package:supabase_rbac/crud.dart';

class InsertData extends StatefulWidget {
  const InsertData({
    super.key,
  });

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {
  final TextEditingController title = TextEditingController();
  final TextEditingController desc = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    title.dispose();
    desc.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert data'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: title,
              onChanged: (title) {
                title = title;
              },
              decoration: const InputDecoration(label: Text('Title')),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: desc,
              onChanged: (desc) {
                desc = desc;
              },
              decoration: const InputDecoration(label: Text('Description')),
            ),
            const SizedBox(height: 50),
            TextButton(
              onPressed: () {
                CrudData().addData(title.text, desc.text, context);
                setState(() {});
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
