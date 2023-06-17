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

  Future<void> sepeteEkle(int index) async {
    try {
      final yemek = yemekListesi[index];
      await FirebaseFirestore.instance
          .collection('Sepet')
          .doc('sepette_$index')
          .set({
        'yemek': yemek['ad'],
        'fiyat': yemek['fiyat'],
        'aciklama': yemek['aciklama'],
        'resim': yemek['resim'],
      });
      print('${yemek['ad']} sepete eklendi.');
    } catch (e) {
      print('Hata: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime,
        title: const Text('Yemekcii Japon Yemekleri'),
        // App Bar başlığı
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                            )),
                      ),
                    ],
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
                    children: const [
                      Text(
                        "Yakitori",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "115 TL",
                        style: TextStyle(
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
                  const Text(
                    "Japon mutfağının popüler bir çorba yemeğidir. Ramen, tavuk, domuz eti veya deniz ürünleri ile yapılan çeşitli lezzetli çorba ve çeşitli garnitürlerle servis edilir. Noodle (erişte) ve çeşitli sebzeler de içerir.",
                    style: TextStyle(
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
                      onPressed: () =>
                          sepeteEkle(0), // Mercimek Çorbası için indeks 0
                      child: Text(
                        "Sepete Ekle",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
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
                            )),
                      ),
                    ],
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
                    children: const [
                      Text(
                        "Tempura",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "240 TL ",
                        style: TextStyle(
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
                  const Text(
                    "-Japon mutfağının popüler bir çorba yemeğidir. Ramen, tavuk, domuz eti veya deniz ürünleri ile yapılan çeşitli lezzetli çorba ve çeşitli garnitürlerle servis edilir. Noodle (erişte) ve çeşitli sebzeler de içerir.",
                    style: TextStyle(
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
                      child: Text(
                        "Sepete Ekle",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
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
                            )),
                      ),
                    ],
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
                    children: const [
                      Text(
                        "Sukiyaki",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "360 TL ",
                        style: TextStyle(
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
                  const Text(
                    "- Japon mutfağının geleneksel bir yemeğidir. Sukiyaki, ince dilimlenmiş et (genellikle dana eti), sebzeler, tofu ve çeşitli malzemelerin soya sosu, şeker ve sake ile pişirildiği bir tencere yemeğidir.",
                    style: TextStyle(
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
                      child: Text(
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
                              image: AssetImage("assets/ramen.jpg"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            )),
                      ),
                    ],
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
                    children: const [
                      Text(
                        "Ramen",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "620 TL ",
                        style: TextStyle(
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
                  const Text(
                    "-Japon ızgarası olarak da bilinen yakitori, çeşitli tavuk etlerinin şişlere takılarak ızgarada pişirilmesiyle yapılan bir yemektir. Tavuk parçaları, soslu veya tuzlu olarak servis edilir.",
                    style: TextStyle(
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
                      child: Text(
                        "Sepete Ekle",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
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
