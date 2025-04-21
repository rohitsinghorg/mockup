import 'package:flutter/material.dart';
import 'package:mockup/mockup.dart';

class FlowerScreen extends StatefulWidget {
  const FlowerScreen({super.key});

  @override
  State<FlowerScreen> createState() => _FlowerScreenState();
}

class _FlowerScreenState extends State<FlowerScreen> {
  // list of emojis
  List<FlowerModel> flowerList = Mockup.flower.getAll();
  List<FlowerModel> flowerListWithFixedLength = Mockup.flower.getItems(30);
  List<FlowerModel> refreshFlowerList = Mockup.flower.getShuffledList();
  FlowerModel flowerItem = Mockup.flower.getItemAt(5);
  FlowerModel refreshFlowerItem = Mockup.flower.getRandomItem();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mockup Example")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Flower List", style: Theme.of(context).textTheme.titleMedium),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              itemCount: flowerList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ListTile(
                    title: Row(
                      children: [
                        Text(
                          flowerList[index].commonName ?? "",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          " (${flowerList[index].scientificName ?? ""})",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    subtitle: Text(
                      flowerList[index].shortDescription ?? "",
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
