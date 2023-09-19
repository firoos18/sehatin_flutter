import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sehatin_flutter/authentication/presentation/screens/authentication_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(right: 16, left: 16, top: 80, bottom: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('lib/core/assets/landing_screen_illustration.png'),
              const SizedBox(height: 120),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  children: const [
                    TextSpan(
                      text:
                          "Tidak pernah terlambat untuk memulai hidup sehat. Mulai hidup sehat bersama ",
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    TextSpan(
                      text: '"Sehatin"',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: "!"),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.1),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AuthenticationScreen(
                        isLogin: false,
                      ),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(32),
                splashColor: Colors.white60,
                child: const CircleAvatar(
                  backgroundColor: Color(0xff1E1E1E),
                  radius: 36,
                  child: Icon(
                    FeatherIcons.chevronRight,
                    color: Colors.white,
                    size: 42,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Sudah punya akun? ",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AuthenticationScreen(
                            isLogin: true,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "Masuk",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
