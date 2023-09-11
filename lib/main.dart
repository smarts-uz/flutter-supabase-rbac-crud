import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_rbac/home_page.dart';
import 'package:supabase_rbac/sign_up.dart';
import 'package:supabase_rbac/splashscren.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://izqjpmoeaelmziyjkixe.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Iml6cWpwbW9lYWVsbXppeWpraXhlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTQ0MzE2MzAsImV4cCI6MjAxMDAwNzYzMH0.yeStxGVEFrp51OlYhHfvu-x7BgDLjSIjv17LynkYrvY',
  );
  runApp(MyApp());
}



final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supabase Flutter',
           initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (_) => const SplashPage(),
        '/login': (_) => const LoginPage(),
        '/account': (_) => const HomePage(),
      },
    );
  }
}