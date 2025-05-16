# Yemekcii - Flutter Yemek Sipariş ve Keşif Uygulaması

Yemekcii, Flutter ile geliştirilen, Firebase ve SQLite tabanlı modern bir yemek sipariş ve keşif uygulamasıdır.  
Kullanıcıların güvenli bir şekilde kayıt olması, giriş yapması, ürünleri keşfetmesi, sepetine ürün eklemesi, favori listesine ürün eklemesi gibi birçok özelliği destekler.  
Ayrıca kullanıcı dostu fonksiyonlar sunar.

---


## Uygulama Ekran Görüntüleri

<p align="center">
  <img src="readmeimg/img1.png" style="width:250px; height:450px; object-fit: cover;" alt="Ana Sayfa" />
  <img src="readmeimg/img2.png" style="width:250px; height:450px; object-fit: cover;" alt="Ürün Detay" />
  <img src="readmeimg/img4.png" style="width:250px; height:450px; object-fit: cover;" alt="Sepet Ekranı" />
</p>


---

## Özellikler

- **Kullanıcı Kaydı ve Girişi**  
  Firebase Authentication ile e-posta ve şifre kullanarak güvenli kullanıcı yönetimi.

- **Ürün Listeleme ve Keşfetme**  
  Firestore'dan anlık veri çekimi ile ürünleri ve içerikleri görüntüleyip keşfetme.

- **Favorilere Ekleme**  
  Beğenilen ürünleri favorilere ekleyerek kolay erişim.

- **Harici Linklerle Ürün Tanıtımı**  
  Ürün detaylarından harici site ve bağlantılara yönlendirme (URL Launcher).

- **Responsive ve Modern Arayüz**  
  Tüm ekran boyutlarına uyumlu modern ve kullanıcı dostu tasarım.

---

## Kullanılan Teknolojiler ve Kütüphaneler

| Teknoloji | Açıklama |
|-----------|----------|
| Flutter | Mobil uygulama geliştirme framework'ü |
| Firebase Authentication | Kullanıcı kimlik doğrulama |
| Firebase Storage | Ürün ve içerik görselleri için dosya depolama |
| Carousel Slider | Ürünler ve banner'lar için slider |
| URL Launcher | Harici bağlantı ve site açma |
---

## Kurulum ve Çalıştırma

1. Repository'yi klonlayın:
    ```bash
    git clone repo-link
    cd yemekcii
    ```

2. Flutter bağımlılıklarını yükleyin:
    ```bash
    flutter pub get
    ```

3. Firebase kurulumu:
    - Firebase projenizi oluşturun.
    - `google-services.json` dosyasını `android/app` dizinine ekleyin.
    - `GoogleService-Info.plist` dosyasını `ios/Runner` dizinine ekleyin.

4. Firestore'da `products` koleksiyonu ve gerekli dökümanları oluşturun.

5. Uygulamayı başlatın:
    ```bash
    flutter run
    ```

---

## Modüller ve Özellik Detayları

### 1. Kullanıcı Yönetimi
- Firebase Authentication ile kullanıcı kayıt ve giriş işlemleri.
- Oturum yönetimi ve kullanıcı bilgisi güncelleme.

### 2. Sepet ve Favoriler
- Ürünleri sepete ekleme, çıkarma, güncelleme.
- Favorilere ekleme ve favoriler ekranında listeleme.

---

