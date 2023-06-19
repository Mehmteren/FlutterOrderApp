import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class JaponScreen extends StatefulWidget {
  const JaponScreen({Key? key}) : super(key: key);

  @override
  State<JaponScreen> createState() => _JaponScreenState();
}

class _JaponScreenState extends State<JaponScreen> {
  List<Map<String, dynamic>> yemekListesi = [
    {
      'ad': 'Ramen',
      'fiyat': '115 TL',
      'aciklama':
          'Japon mutfağının popüler bir çorba yemeğidir. Ramen, tavuk, domuz eti veya deniz ürünleri ile yapılan çeşitli lezzetli çorba ve çeşitli garnitürlerle servis edilir. Noodle (erişte) ve çeşitli sebzeler de içerir.',
      'resim': 'assets/ramen.jpg',
    },
    {
      'ad': 'Tempura',
      'fiyat': '240 TL',
      'aciklama':
          'Hafif ve kıtır kıtır bir kızartma yemeğidir. Tempura, sebzeler, deniz ürünleri veya etin, hafif bir hamur ile kaplanıp kızartılmasıyla hazırlanır. Genellikle tempura sosuyla birlikte servis edilir.',
      'resim': 'assets/tempura.jpg',
    },
    {
      'ad': 'Sukiyaki',
      'fiyat': '360 TL',
      'aciklama':
          ' Japon mutfağının geleneksel bir yemeğidir. Sukiyaki, ince dilimlenmiş et (genellikle dana eti), sebzeler, tofu ve çeşitli malzemelerin soya sosu, şeker ve sake ile pişirildiği bir tencere yemeğidir.',
      'resim': 'assets/sukiyaki.jpg',
    },
    {
      'ad': 'Yakitori',
      'fiyat': '620 TL',
      'aciklama':
          ' Japon ızgarası olarak da bilinen yakitori, çeşitli tavuk etlerinin şişlere takılarak ızgarada pişirilmesiyle yapılan bir yemektir. Tavuk parçaları, soslu veya tuzlu olarak servis edilir.',
      'resim': 'assets/yakitori.jpg',
    },
  ];
  List<bool> isFavoriteList = [false, false, false, false];

  Future<void> sepeteEkle(int index) async {
    try {
      final yemek = yemekListesi[index];
      await FirebaseFirestore.instance.collection('Sepet').add({
        'yemek': yemek['ad'],
        'fiyat': yemek['fiyat'],
        'aciklama': yemek['aciklama'],
        'resim': yemek['resim'],
      });
      print('${yemek['ad']} eklendi.');
    } catch (e) {
      print('Hata: $e');
    }
  }

  Future<void> favla(int index) async {
    try {
      final yemek = yemekListesi[index];
      await FirebaseFirestore.instance.collection('Favori').add({
        'yemek': yemek['ad'],
        'fiyat': yemek['fiyat'],
        'aciklama': yemek['aciklama'],
        'resim': yemek['resim'],
      });
      print('${yemek['ad']} eklendi.');
    } catch (e) {
      print('Hata: $e');
    }
  }

  void toggleFavorite(int index) {
    setState(() {
      isFavoriteList[index] = !isFavoriteList[index];
    });

    if (isFavoriteList[index]) {
      favla(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime,
        title: const Text('Yemekcii Japon Yemekleri'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // İlk yemek kartı
            Stack(
              children: [
                SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 180,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/ramen.jpg"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: IconButton(
                    onPressed: () {
                      toggleFavorite(0);
                    },
                    icon: Icon(
                      isFavoriteList[0]
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12.0,
                right: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        yemekListesi[0]['ad'],
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        yemekListesi[0]['fiyat'],
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    yemekListesi[0]['aciklama'],
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lime,
                      ),
                      onPressed: () => sepeteEkle(0),
                      child: const Text(
                        "Sepete Ekle",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 180,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/tempura.jpg"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: IconButton(
                    onPressed: () {
                      toggleFavorite(1);
                    },
                    icon: Icon(
                      isFavoriteList[1]
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12.0,
                right: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        yemekListesi[1]['ad'],
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        yemekListesi[1]['fiyat'],
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    yemekListesi[1]['aciklama'],
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lime,
                      ),
                      onPressed: () => sepeteEkle(1),
                      child: const Text(
                        "Sepete Ekle",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 180,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/sukiyaki.jpg"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: IconButton(
                    onPressed: () {
                      toggleFavorite(2);
                    },
                    icon: Icon(
                      isFavoriteList[2]
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12.0,
                right: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        yemekListesi[2]['ad'],
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        yemekListesi[2]['fiyat'],
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    yemekListesi[2]['aciklama'],
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lime,
                      ),
                      onPressed: () => sepeteEkle(2),
                      child: const Text(
                        "Sepete Ekle",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 180,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/yakitori.jpg"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: IconButton(
                    onPressed: () {
                      toggleFavorite(3);
                    },
                    icon: Icon(
                      isFavoriteList[3]
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12.0,
                right: 12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        yemekListesi[3]['ad'],
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        yemekListesi[3]['fiyat'],
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    yemekListesi[3]['aciklama'],
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lime,
                      ),
                      onPressed: () => sepeteEkle(3),
                      child: const Text(
                        "Sepete Ekle",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
