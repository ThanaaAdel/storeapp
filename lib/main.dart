import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:storeapp/features/home_view/presentaion/views/home_view.dart';
import 'features/home_view/presentaion/views/widgets/post_page.dart';
import 'features/home_view/presentaion/views/widgets/update_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
      routes: {
        '/': (context) => const HomeView(),
        '/updatePage': (context) => const UpDatePage(),
        '/postPage': (context) => const PostPage(),
      },

    );
  }
}
