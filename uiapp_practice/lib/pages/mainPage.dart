import 'package:flutter/material.dart';
import 'package:uiapp_practice/views/home.dart';
import 'package:uiapp_practice/views/message.dart';
import 'package:uiapp_practice/views/search.dart';
import 'package:uiapp_practice/views/settings.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selected = 0;
  PageController? pageController;
  @override
  void initState() {
    this.pageController = new PageController();
    super.initState();
  }

  @override
  void dispose() {
    this.pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('LOGO'),
        leading: Icon(Icons.menu),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add_alert))],
      ),
      body: PageView(
        controller: this.pageController,
        children: [
          Home(),
          Search(),
          Message(),
          Settings(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int i) {
          if (this.pageController == null) return;
          this.pageController!.jumpToPage(i);
          setState(() {
            this.selected = i;
          });
        },
        currentIndex: this.selected,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
      ),
    );
  }
}
