import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yemekcii/screens/homepage.dart';

import '../scrpro/kullaniciprofl.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key, required String title}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final TextEditingController _kullaniciadi = TextEditingController();
  final TextEditingController _sifre = TextEditingController();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _animationController.repeat(reverse: true); // Animasyonu sürekli tekrarla
  }

  @override
  void dispose() {
    _animationController.dispose();
    _kullaniciadi.dispose();
    _sifre.dispose();
    super.dispose();
  }

  Future<bool> validateCredentials() async {
    String username = _kullaniciadi.text.trim();
    String password = _sifre.text.trim();

    bool isMatched = false;

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: username,
        password: password,
      );

      if (userCredential.user != null) {
        // Giriş başarılı
        isMatched = true;
      } else {
        // Giriş başarısız
        isMatched = false;
      }
    } catch (error) {
      print(error);
      // Hata durumunda da giriş başarısız olarak kabul edebilirsiniz
      isMatched = false;
    }

    return isMatched;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/dünya1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 220,
          ),
          child: Column(
            children: [
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return FadeTransition(
                    opacity: _animation,
                    child: const Text(
                      "YEMEKCİİ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Aradığın Dünya lezzetleri \n birtık uzağında ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _kullaniciadi,
                decoration: InputDecoration(
                  hintText: 'Mail giriniz',
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.4),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _sifre,
                decoration: InputDecoration(
                  hintText: 'Şifre giriniz',
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.4),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.lime, // Butonun arka plan rengi
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 16,
                  ), // Butonun iç içe yerleşmiş içeriği ile düğmenin kenarları arasındaki boşlukları belirler
                ),
                onPressed: () async {
                  String name = _kullaniciadi.text.trim();
                  String surname = _sifre.text;
                  if (name.isNotEmpty && surname.isNotEmpty) {
                    bool isCredentialsValid = await validateCredentials();
                    if (isCredentialsValid) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Geçersiz mail veya şifre.'),
                        ),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Mailinizi ve şifrenizi giriniz.'),
                      ),
                    );
                  }
                },
                child: const Text(
                  "Lezzeti Keşfet!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14, // Metin boyutunu belirler
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // Butonun arka plan rengi
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => KullaniciProfilPage()),
                  );
                },
                child: const Text(
                  "Hemen Kayıt Ol",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
