import 'package:flutter/material.dart';
import 'package:mockup/mockup.dart';

class BuildingScreen extends StatefulWidget {
  const BuildingScreen({super.key});

  @override
  State<BuildingScreen> createState() => _BuildingScreenState();
}

class _BuildingScreenState extends State<BuildingScreen> {
  // list of buildings
  List<BuildingModel> buildingList = Mockup.building.getAll();
  // List<BuildingModel> buildingListWithFixedLength = Mockup.building
  //     .getItems(30);
  List<BuildingModel> refreshBuildingList = Mockup.building.getShuffledList();
  BuildingModel buildingItem = Mockup.building.getItemAt(5);
  BuildingModel refreshBuildingItem = Mockup.building.getRandomItem();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mockup Example")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Building List",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              itemCount: buildingList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ListTile(
                    title: Row(
                      children: [
                        Text(
                          buildingList[index].name ?? "",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          " (Built in ${buildingList[index].yearBuilt ?? ""})",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    subtitle: Text(
                      buildingList[index].description ?? "",
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
