import 'package:flutter/material.dart';
import '../../Widgets/app_bar.dart';
import 'package:provider/provider.dart';

import '../../Provider/user_provider.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = "/profile";
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const TAppbar(),
          SliverToBoxAdapter(
            child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 50, 
                      backgroundImage: AssetImage(user.photo),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text('Name: ${user.name}', style: TextStyle(fontSize: 18)),
                Text('Email: ${user.email}', style: TextStyle(fontSize: 18)),
                Text('District: ${user.district}', style: TextStyle(fontSize: 18)),
                Text('Area: ${user.area}', style: TextStyle(fontSize: 18)),
                Text('Qualification: ${user.qualification}', style: TextStyle(fontSize: 18)),
              ],
            ),
                    ),
          ),
        ]
      ),
    );
  }
}
