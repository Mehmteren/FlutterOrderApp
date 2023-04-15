import 'package:flutter/material.dart';
import 'package:yemekcii/screens/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final TextEditingController _kullaniciadi = TextEditingController();
  final TextEditingController _sifre = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/kapp.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 220,
          ),
          child: Column(
            children: [
              const Text(
                "Dünya Lezzetleri",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Aradığın lezzet \n birtık uzağında ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _kullaniciadi,
                decoration: InputDecoration(
                  hintText: 'Kullanıcı Adınızı giriniz',
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.6),
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
              TextField(
                controller: _sifre,
                decoration: InputDecoration(
                  hintText: 'Şifrenize Giriniz',
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.6),
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
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lime,
                  ),
                  onPressed: () {
                    String name = _kullaniciadi.text.trim();
                    String surname = _sifre.text.trim();
                    if (name.isNotEmpty && surname.isNotEmpty) {
                      // Do something with the name and surname
                      print('Ad: $name, Soyad: $surname');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    } else {
                      // Show an error message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                              'Lütfen kullanıcı adınızı ve şifrenizi giriniz.'),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Lezzeti Keşfet!",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
