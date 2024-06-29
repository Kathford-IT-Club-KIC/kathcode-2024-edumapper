
import 'package:flutter/material.dart';
import '../../Features/create_post.dart';

import '../../Widgets/app_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          TAppbar(),
          SliverToBoxAdapter(
            child: CreatePostContainer()
          )
        ],
      )
    );
  }
}
