import 'package:flutter/material.dart';
import 'package:mockup/mockup.dart';

class EmojiScreen extends StatefulWidget {
  const EmojiScreen({super.key});

  @override
  State<EmojiScreen> createState() => _EmojiScreenState();
}

class _EmojiScreenState extends State<EmojiScreen> {
  // list of emojis
  List<EmojiModel> emojiList = Mockup.emoji.getAll();
  List<EmojiModel> emojiListWithFixedLength = Mockup.emoji.getItems(30);
  List<EmojiModel> refreshEmojiList = Mockup.emoji.getShuffledList();
  EmojiModel emojiItem = Mockup.emoji.getItemAt(5);
  EmojiModel refreshEmojiItem = Mockup.emoji.getRandomItem();
  var json = Mockup.emoji.rawJson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mockup Example")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Emoji List", style: Theme.of(context).textTheme.titleMedium),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              itemCount: emojiListWithFixedLength.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ListTile(
                    title: Row(
                      children: [
                        Text(
                          emojiListWithFixedLength[index].shortname ?? "",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          " (${emojiListWithFixedLength[index].emoji ?? ""})",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    subtitle: Text(
                      emojiListWithFixedLength[index].category ?? "",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
