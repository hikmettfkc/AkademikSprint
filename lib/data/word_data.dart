// Ozgun, elle hazirlanmis baslangic kelime listesi (YDS / ALES akademik kelimeler).
// Bicim: ingilizce | turkce | tur (v: fiil, n: isim, a: sifat, d: zarf/baglac) | seviye (1-3)
// Baska bir uygulama veya kitaptan kopyalanmamistir.
const String rawWords = r'''
abandon|terk etmek|v|1
abundant|bol, bereketli|a|2
accelerate|hızlandırmak|v|2
accompany|eşlik etmek|v|1
accomplish|başarmak|v|1
accumulate|biriktirmek|v|2
accurate|doğru, kesin|a|1
acknowledge|kabul etmek|v|2
acquire|edinmek|v|2
adequate|yeterli|a|1
adjacent|bitişik|a|3
advocate|savunmak|v|2
affect|etkilemek|v|1
aggravate|kötüleştirmek|v|3
allocate|tahsis etmek|v|2
alter|değiştirmek|v|1
ambiguous|belirsiz, muğlak|a|2
ample|bol, geniş|a|3
anticipate|öngörmek|v|2
apparent|açık, belli|a|1
approximately|yaklaşık olarak|d|1
arbitrary|keyfi|a|3
assess|değerlendirmek|v|1
assume|varsaymak|v|1
attain|ulaşmak, erişmek|v|2
attribute|atfetmek|v|2
avoid|kaçınmak|v|1
barely|ancak, zar zor|d|2
beneficial|faydalı|a|1
bias|önyargı|n|2
boost|artırmak|v|1
breakthrough|çığır açan buluş|n|2
burden|yük|n|1
capacity|kapasite|n|1
cease|sona ermek|v|2
coherent|tutarlı|a|2
coincide|aynı zamana denk gelmek|v|3
collapse|çökmek|v|1
compatible|uyumlu|a|2
compel|zorlamak|v|3
compensate|telafi etmek|v|2
comprehensive|kapsamlı|a|1
comprise|içermek, oluşmak|v|2
conceal|gizlemek|v|2
concur|hemfikir olmak|v|3
conduct|yürütmek|v|1
confine|sınırlamak|v|2
consequence|sonuç|n|1
considerable|oldukça büyük|a|1
consistent|tutarlı|a|1
constrain|kısıtlamak|v|2
contaminate|kirletmek|v|2
contemporary|çağdaş|a|2
contradict|çelişmek|v|2
controversial|tartışmalı|a|1
convey|iletmek, aktarmak|v|2
crucial|çok önemli|a|1
curb|dizginlemek|v|3
decline|azalmak|v|1
deficiency|eksiklik|n|2
deliberately|kasıtlı olarak|d|2
demonstrate|göstermek|v|1
deny|inkâr etmek|v|1
depict|tasvir etmek|v|2
deplete|tüketmek|v|3
deprive|yoksun bırakmak|v|2
derive|türetmek, elde etmek|v|2
detect|tespit etmek|v|1
deteriorate|kötüleşmek|v|2
devastating|yıkıcı|a|2
devote|adamak|v|2
diminish|azalmak|v|2
discard|atmak, çıkarmak|v|3
disclose|açıklamak, ifşa etmek|v|2
discrepancy|tutarsızlık|n|3
disrupt|bozmak, aksatmak|v|2
distinct|belirgin, farklı|a|1
diverse|çeşitli|a|1
dominant|baskın|a|1
drastic|sert, köklü|a|2
durable|dayanıklı|a|2
eliminate|ortadan kaldırmak|v|1
elaborate|ayrıntılı|a|2
eminent|seçkin, ünlü|a|3
emerge|ortaya çıkmak|v|1
emphasize|vurgulamak|v|1
enhance|geliştirmek|v|1
enormous|devasa|a|1
ensure|sağlamak, garantilemek|v|1
equivalent|eşdeğer|a|2
eradicate|kökünü kazımak|v|3
essential|temel, gerekli|a|1
estimate|tahmin etmek|v|1
evaluate|değerlendirmek|v|1
evident|açık, belli|a|1
evolve|evrimleşmek|v|2
exaggerate|abartmak|v|2
exceed|aşmak|v|2
exclude|hariç tutmak|v|2
exhaust|tüketmek|v|2
expand|genişlemek|v|1
explicit|açık, net|a|2
exploit|sömürmek|v|2
extinct|nesli tükenmiş|a|2
facilitate|kolaylaştırmak|v|2
feasible|uygulanabilir|a|2
flourish|gelişmek, serpilmek|v|3
fluctuate|dalgalanmak|v|3
fragile|kırılgan|a|2
fundamental|temel|a|1
gradually|yavaş yavaş|d|1
hamper|engellemek|v|3
hazardous|tehlikeli|a|2
hence|bu nedenle|d|2
hinder|engellemek|v|2
hypothesis|hipotez|n|1
identical|aynı, özdeş|a|1
illustrate|örneklendirmek|v|1
impair|zayıflatmak|v|3
implement|uygulamak|v|2
imply|ima etmek|v|2
impose|dayatmak|v|2
inevitable|kaçınılmaz|a|1
inherent|doğasında olan|a|3
inhibit|engellemek, baskılamak|v|3
initiate|başlatmak|v|2
innovative|yenilikçi|a|1
insight|kavrayış, iç görü|n|2
integrate|bütünleştirmek|v|2
intense|yoğun|a|1
interfere|müdahale etmek|v|2
interpret|yorumlamak|v|1
intervene|araya girmek|v|2
investigate|araştırmak|v|1
irrelevant|ilgisiz|a|1
justify|haklı çıkarmak|v|2
likewise|aynı şekilde|d|2
maintain|sürdürmek|v|1
mandatory|zorunlu|a|2
merely|sadece|d|2
mitigate|hafifletmek|v|3
modify|değiştirmek|v|1
moreover|üstelik|d|1
negligible|önemsiz, ihmal edilebilir|a|3
nevertheless|yine de|d|1
notion|kavram, fikir|n|2
notably|özellikle|d|2
numerous|çok sayıda|a|1
obscure|belirsiz, anlaşılmaz|a|3
obstacle|engel|n|1
obtain|elde etmek|v|1
obvious|apaçık|a|1
occur|meydana gelmek|v|1
offset|dengelemek|v|3
outcome|sonuç|n|1
overcome|üstesinden gelmek|v|1
overwhelming|ezici|a|2
paramount|en önemli|a|3
perceive|algılamak|v|2
persist|sürmek, devam etmek|v|2
plausible|akla yatkın|a|3
precise|kesin, tam|a|2
predominantly|ağırlıklı olarak|d|3
preserve|korumak|v|1
prevail|hâkim olmak|v|3
prevalent|yaygın|a|2
prohibit|yasaklamak|v|2
prominent|önde gelen|a|2
prompt|tetiklemek|v|2
prone|eğilimli|a|3
pursue|peşinden gitmek|v|2
reluctant|isteksiz|a|2
remarkable|dikkat çekici|a|1
render|hâle getirmek|v|3
reveal|ortaya çıkarmak|v|1
rigid|katı|a|2
robust|güçlü, sağlam|a|2
scarce|kıt|a|2
scrutiny|inceleme|n|3
severe|şiddetli|a|1
significant|önemli|a|1
simultaneously|aynı anda|d|2
sophisticated|karmaşık, gelişmiş|a|2
substantial|önemli, büyük|a|2
subtle|ince, belli belirsiz|a|3
sufficient|yeterli|a|1
supplement|takviye etmek|v|2
suppress|bastırmak|v|2
sustain|sürdürmek|v|2
tackle|ele almak|v|2
tedious|sıkıcı|a|3
temporary|geçici|a|1
thereby|böylece|d|2
thorough|ayrıntılı, titiz|a|2
thrive|gelişmek|v|2
undergo|geçirmek, maruz kalmak|v|2
undermine|zayıflatmak|v|3
unprecedented|eşi görülmemiş|a|2
utilize|kullanmak|v|1
vague|belirsiz|a|2
viable|uygulanabilir|a|3
vital|hayati|a|1
vulnerable|savunmasız|a|2
whereas|oysa|d|2
widespread|yaygın|a|1
yield|sağlamak, vermek|v|3
''';
