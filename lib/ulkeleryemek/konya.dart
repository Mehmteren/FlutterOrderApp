import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class KonyaScreen extends StatefulWidget {
  const KonyaScreen({Key? key}) : super(key: key);

  @override
  State<KonyaScreen> createState() => _KonyaScreenState();
}

class _KonyaScreenState extends State<KonyaScreen> {
  List<Map<String, dynamic>> yemekListesi = [
    {
      'ad': 'Konya Düğün Pilavı',
      'fiyat': '90 TL',
      'aciklama':
          'Konya düğün pilavı, genellikle düğünlerde veya özel kutlamalarda servis edilen bir pilav türüdür. Bu pilav, pilav tanelerinin birbirine yapışmadığı, uzun ve gevrek bir yapıya sahiptir. Görüntü olarak beyaz ve tane taneli bir pilavdır.',
      'resim': 'assets/dugunpilav.jpg',
    },
    {
      'ad': 'Yağ Somunu',
      'fiyat': '80 TL',
      'aciklama':
          'Konya yağ somunu, yine Türk mutfağına özgü bir lezzet ve Konyanın meşhur tatlarından biridir ',
      'resim': 'assets/yagsomunu.jpeg',
    },
    {
      'ad': 'etli ekmek',
      'fiyat': '70 TL',
      'aciklama':
          ' Konyanın en ünlü yemeklerinden biridir. İnce hamurun üzerine kıyma, domates, biber, soğan ve baharatlarla hazırlanan bir tür pide şeklindeki yemeğe verilen isimdir.',
      'resim': 'assets/etliekmek.jpeg',
    },
    {
      'ad': 'Konya Mantısı',
      'fiyat': '80 TL',
      'aciklama':
          'Konyaya özgü bir mantı çeşididir. İnce hamurdan yapılan mantıların içerisinde kıyma, soğan ve baharatlar bulunur. Üzerine yoğurt ve salça ile servis edilir.',
      'resim': 'assets/manti.jpeg',
    },
    {
      'ad': 'Bamya Çorbası',
      'fiyat': '40 TL',
      'aciklama':
          ' Konya mutfağında bamya çorbası da sıkça yapılan bir çorbadır. Bamya, et, soğan ve baharatlarla pişirilerek hazırlanan bu çorba oldukça lezzetlidir.',
      'resim': 'assets/bamya.jpeg',
    },
    {
      'ad': 'Ayva Aşı',
      'fiyat': '65 TL',
      'aciklama':
          '  Konyanın tatlı çeşitlerinden biridir. Ayva, şeker ve su ile kaynatılarak hazırlanan bu tatlı, üzerine ceviz veya fındık ile servis edilir.',
      'resim': 'assets/ayvaas.jpeg',
    },
    {
      'ad': 'Mevlana Çorbası',
      'fiyat': '55 TL',
      'aciklama':
          ' Konyada özel günlerde ve dini törenlerde sıkça yapılan bir çorbadır. İçerisinde nohut, pirinç, et, soğan, mercimek ve baharatlar bulunur.',
      'resim': 'assets/mevlana.jpeg',
    },
    {
      'ad': 'Tirit',
      'fiyat': '130 TL',
      'aciklama':
          ' Konya tiritinin ana malzemeleri arasında dana eti, ekmek ve tavuk suyu bulunur. Yemeğin yapımı için öncelikle dana eti düdüklü tencerede veya normal tencerede yumuşayana kadar haşlanır. Haşlanan etler, daha sonra tavuk suyu ile beraber başka bir tencereye aktarılır.',
      'resim': 'assets/tirit.jpg',
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
        title: const Text('Yemekcii Gonya Yemekleri'),
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
                              image: AssetImage("assets/dugunpilav.jpg"),
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
                        "Düğün Pilavı",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "90 TL",
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
                    "-Konya düğün pilavı, genellikle düğünlerde veya özel kutlamalarda servis edilen bir pilav türüdür. Bu pilav, pilav tanelerinin birbirine yapışmadığı, uzun ve gevrek bir yapıya sahiptir. Görüntü olarak beyaz ve tane taneli bir pilavdır.",
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
                              image: AssetImage("assets/yagsomunu.jpeg"),
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
                        "Yağ Somunu",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "80 TL ",
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
                    "- Konya yağ somunu, yine Türk mutfağına özgü bir lezzet ve Konya'nın meşhur tatlarından biridir.",
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
                              image: AssetImage("assets/etliekmek.jpeg"),
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
                        "Etli Ekmek",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "70 TL ",
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
                    "-Konya'nın en ünlü yemeklerinden biridir. İnce hamurun üzerine kıyma, domates, biber, soğan ve baharatlarla hazırlanan bir tür pide şeklindeki yemeğe verilen isimdir.",
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
                              image: AssetImage("assets/manti.jpeg"),
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
                        "Konya Mantısı",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "80 TL ",
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
                    "-Konya'ya özgü bir mantı çeşididir. İnce hamurdan yapılan mantıların içerisinde kıyma, soğan ve baharatlar bulunur. Üzerine yoğurt ve salça ile servis edilir.",
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
                              image: AssetImage("assets/bamya.jpeg"),
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
                        "Bamya Çorbası",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "40 TL ",
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
                    "-Konya mutfağında bamya çorbası da sıkça yapılan bir çorbadır. Bamya, et, soğan ve baharatlarla pişirilerek hazırlanan bu çorba oldukça lezzetlidir.",
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
                              image: AssetImage("assets/ayvaas.jpeg"),
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
                        "Ayva Aşı",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "65 TL ",
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
                    "-Konya'nın tatlı çeşitlerinden biridir. Ayva, şeker ve su ile kaynatılarak hazırlanan bu tatlı, üzerine ceviz veya fındık ile servis edilir.",
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
                              image: AssetImage("assets/mevlana.jpeg"),
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
                        "Mevlana Çorbası",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "80 TL ",
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
                    "-Konya'da özel günlerde ve dini törenlerde sıkça yapılan bir çorbadır. İçerisinde nohut, pirinç, et, soğan, mercimek ve baharatlar bulunur.",
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
                              image: AssetImage("assets/tirit.jpg"),
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
                        "Tirit",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "130 TL ",
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
                    "-Konya tirit, Konya yöresine özgü bir yemek çeşididir. Tirit, genellikle bayramlarda, düğünlerde veya özel günlerde pişirilen bir et yemeğidir. Tirit, ağırlıklı olarak dana eti kullanılarak hazırlanır.",
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
