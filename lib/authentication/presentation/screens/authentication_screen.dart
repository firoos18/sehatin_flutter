import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:sehatin_flutter/home/presentation/screens/home_screen.dart';

class AuthenticationScreen extends StatefulWidget {
  final bool isLogin;

  const AuthenticationScreen({super.key, required this.isLogin});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool _showPassword = true;
  bool _showRePassword = true;
  late bool _isLogin = widget.isLogin;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 38, right: 16, left: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _isLogin ? "Masuk" : "Daftar",
                style:
                    const TextStyle(fontSize: 42, fontWeight: FontWeight.w600),
              ),
              Text(
                _isLogin
                    ? "Isikan form di bawah dengan kredensial yang sesuai!"
                    : "Isikan form di bawah dengan data yang sesuai!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              const SizedBox(height: 149),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                  prefixIcon: const Icon(FeatherIcons.mail),
                  filled: true,
                  fillColor: const Color(0xffF4F4F9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.black87),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: _showPassword,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                  prefixIcon: const Icon(FeatherIcons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                    icon: _showPassword
                        ? const Icon(FeatherIcons.eye)
                        : const Icon(FeatherIcons.eyeOff),
                  ),
                  filled: true,
                  fillColor: const Color(0xffF4F4F9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.black87),
                  ),
                ),
              ),
              if (!_isLogin) const SizedBox(height: 16),
              if (!_isLogin)
                TextField(
                  controller: _rePasswordController,
                  obscureText: _showRePassword,
                  decoration: InputDecoration(
                    hintText: "Ulangi Password",
                    hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                    prefixIcon: const Icon(FeatherIcons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _showRePassword = !_showRePassword;
                        });
                      },
                      icon: _showRePassword
                          ? const Icon(FeatherIcons.eye)
                          : const Icon(FeatherIcons.eyeOff),
                    ),
                    filled: true,
                    fillColor: const Color(0xffF4F4F9),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.black87),
                    ),
                  ),
                ),
              if (_isLogin) const SizedBox(height: 16),
              if (_isLogin)
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Lupa password?",
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
              SizedBox(height: _isLogin ? 100 : 100),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();

                  if (_isLogin) {
                    if (_emailController.text.trim() != "" &&
                        _passwordController.text.trim() != "") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            children: [
                              const Text("Berhasil masuk sebagai: "),
                              Text(_emailController.text.trim())
                            ],
                          ),
                        ),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text("Pastikan semua form terisi dengan benar!"),
                        ),
                      );
                    }
                  } else {
                    if (_emailController.text.trim() != "" &&
                        _passwordController.text.trim() != "" &&
                        _rePasswordController.text.trim() != "") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            children: [
                              const Text("Berhasil daftar sebagai: "),
                              Text(_emailController.text.trim())
                            ],
                          ),
                        ),
                      );
                      setState(() {
                        _isLogin = true;
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text("Pastikan semua form terisi dengan benar!"),
                        ),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff1E1E1E),
                  foregroundColor: const Color(0xffF4F4F9),
                  minimumSize: const Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  _isLogin ? "Masuk" : "Daftar",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: _isLogin ? 200 : 156),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _isLogin ? "Belum punya akun? " : "Sudah punya akun? ",
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                    child: Text(
                      _isLogin ? "Daftar" : "Masuk",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
