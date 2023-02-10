import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wether_01/Screen/View/Wethar_page.dart';

import 'Screen/provider/Wethar_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WetherProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => Wethar_page(),
        },
      ),
    ),
  );
}
