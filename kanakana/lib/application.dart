import 'package:flutter/material.dart';
import 'package:kanakana/kanadetails.dart';
import 'package:kanakana/model.dart';

class KanaApplication extends StatelessWidget {
  const KanaApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 36,
        left: 8,
        right: 8,
        bottom: 16,
      ),
      child: Column(
        children: [
          Text(
            "Kana ကာနာ",
            style: Theme.of(context).textTheme.headline4,
          ),
          getRow(['あ', 'い', 'う', 'え', 'お'], context),
          getRow(['か', 'き', 'く', 'け', 'こ'], context),
          getRow(['さ', 'し', 'す', 'せ', 'そ'], context),
          getRow(['た', 'ち', 'つ', 'て', 'と'], context),
          getRow(['な', 'に', 'ぬ', 'ね', 'の'], context),
          getRow(['は', 'ひ', 'ふ', 'へ', 'ほ'], context),
          getRow(['ま', 'み', 'む', 'め', 'も'], context),
          getRow(['や', ' ', 'ゆ', ' ', 'よ'], context),
          getRow(['ら', 'り', 'る', 'れ', 'ろ'], context),
          getRow(['わ', ' ', '　', '　', 'を'], context),
          getRow(['ん', ' ', '　', '　', '　'], context),
        ],
      ),
    );
  }

  Widget getRow(List<String> data, BuildContext context) => Expanded(
        child: Row(
          children: [
            getCell(data[0], context),
            getCell(data[1], context),
            getCell(data[2], context),
            getCell(data[3], context),
            getCell(data[4], context),
          ],
        ),
      );

  Widget getCell(String str, BuildContext context) => Expanded(
        child: InkWell(
          onTap: () {
            if (str.trim().isNotEmpty) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailsView(
                    value: str,
                    hatuon: oto[str]!,
                    katakana: kana[str]!,
                  ),
                ),
              );
            }
          },
          child: Center(
            child: Text(
              str,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ),
      );
}
