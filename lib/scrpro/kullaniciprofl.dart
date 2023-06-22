import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';

class User {
  String kullaniciAdi;
  String sifre;
  String mail;

  User({required this.kullaniciAdi, required this.sifre, required this.mail});
}

class AuthService {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  Future<void> signUp(User user) async {
    try {
      auth.UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: user.mail,
        password: user.sifre,
      );
      auth.User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        await firebaseUser.updateDisplayName(user.kullaniciAdi);
      }

      print('Kullanıcı kaydedildi. Kullanıcı Adı: ${user.kullaniciAdi}');
    } catch (error) {
      print('Kullanıcı kaydedilirken hata oluştu: $error');
    }
  }
}

class KullaniciProfilPage extends StatefulWidget {
  const KullaniciProfilPage({Key? key}) : super(key: key);

  @override
  _KullaniciProfilPageState createState() => _KullaniciProfilPageState();
}

class _KullaniciProfilPageState extends State<KullaniciProfilPage> {
  final TextEditingController _kullaniciAdiController = TextEditingController();
  final TextEditingController _sifreController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  void dispose() {
    _kullaniciAdiController.dispose();
    _sifreController.dispose();
    _mailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kullanıcı Kayıt'),
        backgroundColor: Colors.green[200],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/yesilk.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 160),
              TextField(
                controller: _kullaniciAdiController,
                decoration: InputDecoration(
                  labelText: 'Kullanıcı Adı',
                  filled: true,
                  fillColor: Colors.white,
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: _sifreController,
                decoration: InputDecoration(
                  labelText: 'Şifre',
                  filled: true,
                  fillColor: Colors.white,
                  labelStyle: TextStyle(color: Colors.black),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 5),
              TextField(
                controller: _mailController,
                decoration: InputDecoration(
                  labelText: 'E-posta',
                  filled: true,
                  fillColor: Colors.white,
                  labelStyle: TextStyle(color: Colors.black),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.lime,
                ),
                onPressed: () {
                  String kullaniciAdi = _kullaniciAdiController.text;
                  String sifre = _sifreController.text;
                  String mail = _mailController.text;

                  if (sifre.length < 6) {
                    print('Şifre en az 6 karakter olmalı.');
                    return;
                  }

                  User user = User(
                    kullaniciAdi: kullaniciAdi,
                    sifre: sifre,
                    mail: mail,
                  );

                  _authService.signUp(user);
                },
                child: const Text('Kayıt Ol'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
