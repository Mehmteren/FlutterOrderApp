import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class KoreScreen extends StatefulWidget {
  const KoreScreen({Key? key}) : super(key: key);

  @override
  State<KoreScreen> createState() => _KoreScreenState();
}

class _KoreScreenState extends State<KoreScreen> {
  List<Map<String, dynamic>> yemekListesi = [
    {
      'ad': 'Bossam',
      'fiyat': '410 TL',
      'aciklama':
          'Bossam, Kore mutfağının popüler yemeklerinden biridir. Genellikle domuz etinden yapılan bu yemek, ince dilimlenmiş etin içine sarılan marul yaprakları ve çeşitli soslarla servis edilir.',
      'resim': 'assets/bossamko.jpg',
    },
    {
      'ad': 'Bulgogiko',
      'fiyat': '245 TL',
      'aciklama':
          'Bulgogi, Kore mutfağının en tanınmış yemeklerinden biridir. İnce dilimlenmiş et (genellikle sığır eti) soya sosu, sarımsak, şeker ve baharatlarla marine edilir, ardından ızgarada veya tavada pişirilir.',
      'resim': 'assets/bulgogiko.jpeg',
    },
    {
      'ad': 'Ggulttok',
      'fiyat': '720 TL',
      'aciklama': 'Ggulttok, Kore mutfağının özel bir tatlısıdır...',
      'resim': 'assets/ggulttokko.jpg',
    },
    {
      'ad': 'Kimichii',
      'fiyat': '520 TL',
      'aciklama':
          'Kimchi, Kore mutfağının vazgeçilmez bir yan lezzetidir. Genellikle..',
      'resim': 'assets/kimichiiko.jpeg',
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
        title: const Text('Yemekcii Kore Yemekleri'),
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
                              image: AssetImage("assets/bossamko.jpg"),
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
                        "Bossam",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "410 TL",
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
                    "-Bossam, Kore mutfağının popüler yemeklerinden biridir. Genellikle domuz etinden yapılan bu yemek, ince dilimlenmiş etin içine sarılan marul yaprakları ve çeşitli soslarla servis edilir. Bossam, hem doyurucu hem de lezzetli bir seçenektir ve kendine özgü sunumuyla sofraları şenlendirir.",
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
                              image: AssetImage("assets/bulgogiko.jpeg"),
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
                        "Bulgogi",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "245 TL ",
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
                    "-Bulgogi, Kore mutfağının en tanınmış yemeklerinden biridir. İnce dilimlenmiş et (genellikle sığır eti) soya sosu, sarımsak, şeker ve baharatlarla marine edilir, ardından ızgarada veya tavada pişirilir. Bulgogi, tatlı ve tuzlu lezzetiyle dikkat çeker ve genellikle pirinç ve kimchi ile birlikte servis edilir.",
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
                              image: AssetImage("assets/ggulttokko.jpg"),
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
                        "Ggulttok",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "720 TL ",
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
                    "-Ggulttok, Kore mutfağının özel bir tatlısıdır. Ggulttok, glutinous pirinç unu, bal ve farklı tatlarla hazırlanan bir çeşit şekerlemeyi ifade eder. Farklı şekillerde yapılabilir ve genellikle çay eşliğinde keyifle tüketilir.",
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
                              image: AssetImage("assets/kimichiiko.jpeg"),
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
                        "Kimichii",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "64 TL ",
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
                    "-Kimchi, Kore mutfağının vazgeçilmez bir yan lezzetidir. Genellikle lahana veya turp gibi sebzelerin fermente edilmesiyle elde edilir. Kimchi, baharatlı, ekşi ve lezzetli bir tadı vardır ve Kore yemeklerinin yanında sık sık servis edilir.",
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
