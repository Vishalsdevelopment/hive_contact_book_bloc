import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_dbms/Bloc/contact_bloc.dart';
import 'package:hive_dbms/Bloc/contact_event.dart';

import 'method.dart';

class CustomTile extends StatelessWidget {
  final int index;
  final String? titleText;
  final String? subTitleText;
  final int contactKey;

  const CustomTile({
    super.key,
    required this.index,
    required this.contactKey,
    this.titleText,
    this.subTitleText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: const Color(0xFF5AC8FA),
      child: ListTile(
        title: Text(titleText ?? ''),
        subtitle: Text(subTitleText ?? ''),
        trailing: PopupMenuButton(
          onSelected: (value) => Methods.openBottomSheet(context,
              isUpdate: true,
              key: contactKey,
              index: index,
              name: titleText ?? '',
              contact: subTitleText ?? ''),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'update',
              child: Text('Update'),
            ),
            PopupMenuItem(
                child: const Text('Delete'),
                onTap: () => BlocProvider.of<ContactBloc>(context)
                    .add(ContactDeleteEvent(key: contactKey))),
          ],
        ),
      ),
    );
  }
}
