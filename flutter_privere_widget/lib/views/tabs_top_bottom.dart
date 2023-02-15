import 'package:flutter/material.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> with TickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: TabView.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: TabView.values.length,
      child: Scaffold(
        extendBody: true,
        floatingActionButton: FloatingActionButton(onPressed: () {}),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const BottomAppBar(
          notchMargin: 10,
          shape: CircularNotchedRectangle(),
          child: TabBar(
            labelColor: Colors.red,
            tabs: [
              Tab(text: "Ana Sayfa"),
              Tab(text: "Ayarlar"),
            ],
          ),
        ),
        appBar: AppBar(
          bottom: TabBar(
            tabs: TabView.values.map((e) => Tab(text: e.name)).toList(),
          ),
        ),
        body: TabBarView(
          children: [
            Container(color: Colors.red),
            Container(color: Colors.green),
          ],
        ),
      ),
    );
  }
}

enum TabView { home, settings }

extension TabViewExtension on TabView {}
