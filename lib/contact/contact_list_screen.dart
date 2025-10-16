import 'package:flutter/material.dart';

import 'single_contact_screen.dart';

class ContactListScreen extends StatelessWidget {
  const ContactListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                direction: Axis.vertical,
                children: [
                  const Text(
                    "Contacts",
                      style: TextStyle(
                        fontFamily: 'Oswald',
                        fontSize: 24,
                      )),
                  Text("20 Contacts",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black54)),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 20,
                itemBuilder: (context, index) => Dismissible(
                  key: Key("$index"),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SingleContactScreen()),
                      );
                    },
                    leading: const CircleAvatar(
                      child: Text("IW"),
                    ),
                    title: const Text(
                      "Ivy Walobwa",
                    ),
                    trailing: const Icon(Icons.info_outline),
                  ),
                ),
                separatorBuilder: (BuildContext context, int index) =>
                const Divider(
                  height: 1,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "Phone"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Contacts"),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border), label: "Favorites"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

showContactInfo(BuildContext context) {
  return showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(100, 150, 30, 0),
      items: const <PopupMenuItem>[
        PopupMenuItem(
          child: Text("info 1"),
        ),
        PopupMenuItem(
          child: Text("info 2"),
        ),
      ]);
}