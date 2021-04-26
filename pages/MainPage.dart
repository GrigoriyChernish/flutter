import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  static List<Widget> _widgetForms = <Widget>[
    Container(
      color: Colors.blueGrey,
    ),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.amber,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nav Bar")),
      body: SizedBox.expand(
        child: PageView(
          scrollDirection: Axis.vertical,
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _selectedIndex = index);
          },
          children: _widgetForms,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              title: Text('Item One'), icon: Icon(Icons.home)),
          BottomNavigationBarItem(
            title: Text('Item One'),
            icon: Icon(Icons.apps),
            backgroundColor: Colors.lightBlue,
          ),
          BottomNavigationBarItem(
            title: Text('Item One'),
            icon: Icon(Icons.chat_bubble),
            backgroundColor: Colors.lightBlue,
          ),
          BottomNavigationBarItem(
            title: Text('Item One'),
            icon: Icon(Icons.settings),
            backgroundColor: Colors.lightBlue,
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    });
  }
}
