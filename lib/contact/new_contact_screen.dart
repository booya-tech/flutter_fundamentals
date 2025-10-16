import 'package:flutter/material.dart';

class NewContactScreen extends StatelessWidget {
  const NewContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Widget spacing = SizedBox(
      height: 16,
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                child: const Icon(Icons.close),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              spacing,
              const Center(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 40,
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              spacing,
              const TextField(
                enabled: false,
                decoration: InputDecoration(
                    hintText: 'Contact name',
                    icon: Icon(
                      Icons.person_outline_outlined,
                    )),
              ),
              spacing,
              const TextField(
                enabled: false,
                decoration: InputDecoration(
                    hintText: 'Mobile number',
                    icon: Icon(
                      Icons.phone_outlined,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
