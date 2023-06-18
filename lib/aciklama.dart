import 'package:flutter/material.dart';

class AciklamaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime[200],
      appBar: AppBar(
        backgroundColor: Colors.lime,
        title: Text('Yemekcii  "Neden Biz?"'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Yemekcii Sipariş Uygulaması ile Lezzeti Kapınıza Getirin!',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Neden Biz?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Yemekcii Sipariş Uygulaması ile Lezzeti Kapınıza Getirin!\n'
                'Yoğun bir günün ardından yemek hazırlamak zor gelebilir ya da farklı lezzetler denemek isteyebilirsiniz. İşte tam da bu noktada Yemek Sipariş Uygulaması devreye giriyor ve size birbirinden çeşitli restoranlar ve yemek seçenekleri sunarak lezzeti kapınıza getiriyor.\n\n'
                'Geniş Restoran Ağı: Yemek Sipariş Uygulaması, geniş bir restoran ağına sahiptir. İstediğiniz mutfak türünde restoranlar arasından seçim yapabilir, Türk, İtalyan, Çin, Hint gibi birçok lezzeti keşfedebilirsiniz. Ayrıca, restoranların menülerine göz atabilir, fiyatları karşılaştırabilir ve yemekler hakkında detaylı bilgilere ulaşabilirsiniz.\n\n'
                'Kolay ve Hızlı Sipariş: Yemek siparişi vermek hiç bu kadar kolay olmamıştı! Uygulama arayüzü kullanıcı dostu olup, birkaç adımda siparişinizi tamamlayabilirsiniz. Menüden istediğiniz yemeği seçin, ekstraları belirtin ve ödeme işlemini tamamlayın. Siparişiniz hızla restorana iletilir ve en kısa sürede kapınıza gelir. Zamandan tasarruf ederken lezzeti yaşamanın keyfini çıkarın.\n\n'
                'Özel Kampanyalar ve İndirimler: Yemek Sipariş Uygulaması, kullanıcılarına sürekli olarak özel kampanyalar ve indirimler sunar. Restoranların güncel indirimlerini takip edebilir, kampanyalı menülerden faydalanabilirsiniz. Bu sayede hem damak zevkinize uygun yemekleri uygun fiyatlarla deneyebilir, hem de bütçenizi koruyabilirsiniz.\n\n'
                'Kişiselleştirilmiş Tavsiyeler: Yemek Sipariş Uygulaması, kullanıcılarına kişiselleştirilmiş tavsiyeler sunarak lezzet deneyiminizi daha da zenginleştirir. Sipariş geçmişinizi analiz ederek sizin için en uygun yemekleri önerir, sevdiğiniz restoranları ve yemekleri hatırlar. Böylece her seferinde size özel seçenekleri keşfedebilirsiniz.\n',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
