// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:rove_so_remote/components/Drive.dart';
import 'package:rove_so_remote/components/Estop.dart';
import 'package:rove_so_remote/components/Lighting.dart';
import 'package:rove_so_remote/components/Autonomy.dart';
import 'package:rove_so_remote/components/Login.dart';
import 'package:rove_so_remote/components/HomePage.dart';
import 'RoveComm.dart';
import 'dart:developer' as developer;
import 'package:control_pad/control_pad.dart';

import 'components/Settings.dart';
import 'globals.dart' as globals;

void main() => runApp(RoveSoRemoteApp());

class RoveSoRemoteApp extends StatelessWidget {
  // touch RC_Node
  final rc = RC_Node;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RoveSoRemote',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Wrapper());
  }
}

class Wrapper extends StatefulWidget {

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    if(globals.isLoggedIn == globals.pass){
      return HomePage();
    }else{
      return LoginDemo();
    }
  }
}
