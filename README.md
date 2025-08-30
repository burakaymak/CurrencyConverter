# 💱 Currency Converter App

📱 **Currency Converter**, güncel döviz kurlarını **Fixer.io API** aracılığıyla alan ve kullanıcıya basit bir arayüzde sunan bir iOS uygulamasıdır.  
Amacı; **temiz, okunabilir ve genişletilebilir bir kod yapısı** ile temel API entegrasyonu ve veri işleme sürecini göstermektir.  

---

## ✨ Özellikler
- 🌍 Gerçek zamanlı kur bilgilerini görüntüleme  
- 🔄 CAD, CHF, GBP, JPY, USD, TRY gibi sık kullanılan para birimlerinin değerlerini anlık olarak listeleme  
- ⚠️ Hata veya ağ problemi durumunda kullanıcıya uyarı gösterme  

---

## 🧩 Mimari & Uygulama Akışı
Uygulama temel olarak **MVC (Model-View-Controller)** yapısı üzerine kuruludur.  

1. **ViewController**:
   - UI bileşenlerini yönetir (`UILabel`, `UIButton`)  
   - Kullanıcı etkileşimini yakalar (örneğin "Get Rates" butonuna basma)  
   - `URLSession` aracılığıyla API çağrısını başlatır  

2. **API Çağrısı**:
   - Fixer.io API’ye HTTPS isteği atılır (`URLSession.dataTask`)  
   - Gelen yanıt JSON formatında parse edilir (`JSONSerialization`)  

3. **Model**:
   - JSON verisinden çıkarılan kurlar, doğrudan UI üzerinde ilgili label’lara işlenir  
   - Gerektiğinde struct/class kullanılarak **model objelerine** dönüştürülebilir (örn. `CurrencyRate`)  

4. **Error Handling**:
   - Ağ hatası, JSON parse hatası veya API kaynaklı sorunlarda `UIAlertController` ile kullanıcı bilgilendirilir  

---

## 🛠 Kullanılan Teknolojiler
- **UIKit** → Görsel arayüz ve kullanıcı etkileşimi  
- **URLSession** → HTTP request/response yönetimi  
- **JSONSerialization** → API’den gelen JSON verisini çözümleme  
- **DispatchQueue.main.async** → UI güncellemelerini ana thread üzerinde güvenli şekilde yapmak  
- **UIAlertController** → Hataları veya bilgilendirmeleri kullanıcıya sunmak  

---

## 🧑‍💻 Koddan Önemli Noktalar
- **Asenkron Programlama**:  
  API çağrıları `URLSession.dataTask` ile arka planda yapılır. UI güncellemeleri için `DispatchQueue.main.async` kullanılır.  
  Bu sayede **UI donmaları engellenmiş olur**.  

- **Hata Yönetimi**:  
  - `if let error = error` ile ağ hataları yakalanır.  
  - JSON parsing sırasında `do-catch` ile istisnalar yönetilir.  
  - Kullanıcı dostu bir deneyim için hata mesajları **UIAlertController** üzerinden gösterilir.  

- **Genişletilebilirlik**:  
  - Şu an sadece belirli kurlar işleniyor (CAD, CHF, GBP, JPY, USD, TRY).  
  - Daha esnek hale getirmek için API’den gelen tüm kurları `Dictionary<String, Double>` olarak almak mümkün.  
  - Gelecekte bu dictionary üzerinden **dynamic table view** ile istenilen kur gösterilebilir.  

