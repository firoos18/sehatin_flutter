import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:sehatin_flutter/authentication/presentation/screens/landing_screen.dart';
import 'package:sehatin_flutter/home/presentation/screens/home_screen.dart';
import 'package:sehatin_flutter/user_profile/domain/entities/preference_item_entity.dart';
import 'package:sehatin_flutter/user_profile/presentation/components/preference_item.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xff1E1E1E).withOpacity(0.3),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundImage:
                            AssetImage('lib/core/assets/avatar.jpg'),
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Karina',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'karina@gmail.com',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(FeatherIcons.edit),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            PreferenceItem(
              item: PreferenceItemEntity(
                icon: FeatherIcons.clock,
                title: 'Riwayat',
                isLogout: false,
                action: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            PreferenceItem(
              item: PreferenceItemEntity(
                icon: FeatherIcons.logOut,
                title: 'Keluar',
                isLogout: true,
                action: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LandingScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
