import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wishlist_app/views/home_page.dart';
import 'package:wishlist_app/provider/bookmark_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BookmarkBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Wishlist App",
      home: HomePage(),
    );
  }
}
