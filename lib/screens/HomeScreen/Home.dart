import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:invmovieconcept1/configs/AppDimensions.dart';
import 'package:invmovieconcept1/configs/App.dart';

import 'package:invmovieconcept1/configs/Theme.dart' as theme;
import 'package:invmovieconcept1/configs/TextStyles.dart';
import 'package:invmovieconcept1/widgets/Screen/Screen.dart';

import 'messages/keys.dart';
import 'data.dart' as data;
import 'Dimensions.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Screen(
      Dimensions.init,
      scaffoldBackgroundColor: Colors.white,
      builder: (_) => SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Center(
              child: Container(
                color: Colors.red,
                width: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: AppDimensions.maxContainerWidth,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.padding * 2,
                  vertical: AppDimensions.padding,
                ),
                child: Text("WOW"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
