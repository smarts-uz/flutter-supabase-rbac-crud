import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CrudData {
  addData(String title, String desc, context) async {
    try {
      await Supabase.instance.client.from('notes').upsert(
          {'title': title, 'description': desc});
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Saved the Task'),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(

        content: Text('Error'),
        backgroundColor: Colors.red,
      ));
    }
    }
  }
