import 'package:flutter/material.dart';
import 'package:ulearing/common/widgets/%20base_text.dart';

AppBar buildAppBarSettings() {
  return AppBar(
    title: Container(
      child: Container(
        child: baseText("Settings"),
      ),
    ),
  );
}
