import 'package:flutter/material.dart';
import 'package:uiapp/pages/views/home.dart';
import 'package:uiapp/pages/views/message.dart';
import 'package:uiapp/pages/views/person.dart';
import 'package:uiapp/pages/views/search.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selected = 0;
  PageController? pageController;

  @override
  void initState() {
    this.pageController = PageController();
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
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add_alert)),
        ],
      ),
      body: PageView(
        controller: this.pageController,
        children: [
          Home(),
          Search(),
          Message(),
          Person(),
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
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}
