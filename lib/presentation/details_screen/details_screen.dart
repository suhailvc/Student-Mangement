import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_management/core/constants.dart';

class DetailsScreen extends StatelessWidget {
  final String image;
  final String name;
  final String age;
  final String number;
  DetailsScreen(
      {super.key,
      required this.image,
      required this.name,
      required this.age,
      required this.number});
  File? imagePath;
  @override
  Widget build(BuildContext context) {
    imagePath = File(image);
    log(imagePath.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipOval(
              child: (image != 'img' && imagePath != null)
                  ? Image.file(
                      imagePath!,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    )
                  : Image.asset(
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                      'assets/images/149071.png'),
            ),
            k10Height,
            Text(name),
            k10Height,
            Text(age),
            k10Height,
            Text(number),
          ],
        ),
      ),
    );
  }
}
