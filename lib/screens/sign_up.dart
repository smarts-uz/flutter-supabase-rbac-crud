import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'package:supabase_rbac/screens/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SupaEmailAuth(
            redirectTo: kIsWeb ? null : 'io.mydomain.myapp://callback',
            onSignInComplete: (response) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => const HomePage()));
            },
            onSignUpComplete: (response) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (ctx) => const HomePage()));
            },
            metadataFields: [
              MetaDataField(
                prefixIcon: const Icon(Icons.person),
                label: 'Username',
                key: 'username',
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Please enter something';
                  }
                  return null;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
