
# Yemekcii - Yemek Sipariş Uygulaması

Yemekcii, Flutter ile geliştirilen ve Firebase altyapısını kullanan modern bir yemek sipariş uygulamasıdır. Kullanıcıların kolayca kayıt olmasına, giriş yapmasına, ürünleri görüntülemesine, sepetine eklemesine ve favorilerine eklemesine olanak tanır.

## Özellikler

- **Kullanıcı Kaydı ve Girişi**: Firebase Authentication kullanılarak güvenli kayıt ve giriş işlemleri.
- **Ürün Listeleme**: Firebase Firestore'dan dinamik olarak yemek ürünlerinin listelenmesi.
- **Sepete Ürün Ekleme**: Kullanıcılar istedikleri ürünleri sepetlerine ekleyebilir, sepet içeriğini görüntüleyebilir ve yönetebilir.
- **Favorilere Ekleme**: Beğenilen ürünler favorilere eklenebilir ve kolay erişim sağlanabilir.
- **Gerçek Zamanlı Veri Senkronizasyonu**: Firestore ile veriler anlık güncellenir.
- **Responsive Tasarım**: Hem Android hem iOS cihazlarda sorunsuz çalışır.

## Kullanılan Teknolojiler

- [Flutter](https://flutter.dev/) — Uygulama geliştirme framework'ü
- [Firebase Authentication](https://firebase.google.com/products/auth) — Kullanıcı kimlik doğrulama
- [Cloud Firestore](https://firebase.google.com/products/firestore) — Gerçek zamanlı veritabanı
- [Firebase Storage](https://firebase.google.com/products/storage) — Ürün resimleri için dosya depolama

## Kurulum ve Çalıştırma

1. Repository'yi klonlayın:
    ```bash
    git clone <repo-link>
    cd Yemekcii
    ```

2. Gerekli Flutter paketlerini yükleyin:
    ```bash
    flutter pub get
    ```

3. Firebase projesi oluşturun ve uygulamanızı Firebase'e kaydedin.  
   - Android ve iOS için gerekli `google-services.json` ve `GoogleService-Info.plist` dosyalarını indirin.
   - Bu dosyaları sırasıyla `android/app/` ve `ios/Runner/` klasörlerine yerleştirin.

4. Firebase Firestore ve Authentication ayarlarını yapılandırın.  
   - Firestore’da `products` koleksiyonunu oluşturun ve ürün bilgilerini ekleyin.

5. Uygulamayı çalıştırın:
    ```bash
    flutter run
    ```

## Uygulama Özellikleri Detayları

### 1. Kayıt Olma ve Giriş Yapma
- E-posta ve şifre ile kayıt olma.
- Kayıtlı kullanıcıların giriş yapması.
- Firebase Authentication üzerinden yönetim.

### 2. Ürün Listeleme
- Firestore'dan ürünlerin anlık çekilmesi.
- Ürün resmi, adı, açıklaması ve fiyat bilgileri gösterilir.

### 3. Sepet Yönetimi
- Ürünleri sepete ekleme ve çıkarma.
- Sepetteki toplam tutar hesaplama.
- Sepet içeriği ekranda gösterilir.

### 4. Favorilere Ekleme
- Kullanıcı ürünleri favorilere ekleyip çıkarabilir.
- Favori ürünlere hızlı erişim sağlanır.
