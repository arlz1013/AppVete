// ignore_for_file: must_be_immutable

import 'package:app_vete/view/home.dart';
import 'package:app_vete/view/notify.dart';
import 'package:app_vete/view/profile.dart';
import 'package:app_vete/view/search.dart';
import 'package:app_vete/view/space.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  late String data;
  RootPage({Key? key, required this.data}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Veter ${widget.data}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.search), label: "Search"),
          NavigationDestination(icon: Icon(Icons.space_bar), label: "Space"),
          NavigationDestination(
              icon: Icon(Icons.notifications_active), label: "Notify"),
          NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
      ),
      body: <Widget>[
        const Home(),
        const Search(),
        const Space(),
        const Notify(),
        const Profile()
      ][currentPageIndex],
    );
  }
}
