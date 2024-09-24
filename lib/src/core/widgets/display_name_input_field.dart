import 'package:flutter/material.dart';

class DisplayNameInputField extends StatelessWidget {
  const DisplayNameInputField(
      {super.key,
      required this.onChanged,
      required this.onSubmitted,
      this.inputAction = TextInputAction.done});
  final ValueChanged onChanged;
  final ValueChanged onSubmitted;
  final TextInputAction inputAction;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => onChanged(value),
      onSubmitted: (value) => onSubmitted(value),
      textInputAction: inputAction,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(10),
        prefixIcon: Icon(Icons.account_circle, size: 50, color: Colors.grey),
        hintText: 'Display name',
      ),
    );
  }
}
