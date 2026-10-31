// Ozgun, elle yazilmis YDS / ALES tarzi cumleler.
// Bicim: ingilizce || dogru ceviri || yanlis (ama makul gorunen) ceviri
const String rawSentences = r'''
Researchers have found that regular exercise can significantly improve memory.||Araştırmacılar, düzenli egzersizin hafızayı önemli ölçüde geliştirebileceğini bulmuştur.||Araştırmacılar, düzenli egzersizin hafızayı zayıflatabileceğini bulmuştur.
Despite the heavy rain, the conference started on time.||Şiddetli yağmura rağmen konferans zamanında başladı.||Şiddetli yağmur yüzünden konferans ertelendi.
The new policy aims to reduce air pollution in large cities.||Yeni politika, büyük şehirlerdeki hava kirliliğini azaltmayı amaçlıyor.||Yeni politika, küçük kasabalardaki su kirliliğini ölçmeyi amaçlıyor.
Many species are at risk of extinction due to habitat loss.||Pek çok tür, yaşam alanı kaybı nedeniyle yok olma tehlikesiyle karşı karşıyadır.||Pek çok tür, yaşam alanları genişlediği için hızla çoğalmaktadır.
It is widely accepted that sleep plays a vital role in learning.||Uykunun öğrenmede hayati bir rol oynadığı yaygın olarak kabul edilmektedir.||Uykunun öğrenme üzerinde hiçbir etkisi olmadığı yaygın olarak kabul edilmektedir.
The results of the study were not consistent with earlier findings.||Çalışmanın sonuçları önceki bulgularla tutarlı değildi.||Çalışmanın sonuçları önceki bulguları tamamen doğruladı.
Unless the government takes action, unemployment will continue to rise.||Hükümet harekete geçmedikçe işsizlik artmaya devam edecek.||Hükümet harekete geçtiği için işsizlik azalmaya başladı.
Scientists are trying to develop a vaccine that is both safe and effective.||Bilim insanları hem güvenli hem de etkili bir aşı geliştirmeye çalışıyor.||Bilim insanları güvenli olmayan bir aşıyı piyasadan çekmeye çalışıyor.
The museum attracts thousands of visitors every summer.||Müze her yaz binlerce ziyaretçi çekiyor.||Müze yaz aylarında ziyaretçilere kapalı oluyor.
Although the theory is popular, there is little evidence to support it.||Teori popüler olsa da onu destekleyen çok az kanıt vardır.||Teori popüler olduğu için onu destekleyen pek çok kanıt vardır.
Children who read regularly tend to have a richer vocabulary.||Düzenli okuyan çocukların daha zengin bir kelime dağarcığına sahip olma eğilimi vardır.||Düzenli okuyan çocuklar yeni kelimeleri daha zor öğrenir.
The company decided to postpone the launch of its new product.||Şirket yeni ürününün lansmanını ertelemeye karar verdi.||Şirket yeni ürününü erkenden piyasaya sürmeye karar verdi.
Climate change is expected to affect agriculture in many regions.||İklim değişikliğinin birçok bölgede tarımı etkilemesi beklenmektedir.||İklim değişikliğinin tarım üzerinde etkisi olmayacağı düşünülmektedir.
Access to clean water remains a serious problem in some countries.||Temiz suya erişim bazı ülkelerde ciddi bir sorun olmaya devam ediyor.||Temiz suya erişim artık hiçbir ülkede sorun değil.
The author argues that technology has changed the way we communicate.||Yazar, teknolojinin iletişim kurma biçimimizi değiştirdiğini savunuyor.||Yazar, teknolojinin iletişimimizi hiç etkilemediğini savunuyor.
Ancient civilizations relied heavily on rivers for farming.||Antik uygarlıklar tarım için büyük ölçüde nehirlere bağımlıydı.||Antik uygarlıklar tarım yerine ticarete yönelmişti.
The patient's condition gradually improved after the treatment.||Hastanın durumu tedaviden sonra yavaş yavaş iyileşti.||Hastanın durumu tedaviden sonra aniden kötüleşti.
Experts warn that the use of antibiotics should be carefully controlled.||Uzmanlar, antibiyotik kullanımının dikkatle kontrol edilmesi gerektiği konusunda uyarıyor.||Uzmanlar, antibiyotiklerin herkes tarafından serbestçe kullanılmasını öneriyor.
Not only is the method cheap, but it is also easy to apply.||Yöntem yalnızca ucuz değil, aynı zamanda uygulaması da kolaydır.||Yöntem ucuz olmasına rağmen uygulaması oldukça zordur.
The survey was conducted among university students in three cities.||Anket üç şehirdeki üniversite öğrencileri arasında yapıldı.||Anket üç ülkedeki lise öğretmenleri arasında yapıldı.
If the bridge had been inspected earlier, the accident could have been prevented.||Köprü daha önce denetlenmiş olsaydı kaza önlenebilirdi.||Köprü düzenli denetlendiği için kaza önlendi.
Renewable energy sources are becoming increasingly affordable.||Yenilenebilir enerji kaynakları giderek daha uygun fiyatlı hâle geliyor.||Yenilenebilir enerji kaynakları her geçen yıl daha pahalı hâle geliyor.
The ability to adapt is essential for survival in nature.||Doğada hayatta kalmak için uyum sağlama yeteneği şarttır.||Doğada hayatta kalmak için uyum sağlamaya gerek yoktur.
Social media can spread false information very quickly.||Sosyal medya yanlış bilgiyi çok hızlı yayabilir.||Sosyal medya yanlış bilgiyi hızla tespit edip siler.
The economy grew faster than economists had predicted.||Ekonomi, ekonomistlerin tahmin ettiğinden daha hızlı büyüdü.||Ekonomi, ekonomistlerin tahmin ettiğinden daha yavaş büyüdü.
Bees play a crucial role in the pollination of many crops.||Arılar birçok ürünün tozlaşmasında çok önemli bir rol oynar.||Arılar birçok ürüne zarar veren zararlılardır.
The findings suggest that stress may weaken the immune system.||Bulgular, stresin bağışıklık sistemini zayıflatabileceğini gösteriyor.||Bulgular, stresin bağışıklık sistemini güçlendirdiğini gösteriyor.
Students are required to submit their projects by Friday.||Öğrencilerin projelerini cuma gününe kadar teslim etmeleri gerekiyor.||Öğrenciler projelerini istedikleri zaman teslim edebilir.
Rather than solving the problem, the new law made it worse.||Yeni yasa sorunu çözmek yerine daha da kötüleştirdi.||Yeni yasa sorunu kısa sürede tamamen çözdü.
Most of the city was rebuilt after the earthquake.||Şehrin büyük bir kısmı depremden sonra yeniden inşa edildi.||Şehrin büyük bir kısmı depremden sonra terk edildi.
Learning a second language may delay memory problems in old age.||İkinci bir dil öğrenmek yaşlılıkta hafıza sorunlarını geciktirebilir.||İkinci bir dil öğrenmek yaşlılıkta hafıza sorunlarına yol açar.
The volcano has not erupted for more than two hundred years.||Yanardağ iki yüz yılı aşkın süredir patlamadı.||Yanardağ son iki yüz yılda birçok kez patladı.
Fewer people are buying newspapers than a decade ago.||On yıl öncesine göre daha az insan gazete satın alıyor.||On yıl öncesine göre daha fazla insan gazete satın alıyor.
The data were collected over a period of five years.||Veriler beş yıllık bir süre boyunca toplandı.||Veriler yalnızca beş hafta içinde toplandı.
Even small changes in diet can have a large impact on health.||Beslenmedeki küçük değişiklikler bile sağlık üzerinde büyük bir etki yaratabilir.||Beslenmedeki küçük değişikliklerin sağlık üzerinde hiçbir etkisi yoktur.
The professor encouraged her students to question everything.||Profesör, öğrencilerini her şeyi sorgulamaya teşvik etti.||Profesör, öğrencilerinin hiçbir şeyi sorgulamamasını istedi.
Oceans absorb a large amount of the carbon dioxide we produce.||Okyanuslar ürettiğimiz karbondioksitin büyük bir kısmını emer.||Okyanuslar ürettiğimiz karbondioksitin büyük bir kısmını havaya geri salar.
Thanks to new technology, the disease can now be diagnosed earlier.||Yeni teknoloji sayesinde hastalık artık daha erken teşhis edilebiliyor.||Yeni teknolojiye rağmen hastalık hâlâ teşhis edilemiyor.
The village is so remote that it can only be reached on foot.||Köy o kadar uzakta ki ancak yürüyerek ulaşılabiliyor.||Köy şehre çok yakın olduğu için arabayla kolayca ulaşılabiliyor.
Both teachers and parents agreed that the exam was too difficult.||Hem öğretmenler hem de veliler sınavın çok zor olduğu konusunda hemfikirdi.||Öğretmenler sınavı zor bulurken veliler çok kolay buldu.
''';
