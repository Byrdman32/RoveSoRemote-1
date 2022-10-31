import 'package:flutter/material.dart';
import 'package:rove_so_remote/components/Drive.dart';
import 'package:rove_so_remote/components/Estop.dart';
import 'package:rove_so_remote/components/Lighting.dart';
import 'package:rove_so_remote/components/Autonomy.dart';
import 'package:rove_so_remote/components/Login.dart';
import '../RoveComm.dart';
import 'dart:developer' as developer;
import 'package:control_pad/control_pad.dart';

import 'Settings.dart';
import '../globals.dart' as globals;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _HomePageState() {
    // Load the RC manifest
    loadManifest();

    _widgetOptions = <Widget>[
      LightingView(),
      DriveView(),
      EStopView(),
      AutonomyView(),
    ];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RoveSoRemote"),
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsView()))),
        ],
        toolbarHeight: 50,
      ),
      body: Center(
        child: Column(
          children: [_widgetOptions.elementAt(_selectedIndex)],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.lightbulb), label: 'Lighting'),
          BottomNavigationBarItem(
              icon: Icon(Icons.two_wheeler), label: 'Driving'),
          BottomNavigationBarItem(icon: Icon(Icons.stop), label: 'Estop'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_taxi), label: 'Autonomy'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}