import 'package:flutter/material.dart';
import '../../data/global_widgets/loading_button.dart';
import '../../main.dart';
import '../../data/models/user.dart';

class ProfilePage extends StatefulWidget {
  final User user;
  const ProfilePage({super.key, required this.user});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLoading = false;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              LoadingButton(
                onPressed: () => logout(),
                label: 'logout',
                isLoading: isLoading,
              ),
              const Text('ProfilePage'),
              Text('id: ${widget.user.id}'),
              Text('name: ${widget.user.name}'),
              Text('age: ${widget.user.age}'),
            ],
          ),
        ));
  }
}
