import 'package:flutter/material.dart';

class ProfilePageView extends StatelessWidget {
  static route()=> MaterialPageRoute(builder: (context) => const ProfilePageView(),);
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Page"),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}