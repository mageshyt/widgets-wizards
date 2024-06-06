import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sliding_toast/flutter_sliding_toast.dart';
import 'package:otp_text_field/style.dart';
import 'package:shimmer/shimmer.dart';
import 'package:widgets_wigets/widgets/alertdialog/alertdialog.dart';
import 'package:widgets_wigets/widgets/badge/badge.dart';
import 'package:widgets_wigets/widgets/calender/calender.dart';
import 'package:widgets_wigets/widgets/card/cards.dart';
import 'package:widgets_wigets/widgets/carousal/carousal.dart';
import 'package:widgets_wigets/widgets/checkbox/checkbox.dart';
import 'package:widgets_wigets/widgets/loader/loader.dart';
import 'package:widgets_wigets/widgets/otpfield/otpfield.dart';
import 'package:widgets_wigets/widgets/pagination/paginatoin.dart';
import 'package:widgets_wigets/widgets/skelton/skeleton.dart';
import 'package:widgets_wigets/widgets/snackbar/snackbar.dart';
import 'package:widgets_wigets/widgets/switch/switch.dart';
import 'package:widgets_wigets/widgets/toast/toast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widgets')),
      body: Center(
        child: CustomSwitch(
          value: _switchValue,
          onChanged: (value) {
            setState(() {
              _switchValue = value;
            });
          },
          activeColor: Colors.green,
          inactiveColor: Colors.red,
          activeText: 'ON',
          inactiveText: 'OFF',
          showOnOff: true,
        ),
      ),
    );
  }
}
