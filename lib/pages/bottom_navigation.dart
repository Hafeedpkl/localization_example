import 'package:flutter/material.dart';
import 'package:localization_example/pages/calender_screen.dart';
import 'package:localization_example/pages/home_page.dart';
import 'package:localization_example/pages/story_page.dart';
import 'package:localization_example/router/route_constants.dart';

import '../classes/language.dart';
import '../classes/language_constant.dart';
import '../main.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex = 0;
  final pages = const [
    StoryPage(),
    ArticlePage(),
    HomePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).homePage),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<Language>(
              underline: const SizedBox(),
              icon: const Icon(
                Icons.language,
                color: Colors.white,
              ),
              onChanged: (Language? language) async {
                if (language != null) {
                  Locale _locale = await setLocale(language.languageCode);
                  MyApp.setLocale(context, _locale);
                }
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                        value: e, child: Text(e.name)),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.shifting,
          showUnselectedLabels: true,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.menu_book_sharp,
                ),
                label: translation(context).fieldStory,
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.event,
                ),
                label: translation(context).fieldArticles,
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                icon: const Icon(
                  Icons.person,
                ),
                label: translation(context).fieldProfile,
                backgroundColor: Colors.purpleAccent),
          ]),
    );
  }
}
