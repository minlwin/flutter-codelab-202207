import 'package:flutter/material.dart';
import 'package:jpwords/model/states/page.state.dart';
import 'package:jpwords/views/books.view.dart';
import 'package:jpwords/views/home.view.dart';
import 'package:provider/provider.dart';

class JapaneseWordsApplication extends StatelessWidget {
  const JapaneseWordsApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PageState(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomeView.route: (context) => const HomeView(),
          BookListView.route: (context) => const BookListView(),
        },
        initialRoute: HomeView.route,
      ),
    );
  }
}
