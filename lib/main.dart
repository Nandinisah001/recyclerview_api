import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recyclerview_api/infiniteScrollingImages/provider/infinite_provider_class.dart';
import 'package:recyclerview_api/infiniteScrollingImages/screens/infinite_scrolling_page.dart';
import 'package:recyclerview_api/screens/home_screen.dart';

void main() {
  runApp(
      ChangeNotifierProvider(create: (_) => InfiniteScrollProvider(),
      child: const MyApp()),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: InfiniteScrollingPage(),
    );
  }
}