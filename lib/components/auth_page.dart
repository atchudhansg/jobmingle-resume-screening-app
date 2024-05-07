import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:myapp/components/login_or_register_page.dart";
import "package:myapp/pages/home_page.dart";

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              //user has logged in
              if (snapshot.hasData) {
                return RecruiterHomePage();
              } else {
                return LoginOrRegisterPage();
              }
            }));
  }
}
