import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_dbms/Bloc/contact_bloc.dart';
import 'package:hive_dbms/Bloc/contact_event.dart';

class SearchingContact extends StatelessWidget {
  const SearchingContact({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.bottom,
      onChanged: (value) => BlocProvider.of<ContactBloc>(context)
          .add(ContactSearchEvent(value: value)),
      decoration: const InputDecoration(
          fillColor: Color(0xFFEFEFF4),
          filled: true,
          hintText: 'Search Name or Contact',
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFE5E5EA))),
          border: OutlineInputBorder()),
    );
  }
}

class InputData extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;

  const InputData({super.key, required this.controller, this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          border: const OutlineInputBorder(), label: Text(labelText!)),
    );
  }
}
