import 'package:flutter/material.dart';
import 'package:mockup/mockup.dart';

class QuoteScreen extends StatefulWidget {
  const QuoteScreen({super.key});

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  // list of emojis
  List<QuoteModel> quoteList = Mockup.quote.getAll();
  List<QuoteModel> quoteListWithFixedLength = Mockup.quote.getItems(30);
  List<QuoteModel> refreshQuoteList = Mockup.quote.getShuffledList();
  QuoteModel quoteItem = Mockup.quote.getItemAt(5);
  QuoteModel refreshQuoteItem = Mockup.quote.getRandomItem();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mockup Example")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Quote List", style: Theme.of(context).textTheme.titleMedium),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              itemCount: quoteList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ListTile(
                    title: Row(
                      children: [
                        Text(
                          quoteList[index].author ?? "",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          "(${quoteList[index].quoteType ?? ""})",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    subtitle: Text(
                      quoteList[index].quote ?? "",
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
