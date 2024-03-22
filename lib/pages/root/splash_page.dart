import 'package:flutter/material.dart';
import 'package:go_router_learn/routes/routes.dart';
import '../../data/models/app.dart';
import '../../main.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isLoading = false;
  List<App>? apps;
  String? selectedId;
  Future<void> _loading() async {
    setState(() {
      isLoading = true;
    });
    await apiRepo.getApps().then((value) {
      setState(() {
        apps = value;
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    _loading();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Choose Your App'),
                  Center(
                    child: DropdownMenu<String>(
                        onSelected: (value) {
                          setState(() {
                            selectedId = value;
                          });
                        },
                        dropdownMenuEntries: apps!
                            .map((e) =>
                                DropdownMenuEntry(value: e.id, label: e.name))
                            .toList()),
                  ),
                  FilledButton(
                      onPressed: () => selectedId == null
                          ? null
                          : AppRoute(selectedId!).go(context),
                      child: const Text('GO'))
                ],
              ));
  }
}
