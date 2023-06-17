import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ItalyanScreen extends StatefulWidget {
  const ItalyanScreen({Key? key}) : super(key: key);

  @override
  State<ItalyanScreen> createState() => _ItalyanScreenState();
}

class _ItalyanScreenState extends State<ItalyanScreen> {
  List<Map<String, dynamic>> yemekListesi = [
    {
      'ad': 'Lasgana',
      'fiyat': '190 TL',
      'aciklama':
          'Kat kat yapılan bir makarna yemeğidir. Lazanya yapmak için genellikle makarna tabakaları, et sosu, beşamel sos ve rendelenmiş peynir kullanılır.',
      'resim': 'assets/lasgana.jpg',
    },
    {
      'ad': 'Ossobuco',
      'fiyat': '320 TL',
      'aciklama':
          'Bulgogi, Milana özgü bir yemektir. Bu yemek, jülyen doğranmış sebzeler, beyaz şarap, et suyu ve dana inciklerinin birleşimiyle yapılan bir yahni çeşididir. ',
      'resim': 'assets/ossobuco.jpg',
    },
    {
      'ad': 'Ravioli',
      'fiyat': '410 TL',
      'aciklama':
          ' İçi doldurulmuş taze veya kuru makarna hamurlarından yapılan bir İtalyan yemeğidir. İç harcı genellikle peynir, et, sebze veya mantar gibi malzemelerden oluşur.',
      'resim': 'assets/ravioli.jpg',
    },
    {
      'ad': 'Risotto',
      'fiyat': '540 TL',
      'aciklama':
          'Kremsi ve lezzetli bir pirinç yemeğidir. Ana malzeme olarak Arborio veya Carnaroli pirinci kullanılır ve genellikle sebzeler, et veya deniz ürünleriyle zenginleştirilir.',
      'resim': 'assets/risotto.jpg',
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
        title: const Text('Yemekcii Italyan Yemekleri'),
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
                              image: AssetImage("assets/lasgna.jpg"),
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
                        "Lasagna",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "190 TL",
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
                    "-Kat kat yapılan bir makarna yemeğidir. Lazanya yapmak için genellikle makarna tabakaları, et sosu, beşamel sos ve rendelenmiş peynir kullanılır.",
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
                              image: AssetImage("assets/ossobuco.jpg"),
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
                        "Ossobuco",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "320 TL ",
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
                    "- Milana özgü bir yemektir. Bu yemek, jülyen doğranmış sebzeler, beyaz şarap, et suyu ve dana inciklerinin birleşimiyle yapılan bir yahni çeşididir.",
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
                              image: AssetImage("assets/ravioli.jpg"),
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
                        "Ravioli",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "410 TL ",
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
                    "-İçi doldurulmuş taze veya kuru makarna hamurlarından yapılan bir İtalyan yemeğidir. İç harcı genellikle peynir, et, sebze veya mantar gibi malzemelerden oluşur.",
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
                              image: AssetImage("assets/risotto.jpg"),
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
                        "",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "540 TL ",
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
                    "-Kremsi ve lezzetli bir pirinç yemeğidir. Ana malzeme olarak Arborio veya Carnaroli pirinci kullanılır ve genellikle sebzeler, et veya deniz ürünleriyle zenginleştirilir.",
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
