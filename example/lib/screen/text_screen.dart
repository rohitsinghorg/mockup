import 'package:flutter/material.dart';
import 'package:mockup/mockup.dart';

class TextScreen extends StatefulWidget {
  const TextScreen({super.key});

  @override
  State<TextScreen> createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {

  final randomAlphanumeric = Mockup.text.randomAlphanumeric;
  final twoSentences = Mockup.text.generateSentences(numberOfSentence: 2);
  final twoShortParas = Mockup.text.generateShortParagraph(2);
  final twoMediumParas = Mockup.text.generateMediumParagraph(2);
  final twoLongParas = Mockup.text.generateLongParagraph(2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mockup Example")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Random Text Data",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: 20,
            ),
            Text("Random Alphanumeric is:", style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700)),
            SizedBox(
              height: 10,
            ),
            Text(randomAlphanumeric),
            SizedBox(
              height: 20,
            ),
            Text("Two Random Sentences are:", style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700)),
            SizedBox(
              height: 10,
            ),
            Text(twoSentences),
            SizedBox(
              height: 20,
            ),
            Text("Two Random Short Paragraph are:", style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700)),
            SizedBox(
              height: 10,
            ),
            Text(twoShortParas),
            SizedBox(
              height: 20,
            ),
            Text("Two Random Medium Paragraph are:", style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700)),
            SizedBox(
              height: 10,
            ),
            Text(twoMediumParas),
            SizedBox(
              height: 20,
            ),
            Text("Two Random Long Paragraph are:", style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700)),
            SizedBox(
              height: 10,
            ),
            Text(twoLongParas),
          ],
        ),
      ),
    );
  }
}
