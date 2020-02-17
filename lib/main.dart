import 'package:flutter/material.dart';

import 'OnBoarding.dart';

main(){
  runApp(newsApp());
}

class newsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoarding()
    );
  }
}
