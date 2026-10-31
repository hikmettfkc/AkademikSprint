# DilSprint

YDS ve ALES'e hazırlananlar için TikTok / Reels tarzı, dikey kaydırmalı kelime ve cümle çeviri uygulaması (Flutter).

- Her kart yeni bir kelime veya cümle. Yukarı kaydırınca sıradakine geçilir.
- Her soruda yalnızca **iki şık** var. Amaç "yapamam" değil, "yapabilirsin" hissi vermek.
- İki cevaplama modu:
  - **Kaydır:** Kartı doğru cevabın olduğu tarafa (sağa veya sola) at.
  - **Dokun:** İki şıktan birine dokun.
- İçerik: Kelime, Cümle veya Karışık.
- İlk sorular kolay seviyeden gelir. Yanlış yapılan öğe birkaç kart sonra tekrar sorulur.
- Seri sayacı, oturum doğruları ve cesaretlendirici geri bildirimler.
- Pastel, oyun hissi veren açık tema. Koyu mod ve emoji yok.
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
| `lib/data/word_data.dart` | Kelime listesi (`ingilizce\|türkçe\|tür\|seviye`) |
| `lib/data/sentence_data.dart` | Cümleler (`ingilizce\|\|doğru çeviri\|\|yanlış çeviri`) |
| `lib/question_engine.dart` | Sonsuz soru akışı, çeldirici seçimi, yanlışları tekrar sorma |
| `lib/screens/home_screen.dart` | Mod seçimi ve istatistikler |
| `lib/screens/feed_screen.dart` | Dikey kaydırmalı akış |
| `lib/widgets/question_card.dart` | Kaydır / Dokun kartı ve geri bildirim |
| `lib/theme.dart` | Pastel renk paleti |

## İçerik ve telif

Başlangıç listesi (206 kelime, 40 cümle) bu proje için elle yazılmıştır. Başka uygulama veya sitelerden kelime listesi, çeviri ya da örnek cümle **kopyalanmamalıdır**; bunlar derleme eser olarak telifle korunabilir. Liste büyütülürken:

- Kendi listenizi yazın veya üretin, ardından elle kontrol edin.
- Açık lisanslı kaynak kullanacaksanız lisansına uyun ve kaynak gösterin (ör. Tatoeba cümleleri CC BY 2.0, Wiktionary CC BY-SA).

Nunito fontu SIL Open Font License ile dağıtılır (`assets/fonts/OFL.txt`).

## Yol haritası

1. Kelime listesini 3000-5000'e çıkarmak, cümle sayısını artırmak.
2. Telaffuz (TTS) ve "öğrendiklerim" listesi.
3. Google AdMob ile reklam (ör. her 15-20 kartta bir doğal yerleşim).
4. Reklamsız / premium sürüm (uygulama içi satın alma).
