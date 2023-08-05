import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_dbms/Bloc/contact_bloc.dart';
import 'package:hive_dbms/Bloc/contact_state.dart';
import 'package:hive_dbms/Widgets/App%20Bar/custom_appbar.dart';
import 'package:hive_dbms/Widgets/method.dart';
import 'package:hive_dbms/Widgets/tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () => Methods.openBottomSheet(context),
        child: const Icon(
          Icons.add,
          color: Color(0xFF5AC8FA),
          size: 35,
        ),
      ),
      body: Stack(
        children: [
          BlocBuilder<ContactBloc, ContactState>(
            builder: (context, state) {
              if (state is ContactInitialState) {
                return ListView.separated(
                    padding: const EdgeInsets.only(top: 160),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => CustomTile(
                        index: index,
                        contactKey: state.contacts[index]['key'],
                        titleText: state.contacts[index]['name'],
                        subTitleText: state.contacts[index]['contact']),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 5),
                    itemCount: state.contacts.length);
              } else if (state is ContactViewState) {
                return ListView.separated(
                    padding: const EdgeInsets.only(top: 160),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => CustomTile(
                        index: index,
                        contactKey: state.contacts[index]['key'],
                        titleText: state.contacts[index]['name'],
                        subTitleText: state.contacts[index]['contact']),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 5),
                    itemCount: state.contacts.length);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
          CustomAppBar(appBarHeight: 160, screenWidth: width),
        ],
      ),
    );
  }
}
