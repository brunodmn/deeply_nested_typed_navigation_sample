import 'package:flutter/material.dart';
import '../../data/global_widgets/loading_button.dart';
import '../../main.dart';
import '../../data/models/user.dart';

class ProfilePage extends StatefulWidget {
  final User? user;
  const ProfilePage({super.key, this.user});

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

  Widget _success(User user) => Column(
        children: [
          LoadingButton(
            onPressed: () => logout(),
            label: 'logout',
            isLoading: isLoading,
          ),
          const Text('ProfilePage'),
          Text('id: ${user.id}'),
          Text('name: ${user.name}'),
          Text('age: ${user.age}'),
        ],
      );
  Widget _empty() => const Center(child: Text('User not found'));
  @override
  Widget build(BuildContext context) {
    return widget.user != null ? _success(widget.user!) : _empty();
  }
}
