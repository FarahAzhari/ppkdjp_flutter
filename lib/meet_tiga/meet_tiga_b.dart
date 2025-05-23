import 'package:flutter/material.dart';

class MeetTigaB extends StatelessWidget {
  const MeetTigaB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meet 3 B'), backgroundColor: Colors.blue),
      body: ListView(
        // scrollDirection: Axis.horizontal,
        children: [
          buildListUser(),
          buildListUser(),
          buildListUser(),
          buildListUser(),
          // buildStack(),
          // buildStack(),
          // buildStack(),
          // buildStack(),
          // buildStack(),
          // buildStack(),
        ],
      ),
    );
  }
}

ListTile buildListUser() {
  return ListTile(
    leading: Image.asset('assets/images/cat.png'),
    title: Text('Cat'),
    subtitle: Text('McFluffy'),
    trailing: Icon(Icons.add),
    tileColor: Colors.grey,
    onTap: () {},
  );
}
