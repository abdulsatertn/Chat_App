import 'package:chat_app_second/views/chat_page.dart';
import 'package:chat_app_second/views/cubits/login_cubit/login_cubit.dart';
import 'package:chat_app_second/views/login_view.dart';
import 'package:chat_app_second/views/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: MaterialApp(
        routes: {
          LoginView.id: (context) => LoginView(),
          RegisterPage.id: (context) => RegisterPage(),
          ChatPage.id: (context) => ChatPage(),
        },
        debugShowCheckedModeBanner: false,
        initialRoute: LoginView.id,
      ),
    );
  }
}
