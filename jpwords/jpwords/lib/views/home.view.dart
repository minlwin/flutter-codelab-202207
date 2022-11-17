import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  static const route = "/home";
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 8, right: 8, top: 64, bottom: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "JP WORDS",
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              "日本語語彙",
              style: Theme.of(context).textTheme.headline5,
            ),
            Image.asset(
              "images/sakura.png",
              width: 200,
            ),
            const SizedBox(
              height: 16,
            ),
            const HomeMenu()
          ],
        ),
      ),
    );
  }
}

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      alignment: Alignment.center,
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  child: HomeMenuBtn(
                    title: "Learning",
                    iconData: Icons.book,
                    color: Colors.black,
                    backColor: Colors.yellow,
                  ),
                ),
                Expanded(
                  child: HomeMenuBtn(
                    title: "Exams",
                    iconData: Icons.edit,
                    color: Colors.white,
                    backColor: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: const [
                Expanded(
                  child: HomeMenuBtn(
                    title: "Profile",
                    iconData: Icons.person_outline,
                    color: Colors.white,
                    backColor: Colors.red,
                  ),
                ),
                Expanded(
                  child: HomeMenuBtn(
                    title: "Check Update",
                    iconData: Icons.sync_sharp,
                    color: Colors.white,
                    backColor: Colors.blue,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HomeMenuBtn extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Color backColor;
  final Color color;

  const HomeMenuBtn(
      {super.key,
      required this.title,
      required this.iconData,
      required this.color,
      required this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      alignment: Alignment.center,
      height: double.infinity,
      color: backColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 80,
            color: color,
          ),
          Text(
            title,
            style:
                Theme.of(context).textTheme.headline6?.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
