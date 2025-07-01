import 'package:flipshelf/main_page.dart';
import 'package:flipshelf/pages/book_page/book_page.dart';
import 'package:flipshelf/pages/login/login_page.dart';
import 'package:flipshelf/pages/read_book/book_reader.dart';
import 'package:flipshelf/pages/signup/signup_page.dart';
import 'package:flipshelf/pages/welcome/welcome_page.dart';
import 'package:flipshelf/services/favorite_provider.dart';
import 'package:flipshelf/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flipshelf/theme/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flipshelf',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeProvider.isDarkMode
              ? ThemeMode.dark
              : ThemeMode.light,
          home: WelcomePage(),

          routes: {
            '/welcome': (context) => const WelcomePage(),
            '/login': (context) => const LoginPage(),
            '/signup': (context) => const SignupPage(),
            '/main': (context) => const MainPage(),
            '/book_view': (context) => const BookPage(),
            '/book_reader': (context) => const BookReader(),
          },
        );
      },
    );
  }
}
