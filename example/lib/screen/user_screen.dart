import 'package:flutter/material.dart';
import 'package:mockup/mockup.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  // list of emojis
  List<UserModel> userList = Mockup.user.getAll();
  List<UserModel> userListWithFixedLength = Mockup.user.getItems(30);
  List<UserModel> refreshUserList = Mockup.user.getShuffledList();
  UserModel userItem = Mockup.user.getItemAt(5);
  UserModel refreshUserItem = Mockup.user.getRandomItem();
  var json = Mockup.user.rawJson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mockup Example")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("User List", style: Theme.of(context).textTheme.titleMedium),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              itemCount: userList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ListTile(
                    title: Row(
                      children: [
                        Text(
                          userList[index].firstName ?? "",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          "(${userList[index].occupation ?? ""})",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    subtitle: Text(
                      userList[index].education ?? "",
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
