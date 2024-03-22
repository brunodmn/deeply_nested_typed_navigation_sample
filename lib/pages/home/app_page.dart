import 'package:flutter/material.dart';
import '../../data/models/app.dart';
import '../../main.dart';

class AppPage extends StatefulWidget {
  final String id;
  const AppPage({super.key, required this.id});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  App? app;
  bool isLoading = false;

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    setState(() {
      isLoading = true;
    });
    apiRepo.getApp(widget.id).then((value) {
      setState(() {
        app = value;
        isLoading = false;
      });
    });
  }

  logout() async {
    setState(() {
      isLoading = true;
    });
    await authRepo.logout();
    if (context.mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget _loading() => const Center(child: CircularProgressIndicator());
  Widget _empty() => const Center(child: Text('App not ound'));
  Widget _success() => Column(
        children: [
          Text('ID: ${app!.id}'),
          Text('Name: ${app!.name}'),
          Text('Subscribers: ${app!.activeSubscribers}')
        ],
      );

  @override
  Widget build(BuildContext context) {
    return isLoading ? _loading() : (app == null ? _empty() : _success());
  }
}
