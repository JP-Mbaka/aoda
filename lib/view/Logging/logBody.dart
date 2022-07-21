import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LogBody extends StatefulWidget {
  @override
  State<LogBody> createState() => _LogBodyState();
}

class _LogBodyState extends State<LogBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#0071f2'),
        foregroundColor: HexColor('#2f2e41'),
      ),
      body: Text('Sample'),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.abc_outlined),
            label: 'Data',
            backgroundColor: HexColor('#0071f2'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.abc_outlined),
            label: 'Data',
            backgroundColor: HexColor('#0071f2'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.abc_outlined),
            label: 'Data',
            backgroundColor: HexColor('#0071f2'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.abc_outlined),
            label: 'Data',
            backgroundColor: HexColor('#0071f2'),
          ),
        ],
        type: BottomNavigationBarType.shifting,
        selectedItemColor: HexColor('#2f2e41'),
        backgroundColor: HexColor('#0071f2'),
        iconSize: 40,
        elevation: 5,
      ),
    );
  }
}

// return Scaffold(  
//       appBar: AppBar(  
//         title: const Text('Flutter BottomNavigationBar Example'),  
//           backgroundColor: Colors.green  
//       ),  
//       body: Center(  
//         child: _widgetOptions.elementAt(_selectedIndex),  
//       ),  
//       bottomNavigationBar: BottomNavigationBar(  
//         items: const <BottomNavigationBarItem>[  
//           BottomNavigationBarItem(  
//             icon: Icon(Icons.home),  
//             title: Text('Home'),  
//             backgroundColor: Colors.green  
//           ),  
//           BottomNavigationBarItem(  
//             icon: Icon(Icons.search),  
//             title: Text('Search'),  
//             backgroundColor: Colors.yellow  
//           ),  
//           BottomNavigationBarItem(  
//             icon: Icon(Icons.person),  
//             title: Text('Profile'),  
//             backgroundColor: Colors.blue,  
//           ),  
//         ],  
//         type: BottomNavigationBarType.shifting,  
//         currentIndex: _selectedIndex,  
//         selectedItemColor: Colors.black,  
//         iconSize: 40,  
//         onTap: _onItemTapped,  
//         elevation: 5  
//       ),  