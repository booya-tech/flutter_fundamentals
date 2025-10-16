import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'profile_preview.dart';

class SingleContactScreen extends StatefulWidget {
  const SingleContactScreen({Key? key}) : super(key: key);

  @override
  State<SingleContactScreen> createState() => _SingleContactScreenState();
}

class _SingleContactScreenState extends State<SingleContactScreen> {
  bool favorited = false;
  bool isWorkmate = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: height * 0.3,
                    color: Colors.blue.shade100,
                    child: Center(
                      child: InkWell(
                        child: CircleAvatar(
                          child: Text(
                            "IW",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: Colors.white),
                          ),
                          radius: 64,
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ProfilePreviewScreen(),
                          ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: const Icon(
                            Icons.arrow_back_outlined,
                            color: Colors.black,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    right: 20,
                    top: height * .3 - 44,
                    child: TweenAnimationBuilder(
                        tween: ColorTween(
                          begin: favorited ? Colors.grey : Colors.red,
                          end: favorited ? Colors.red : Colors.grey,
                        ),
                        duration: const Duration(milliseconds: 300),
                        builder: (BuildContext context, Color? color, Widget? child) {
                          return Icon(Icons.favorite, color: color!,);
                        }
                    ),
                  ),
                  Positioned(
                    right: 20,
                    top: height * .3 - 88,
                    // TODO-3: Show or hide the briefcase Icon
                    // Replace Container with AnimatedOpacity
                    child: AnimatedOpacity(
                      opacity: isWorkmate ? 1 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: const Icon(CupertinoIcons.briefcase_fill, color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),

              const ListTile(
                title: Text("99-999999"),
                subtitle: Text("Mobile"),
                trailing:      Wrap(
                  spacing: 24,
                  children: const [
                    Icon(Icons.phone_enabled_outlined, color: Colors.black,),
                    Icon(Icons.message, color: Colors.black,),
                  ],
                ),
              ),
              ListTile(
                title: const Text(
                    'Add to favorites'),
                onTap: () {
                  setState(() {
                    favorited = !favorited;
                  });
                },
              ),
              ListTile(
                title: const Text(
                    'Add to workmates'
                ),
                onTap: () {
                  setState(() {
                    isWorkmate = !isWorkmate;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}