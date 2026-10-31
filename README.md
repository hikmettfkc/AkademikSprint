# DilSprint

YDS ve ALES'e hazırlananlar için TikTok / Reels tarzı, dikey kaydırmalı kelime ve cümle çeviri uygulaması (Flutter).

- Her kart yeni bir kelime veya cümle. Yukarı kaydırınca sıradakine geçilir.
- Her soruda yalnızca **iki şık** var. Amaç "yapamam" değil, "yapabilirsin" hissi vermek.
- İki cevaplama modu: **Kaydır** (kartı doğru tarafa at) ve **Dokun** (şıkka dokun).
- **Seviye:** Kolay, Orta, Zor veya Karışık. **İçerik:** Kelime, Cümle veya Karışık.
- **Sprint:** 20, 50, 100 kart veya Sonsuz. Sprint sonunda doğrular, süre, en iyi seri ve tekrar edilecek kelimeler.
- Yanlış yapılan öğe birkaç kart sonra tekrar sorulur.
- Doğru / yanlış sesleri ve hafif titreşim (ayarlardan kapatılabilir, iPhone sessiz moduna uyar).
- Animasyonlu açılış ve ilk açılışta 4 adımlık tanıtım.
- Pastel, kalın çerçeveli oyun tarzı açık tema. Koyu mod ve emoji yok.
- Üyelik yok. İlerleme cihazda (`shared_preferences`) tutulur.

## Çalıştırma

```bash
flutter pub get
flutter run            # bağlı telefon veya emülatör
flutter run -d chrome  # tarayıcıda deneme
flutter test
```

## Klasör yapısı

| Dosya | Görev |
| --- | --- |
| `lib/data/word_data.dart` | Kelime listesi (`ingilizce\|türkçe\|tür\|seviye`), 1678 kelime |
| `lib/data/sentence_data.dart` | Cümleler (`ingilizce\|\|doğru çeviri\|\|yanlış çeviri`) |
| `lib/question_engine.dart` | Sonsuz soru akışı, çeldirici seçimi, yanlışları tekrar sorma |
| `lib/screens/home_screen.dart` | Mod seçimi ve istatistikler |
| `lib/screens/feed_screen.dart` | Dikey kaydırmalı akış |
| `lib/widgets/question_card.dart` | Kaydır / Dokun kartı ve geri bildirim |
| `lib/theme.dart` | Pastel renk paleti |

## İçerik ve telif

Kelime listesi (1678 kelime: 585 kolay, 650 orta, 443 zor) ve 40 cümle bu proje için yazılmıştır. Ses efektleri (`assets/sounds`) kodla üretilmiştir. Başka uygulama veya sitelerden kelime listesi, çeviri ya da örnek cümle **kopyalanmamalıdır**; bunlar derleme eser olarak telifle korunabilir. Liste büyütülürken:

- Kendi listenizi yazın veya üretin, ardından elle kontrol edin.
- Açık lisanslı kaynak kullanacaksanız lisansına uyun ve kaynak gösterin (ör. Tatoeba cümleleri CC BY 2.0, Wiktionary CC BY-SA).

Nunito fontu SIL Open Font License ile dağıtılır (`assets/fonts/OFL.txt`).

## Yol haritası

1. Kelime listesini 3000-5000'e çıkarmak, cümle sayısını artırmak.
2. Telaffuz (TTS) ve "öğrendiklerim" listesi.
3. Google AdMob ile reklam (ör. her 15-20 kartta bir doğal yerleşim).
4. Reklamsız / premium sürüm (uygulama içi satın alma).
