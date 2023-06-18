import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yemekcii/aciklama.dart';
import 'package:yemekcii/screens/detail_screen.dart';
import 'package:yemekcii/sepet/sepetim.dart';
import 'package:yemekcii/ulkeleryemek/hint.dart';
import 'package:yemekcii/ulkeleryemek/ispanya.dart';
import 'package:yemekcii/ulkeleryemek/kore.dart';

import '../komutes/bases.dart';
import '../ulkeleryemek/italyan.dart';
import '../ulkeleryemek/japon.dart';
import '../ulkeleryemek/konya.dart';

void openWebsite() async {
  var url = 'https://tr.euronews.com/tag/gastronomi';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'İnternet sitesi açılamadı: $url';
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() =>
      _HomePageState(); //HomePage adında bir StatefulWidget oluşturulur. Bu, Flutter uygulamasında bir widget'in durumunu tutabilen bir sınıftır.
} //_HomePageState adında bir State sınıfı oluşturulur. Bu sınıf, HomePage widget'ının durumunu tutar.

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //build metodu, ana sayfanın görüntüsünü oluşturur.
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.lime[600],
        unselectedItemColor: Colors.lime[600],
        backgroundColor: Colors.lime[50],
        items: const [
          BottomNavigationBarItem(
            label: 'Notlar',
            icon: Icon(
              Icons.create,
              size: 32,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Hakkımızda',
            icon: Icon(
              Icons.text_snippet,
              size: 32,
            ),
          ),
        ],
        onTap: (int index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BasePage(),
              ),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AciklamaPage(),
              ),
            );
          }
        },
      ),
      body: SingleChildScrollView(
        //sayfada dikey kaydırmayı sağlar.
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 15,
                  right: 10,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 54,
                          width: 64,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.lime[300],
                          ),
                          child: ListTile(
                            onTap: () {
                              openWebsite();
                            },
                            title: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.newspaper,
                                  size: 32,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        GestureDetector(
                          onDoubleTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SepetimPage(),
                              ),
                            );
                          },
                          child: Container(
                            height: 54,
                            width: 64,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.lime[300],
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.shopping_bag,
                                size: 28,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Row(
                      children: const [
                        Text(
                          "Yabancı Yemek Katogorileri",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ItalyanScreen()));
                                  },
                                  child: Container(
                                    height: 180,
                                    width: 170,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          "assets/italyanyemekleri.png",
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: const [
                                        Text(
                                          "İtalyan Mutfağı",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const KoreScreen()));
                                  },
                                  child: Container(
                                    height: 180,
                                    width: 170,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          "assets/koreko.jpg",
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: const [
                                        Text(
                                          "Kore Mutfağı",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const JaponScreen()));
                                  },
                                  child: Container(
                                    height: 180,
                                    width: 170,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          "assets/japon.jpg",
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: const [
                                        Text(
                                          "Japon Mutfağı",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HintScreen()));
                                  },
                                  child: Container(
                                    height: 180,
                                    width: 170,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          "assets/hint.jpg",
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: const [
                                        Text(
                                          "Hint Mutfağı",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const IspanyaScreen()));
                                  },
                                  child: Container(
                                    height: 180,
                                    width: 170,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          "assets/isyanya.jpg",
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: const [
                                        Text(
                                          "ispanyol Mutfağı",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: const [
                        Text(
                          "Yöresel Yemek Katogorileri",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const KonyaScreen()),
                              );
                            },
                            child: Container(
                              height: 190,
                              width: 360,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/gonya.png"),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text(
                                    "Konya Mutfağı",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const DetailScreen()),
                              );
                            },
                            child: Container(
                              height: 190,
                              width: 360,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("assets/türky1.jpg"),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text(
                                    "Türk Mutfağı",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Container(
                      height: 160,
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  "assets/dugunpilav.jpg",
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Muhteşem!        5/5",
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'Yeni bir uygulama aslında biraz çekiindim ancak ilk hizmetini konyaya vereceğini duyunca bir şans vermek istedim gerçektem çok başarılı',
                                  overflow: TextOverflow
                                      .clip, //metin içeriğinin kutucuktan taşması durumunda metin kesilecek ve kırpılacak. TAŞMALAR ÖNLENMESİ İÇİN KULLANDIM YANİ
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 160,
                      width: MediaQuery.of(context).size.width / 1.1,
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  "assets/sushi.jpg",
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Çok lezzetliydi!          4/5",
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  'normalde suşi sevmem ama bu bambaşka bir şeydi, indirim kuponu için teşekkürler umarım kaliteyi bozmazlar',
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
