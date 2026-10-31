// Ozgun, elle yazilmis akademik / sinav tarzi cumleler.
// Bicim: ingilizce || dogru ceviri || yanlis (ama makul gorunen) ceviri [|| seviye]
// Seviye yazilmazsa cumle uzunluguna gore belirlenir.
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
Water boils at 100 degrees Celsius at sea level.||Su, deniz seviyesinde 100 santigrat derecede kaynar.||Su, deniz seviyesinde 100 santigrat derecede donar.
She gave up smoking two years ago.||İki yıl önce sigarayı bıraktı.||İki yıl önce sigaraya başladı.
The meeting was called off because of the storm.||Toplantı fırtına yüzünden iptal edildi.||Toplantı fırtınaya rağmen yapıldı.
Plants need sunlight to grow.||Bitkilerin büyümek için güneş ışığına ihtiyacı vardır.||Bitkiler güneş ışığı olmadan daha hızlı büyür.
He is looking forward to his graduation.||Mezuniyetini dört gözle bekliyor.||Mezuniyetinden endişe ediyor.
The team carried out a new experiment last week.||Ekip geçen hafta yeni bir deney gerçekleştirdi.||Ekip geçen hafta yeni bir deneyi iptal etti.
Most students prefer studying in the library.||Öğrencilerin çoğu kütüphanede çalışmayı tercih ediyor.||Öğrencilerin çoğu kütüphanede çalışmaktan hoşlanmıyor.
Fast food is often high in salt and sugar.||Fast food genellikle tuz ve şeker bakımından zengindir.||Fast food genellikle tuz ve şeker içermez.
The price of oil has risen sharply this year.||Petrol fiyatı bu yıl keskin bir şekilde yükseldi.||Petrol fiyatı bu yıl keskin bir şekilde düştü.
Our town is famous for its old bridges.||Kasabamız eski köprüleriyle ünlüdür.||Kasabamızda hiç eski köprü yoktur.
The children were too tired to finish the game.||Çocuklar oyunu bitiremeyecek kadar yorgundu.||Çocuklar oyunu bitirdikten sonra hiç yorulmadı.
I could not find out who had sent the letter.||Mektubu kimin gönderdiğini öğrenemedim.||Mektubu kendim gönderdim.
Many people work from home these days.||Bugünlerde pek çok insan evden çalışıyor.||Bugünlerde kimse evden çalışmıyor.
The new bridge will be completed next year.||Yeni köprü gelecek yıl tamamlanacak.||Yeni köprü geçen yıl yıkıldı.
Tea is the most popular drink in Turkey.||Çay, Türkiye'de en popüler içecektir.||Türkiye'de çay neredeyse hiç içilmez.
The doctor advised him to drink more water.||Doktor ona daha fazla su içmesini tavsiye etti.||Doktor ona su içmeyi bırakmasını söyledi.
Cars produce a large amount of air pollution.||Arabalar büyük miktarda hava kirliliği üretir.||Arabalar havayı temizlemeye yardımcı olur.
Some birds fly thousands of kilometres every year.||Bazı kuşlar her yıl binlerce kilometre uçar.||Bazı kuşlar hayatı boyunca hiç uçmaz.
The library is closed on Sundays.||Kütüphane pazar günleri kapalıdır.||Kütüphane yalnızca pazar günleri açıktır.
She managed to finish the report on time.||Raporu zamanında bitirmeyi başardı.||Raporu zamanında bitiremedi.
Although he was ill, he went to work.||Hasta olmasına rağmen işe gitti.||Hasta olduğu için işe gitmedi.
Unless you study regularly, you will forget new words.||Düzenli çalışmadıkça yeni kelimeleri unutursun.||Düzenli çalışsan bile yeni kelimeleri unutursun.
The factory was shut down due to safety concerns.||Fabrika güvenlik endişeleri nedeniyle kapatıldı.||Fabrika güvenlik önlemleri sayesinde genişletildi.
Whereas some people enjoy crowds, others prefer silence.||Bazı insanlar kalabalıktan hoşlanırken diğerleri sessizliği tercih eder.||Herkes kalabalıktan da sessizlikten de aynı ölçüde hoşlanır.
The project was postponed owing to a lack of funding.||Proje, fon eksikliği yüzünden ertelendi.||Proje, yeterli fon bulunduğu için hızlandırıldı.
In spite of the warnings, many people swam in the sea.||Uyarılara rağmen pek çok kişi denizde yüzdü.||Uyarılar nedeniyle kimse denizde yüzmedi.
The disease mainly affects older adults.||Hastalık esas olarak yaşlı yetişkinleri etkiler.||Hastalık yalnızca küçük çocukları etkiler.
Scientists have come up with a new way to store energy.||Bilim insanları enerji depolamak için yeni bir yol buldu.||Bilim insanları enerji depolamanın imkânsız olduğunu açıkladı.
Poor diet can lead to serious health problems.||Kötü beslenme ciddi sağlık sorunlarına yol açabilir.||Kötü beslenmenin sağlık üzerinde hiçbir etkisi yoktur.
The company plans to cut down on paper use.||Şirket kâğıt kullanımını azaltmayı planlıyor.||Şirket kâğıt kullanımını iki katına çıkarmayı planlıyor.
Provided that the weather is good, the trip will go ahead.||Hava iyi olduğu takdirde gezi yapılacak.||Hava ne olursa olsun gezi iptal edilecek.
The museum houses more than ten thousand ancient objects.||Müze on binden fazla antik eseri barındırıyor.||Müzede yalnızca birkaç modern eser bulunuyor.
Online courses allow students to learn at their own pace.||Çevrim içi dersler öğrencilerin kendi hızlarında öğrenmelerine olanak tanır.||Çevrim içi dersler öğrencileri herkesle aynı hızda öğrenmeye zorlar.
Life expectancy has increased considerably over the last century.||Ortalama yaşam süresi son yüzyılda önemli ölçüde arttı.||Ortalama yaşam süresi son yüzyılda belirgin biçimde kısaldı.
The new law aims to protect endangered species.||Yeni yasa, nesli tehlikedeki türleri korumayı amaçlıyor.||Yeni yasa, nesli tehlikedeki türlerin avlanmasına izin veriyor.
Many young people find it difficult to buy a house.||Pek çok genç ev satın almakta zorlanıyor.||Gençlerin çoğu kolayca ev satın alabiliyor.
Despite its small size, the country has a strong economy.||Küçük olmasına rağmen ülkenin güçlü bir ekonomisi var.||Küçük olduğu için ülkenin ekonomisi çok zayıf.
The experiment was repeated in order to confirm the results.||Sonuçları doğrulamak için deney tekrarlandı.||Sonuçlar doğrulandığı için deneye son verildi.
Bilingual children often perform well on attention tasks.||İki dilli çocuklar dikkat görevlerinde çoğu zaman iyi performans gösterir.||İki dilli çocuklar dikkat görevlerinde her zaman başarısız olur.
The survey shows that people trust doctors more than politicians.||Anket, insanların doktorlara politikacılardan daha çok güvendiğini gösteriyor.||Anket, insanların politikacılara doktorlardan daha çok güvendiğini gösteriyor.
Exercise not only improves fitness but also reduces stress.||Egzersiz yalnızca zindeliği artırmakla kalmaz, stresi de azaltır.||Egzersiz zindeliği artırır ama stresi de yükseltir.
Rising sea levels pose a threat to coastal cities.||Yükselen deniz seviyeleri kıyı kentleri için bir tehdit oluşturuyor.||Yükselen deniz seviyeleri kıyı kentlerini daha güvenli hale getiriyor.
The government has decided to phase out coal power plants.||Hükümet kömür santrallerini aşamalı olarak kapatmaya karar verdi.||Hükümet yeni kömür santralleri inşa etmeye karar verdi.
It is often difficult to distinguish facts from opinions online.||İnternette gerçekleri görüşlerden ayırmak çoğu zaman zordur.||İnternette gerçekleri görüşlerden ayırmak her zaman çok kolaydır.
Antibiotics are ineffective against viruses.||Antibiyotikler virüslere karşı etkisizdir.||Antibiyotikler virüslere karşı en etkili ilaçlardır.
The findings were published in a leading scientific journal.||Bulgular önde gelen bir bilimsel dergide yayımlandı.||Bulgular hiçbir dergide yayımlanmadı.
Inflation has reduced the purchasing power of families.||Enflasyon ailelerin satın alma gücünü azalttı.||Enflasyon ailelerin satın alma gücünü artırdı.
Researchers are looking into the causes of the decline.||Araştırmacılar düşüşün nedenlerini inceliyor.||Araştırmacılar düşüşün nedenlerini görmezden geliyor.
The species became extinct at the end of the Ice Age.||Tür, Buzul Çağı'nın sonunda yok oldu.||Tür, Buzul Çağı'nın sonunda ortaya çıktı.
Smartphones have changed the way people read the news.||Akıllı telefonlar insanların haber okuma biçimini değiştirdi.||Akıllı telefonlar insanların haber okuma alışkanlıklarını hiç etkilemedi.
Since the bridge was damaged, traffic has been diverted.||Köprü hasar gördüğü için trafik başka yöne yönlendirildi.||Köprü onarıldığı için trafik yeniden açıldı.
The volunteers helped to clean up the beach after the festival.||Gönüllüler festivalden sonra plajın temizlenmesine yardım etti.||Gönüllüler festivalden sonra plajı kirli bıraktı.
A balanced diet should include fruit and vegetables.||Dengeli bir beslenme meyve ve sebzeyi içermelidir.||Dengeli bir beslenmede meyve ve sebzeye yer yoktur.
The author draws on her own childhood in the novel.||Yazar romanda kendi çocukluğundan yararlanıyor.||Yazar romanda kendi çocukluğundan hiç bahsetmiyor.
Many traditional crafts are dying out in rural areas.||Kırsal bölgelerde pek çok geleneksel zanaat yok olmaya yüz tutuyor.||Kırsal bölgelerde geleneksel zanaatlar hızla yayılıyor.
Rather than punishing students, the school tries to support them.||Okul, öğrencileri cezalandırmak yerine onları desteklemeye çalışıyor.||Okul, öğrencileri desteklemek yerine onları cezalandırmayı tercih ediyor.
Heavy rainfall caused widespread flooding in the region.||Şiddetli yağışlar bölgede yaygın sellere neden oldu.||Şiddetli yağışlara rağmen bölgede hiç sel olmadı.
The results suggest that the drug may have side effects.||Sonuçlar ilacın yan etkileri olabileceğini gösteriyor.||Sonuçlar ilacın kesinlikle yan etkisi olmadığını kanıtlıyor.
As long as you keep practising, your English will improve.||Pratik yapmaya devam ettiğin sürece İngilizcen gelişecek.||Pratik yapsan bile İngilizcen gelişmeyecek.
The population of the city has doubled since 1990.||Şehrin nüfusu 1990'dan beri iki katına çıktı.||Şehrin nüfusu 1990'dan beri yarıya indi.
Considering the risks, the plan seems too ambitious.||Riskler göz önüne alındığında plan fazla iddialı görünüyor.||Riskler göz önüne alındığında plan oldukça mütevazı görünüyor.
Although the theory was rejected at first, it is now widely accepted.||Teori ilk başta reddedilmiş olsa da bugün yaygın biçimde kabul görüyor.||Teori ilk başta kabul görmüş olsa da bugün tamamen reddediliyor.
The rapid growth of cities has put pressure on water supplies.||Kentlerin hızlı büyümesi su kaynakları üzerinde baskı oluşturdu.||Kentlerin hızlı büyümesi su kaynaklarını rahatlattı.
Owing to advances in medicine, many diseases can now be cured.||Tıptaki ilerlemeler sayesinde artık pek çok hastalık tedavi edilebiliyor.||Tıptaki ilerlemelere rağmen artık hiçbir hastalık tedavi edilemiyor.
The committee has not yet reached a final decision.||Komite henüz nihai bir karara varmadı.||Komite nihai kararını çoktan açıkladı.
Lack of sleep impairs our ability to concentrate.||Uyku eksikliği konsantre olma yeteneğimizi zayıflatır.||Uyku eksikliği konsantre olma yeteneğimizi güçlendirir.
The ancient city was buried under volcanic ash for centuries.||Antik kent yüzyıllarca volkanik kül altında kaldı.||Antik kent yüzyıllar boyunca ticaretin merkezi oldu.
Students who ask questions tend to learn more effectively.||Soru soran öğrenciler daha etkili öğrenme eğilimindedir.||Soru soran öğrenciler genellikle daha az öğrenir.
The treaty was signed by more than fifty countries.||Antlaşma elliden fazla ülke tarafından imzalandı.||Antlaşmayı yalnızca beş ülke reddetti.
Wind farms are becoming a common sight in many countries.||Rüzgâr çiftlikleri pek çok ülkede yaygın bir görüntü haline geliyor.||Rüzgâr çiftlikleri pek çok ülkede yasaklanıyor.
It was not until the 19th century that photography was invented.||Fotoğrafçılık ancak 19. yüzyılda icat edildi.||Fotoğrafçılık 19. yüzyıldan çok önce icat edilmişti.||3
No sooner had the film started than the lights went out.||Film başlar başlamaz ışıklar söndü.||Film bittikten çok sonra ışıklar söndü.||3
Hardly anyone noticed the change in the company's logo.||Şirketin logosundaki değişikliği neredeyse hiç kimse fark etmedi.||Şirketin logosundaki değişikliği herkes hemen fark etti.||3
The study was criticised on the grounds that the sample was too small.||Çalışma, örneklemin çok küçük olduğu gerekçesiyle eleştirildi.||Çalışma, örneklemin çok büyük olduğu için övgü aldı.
Contrary to popular belief, bats are not blind.||Yaygın inancın aksine yarasalar kör değildir.||Yaygın inanca uygun olarak yarasalar tamamen kördür.
Had the warning been taken seriously, the damage would have been limited.||Uyarı ciddiye alınsaydı hasar sınırlı kalırdı.||Uyarı ciddiye alındığı için hasar çok büyük oldu.||3
The more you read, the richer your vocabulary becomes.||Ne kadar çok okursan kelime dağarcığın o kadar zenginleşir.||Ne kadar çok okursan kelime dağarcığın o kadar daralır.
Neither the students nor the teachers were informed about the change.||Ne öğrenciler ne de öğretmenler değişiklik hakkında bilgilendirildi.||Hem öğrenciler hem öğretmenler değişiklikten önceden haberdardı.||3
The drug is effective, albeit with some minor side effects.||İlaç, bazı küçük yan etkileri olsa da etkilidir.||İlaç, hiçbir yan etkisi olmamasına rağmen etkisizdir.
Regardless of their age, all participants completed the test.||Yaşlarına bakılmaksızın tüm katılımcılar testi tamamladı.||Yalnızca genç katılımcılar testi tamamlayabildi.
The decline in bee populations stems from several factors.||Arı popülasyonlarındaki düşüş birkaç etkenden kaynaklanıyor.||Arı popülasyonlarındaki artış tek bir etkenden kaynaklanıyor.
Experts have ruled out the possibility of an earthquake.||Uzmanlar deprem olasılığını dışarıda bıraktı.||Uzmanlar depremin kesin olarak yaşanacağını açıkladı.
Such was the demand that the tickets sold out within minutes.||Talep o kadar yüksekti ki biletler dakikalar içinde tükendi.||Talep o kadar düşüktü ki biletlerin çoğu satılamadı.||3
The policy has been in effect for nearly a decade.||Politika yaklaşık on yıldır yürürlükte.||Politika yalnızca birkaç haftadır yürürlükte.
Only after the second trial did the researchers notice the error.||Araştırmacılar hatayı ancak ikinci denemeden sonra fark etti.||Araştırmacılar hatayı daha ilk denemeden önce fark etmişti.||3
The archaeologists unearthed a well-preserved Roman mosaic.||Arkeologlar iyi korunmuş bir Roma mozaiği gün yüzüne çıkardı.||Arkeologlar Roma mozaiğinin tamamen yok olduğunu açıkladı.
Insofar as the data are reliable, the conclusion seems valid.||Veriler güvenilir olduğu ölçüde sonuç geçerli görünüyor.||Veriler güvenilir olmadığı için sonuç kesinlikle geçersiz.||3
Despite repeated attempts, the negotiations broke down.||Tekrarlanan girişimlere rağmen müzakereler çöktü.||Tekrarlanan girişimler sayesinde müzakereler başarıyla sonuçlandı.
The vaccine has virtually eradicated the disease in many countries.||Aşı birçok ülkede hastalığı neredeyse tamamen ortadan kaldırdı.||Aşı birçok ülkede hastalığın yayılmasını hızlandırdı.
Urban green spaces contribute to the well-being of residents.||Kentsel yeşil alanlar sakinlerin refahına katkıda bulunur.||Kentsel yeşil alanlar sakinlerin sağlığına zarar verir.
The report sheds light on the working conditions of farm workers.||Rapor, tarım işçilerinin çalışma koşullarına ışık tutuyor.||Rapor, tarım işçilerinin çalışma koşullarını tamamen göz ardı ediyor.
Prior to the invention of the printing press, books were copied by hand.||Matbaanın icadından önce kitaplar elle kopyalanıyordu.||Matbaanın icadından sonra kitaplar yalnızca elle kopyalandı.
The economy is expected to recover gradually over the next two years.||Ekonominin önümüzdeki iki yıl içinde yavaş yavaş toparlanması bekleniyor.||Ekonominin önümüzdeki iki yıl içinde hızla küçülmesi bekleniyor.
Some critics argue that the reform does not go far enough.||Bazı eleştirmenler reformun yeterince ileri gitmediğini savunuyor.||Bazı eleştirmenler reformun çok fazla ileri gittiğini savunuyor.
Given that resources are limited, priorities must be set carefully.||Kaynakların sınırlı olduğu göz önüne alındığında öncelikler dikkatle belirlenmelidir.||Kaynaklar sınırsız olduğu için önceliklere gerek yoktur.||3
The extent to which genes determine intelligence remains controversial.||Genlerin zekâyı ne ölçüde belirlediği tartışmalı olmaya devam ediyor.||Genlerin zekâyı tamamen belirlediği artık kesin olarak kanıtlandı.||3
Childhood obesity has become a major public health concern.||Çocukluk çağı obezitesi önemli bir halk sağlığı sorunu haline geldi.||Çocukluk çağı obezitesi artık bir sağlık sorunu olarak görülmüyor.
The tribe has preserved its customs for hundreds of years.||Kabile geleneklerini yüzlerce yıldır korumuştur.||Kabile geleneklerini birkaç yıl içinde tamamen terk etti.
Mobile phones are banned during the exam lest students cheat.||Öğrenciler kopya çekmesin diye sınav sırasında cep telefonları yasaktır.||Öğrencilerin kopya çekebilmesi için sınavda cep telefonu serbesttir.
The new evidence casts doubt on the original theory.||Yeni kanıtlar ilk teori hakkında şüphe uyandırıyor.||Yeni kanıtlar ilk teoriyi kesin olarak doğruluyor.
Little did they know that the discovery would change medicine forever.||Keşfin tıbbı sonsuza dek değiştireceğinden hiç haberleri yoktu.||Keşfin tıbbı değiştirmeyeceğini baştan biliyorlardı.||3
The authorities were slow to respond to the crisis.||Yetkililer krize yanıt vermekte yavaş kaldı.||Yetkililer krize son derece hızlı yanıt verdi.
Deforestation accounts for a significant share of carbon emissions.||Ormansızlaşma karbon salımlarının önemli bir bölümünü oluşturuyor.||Ormansızlaşmanın karbon salımlarıyla hiçbir ilgisi yoktur.
While technology offers many benefits, it also raises ethical questions.||Teknoloji pek çok fayda sunarken etik soruları da beraberinde getiriyor.||Teknoloji hiçbir fayda sunmadığı için etik bir sorun da yaratmıyor.
''';
