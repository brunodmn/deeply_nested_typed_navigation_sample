import 'package:flutter/material.dart';
import '../data/global_widgets/loading_button.dart';
import '../main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  login() async {
    setState(() {
      isLoading = true;
    });
    await authRepo.login();
    if (context.mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              Text('LoginPage'),
              LoadingButton(
                onPressed: () => login(),
                label: 'login',
                isLoading: isLoading,
              )
            ],
          ),
        ));
  }
}
