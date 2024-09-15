import 'package:aisai_app/view/event/event_list_screen.dart';
import 'package:aisai_app/view/mypage/viewmodel/my_profile_screen_viewmodel.dart';
import 'package:aisai_app/view/user/user_list_screen.dart';
import 'package:aisai_app/view/mypage/my_profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // 表示する画面のリスト
  static final List<Widget> _widgetOptions = <Widget>[
    UserListScreen(title: 'User List'),
    const EventListScreen(),
    MyProfileScreen(
      viewModel: MyProfileScreenViewModel(
        userName: 'まっちゃん',
        userAge: 29,
        userLocation: '鹿児島県',
        userOccupation: 'Engineer',
        eventName: '琉球ランタンフェスティバル',
        eventDate: '2024-12-1~3-31',
        eventLocation: '沖縄県 読谷村',
      ),
      userName: 'まっちゃん',
        userAge: 29,
        userLocation: '鹿児島県',
        userOccupation: 'Engineer',
        eventName: '琉球ランタンフェスティバル',
        eventDate: '2024-12-1~3-31',
        eventLocation: '沖縄県 読谷村',
    ), // Add MyProfileScreen to the list
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aisai'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'User List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Event List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}
