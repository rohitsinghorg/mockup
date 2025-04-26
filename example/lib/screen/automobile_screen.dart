import 'package:flutter/material.dart';
import 'package:mockup/mockup.dart';

class AutomobileScreen extends StatefulWidget {
  const AutomobileScreen({super.key});

  @override
  State<AutomobileScreen> createState() => _AutomobileScreenState();
}

class _AutomobileScreenState extends State<AutomobileScreen> {
  // list of automobiles
  List<AutomobileModel> automobileList = Mockup.automobile.getAll();
  List<AutomobileModel> automobileListWithFixedLength = Mockup.automobile
      .getItems(30);
  List<AutomobileModel> refreshAutomobileList =
      Mockup.automobile.getShuffledList();
  AutomobileModel automobileItem = Mockup.automobile.getItemAt(5);
  AutomobileModel refreshAutomobileItem = Mockup.automobile.getRandomItem();
  var json = Mockup.automobile.rawJson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mockup Example")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Automobile List",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              itemCount: automobileList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ListTile(
                    title: Row(
                      children: [
                        Text(
                          automobileList[index].make ?? "",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          " (${automobileList[index].year ?? ""})",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    subtitle: Text(
                      automobileList[index].shortDescription ?? "",
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
