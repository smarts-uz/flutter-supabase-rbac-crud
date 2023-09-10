import 'package:flutter/material.dart';
import 'package:supabase_rbac/crud.dart';

class UpdateData extends StatefulWidget {
  const UpdateData({super.key, required this.title, required this.desc});

  final String title;
  final String desc;

  @override
  State<UpdateData> createState() => _UpdateDateState();
}

class _UpdateDateState extends State<UpdateData> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _desc = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _title.text = widget.title;
    _desc.text = widget.desc;
    super.initState();
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
              controller: _title,
              decoration: const InputDecoration(label: Text('Title')),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _desc,
              decoration: const InputDecoration(label: Text('Description')),
            ),
            const SizedBox(height: 50),
            TextButton(
              onPressed: () {
                CrudData().updateDate(_title.text, _desc.text);
                setState(() {});
                Navigator.pop(context);
              },
              child: const Text('Update Data'),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
