import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final String label;
  const LoadingButton(
      {super.key, this.onPressed, this.isLoading = false, required this.label});

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
        icon: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: CircularProgressIndicator(),
                ),
              )
            : const SizedBox(),
        onPressed: isLoading ? null : onPressed,
        label: Text(label));
  }
}
