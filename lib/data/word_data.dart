// Ozgun, elle hazirlanmis kelime listesi.
// Bicim: ingilizce | turkce | tur (v: fiil, n: isim, a: sifat, d: zarf/baglac) | seviye (1 kolay, 2 orta, 3 zor)
// Baska bir uygulama, kitap veya siteden kopyalanmamistir.
const String rawWords = r'''
abandon|terk etmek|v|1
ability|yetenek|n|1
absence|yokluk, devamsızlık|n|1
absolute|mutlak|a|1
absorb|emmek|v|1
academic|akademik|a|1
access|erişim|n|1
accident|kaza|n|1
accompany|eşlik etmek|v|1
accomplish|başarmak|v|1
account|hesap|n|1
accurate|doğru, kesin|a|1
achieve|başarmak|v|1
achievement|başarı|n|1
action|eylem|n|1
active|etkin, aktif|a|1
activity|etkinlik|n|1
actually|aslında|d|1
add|eklemek|v|1
addition|ekleme, ilave|n|1
adequate|yeterli|a|1
admire|hayran olmak|v|1
admit|itiraf etmek|v|1
adopt|benimsemek|v|1
adult|yetişkin|n|1
advance|ilerlemek|v|1
advantage|avantaj|n|1
advice|tavsiye|n|1
affect|etkilemek|v|1
afford|parası yetmek|v|1
afraid|korkmuş|a|1
agree|katılmak, hemfikir olmak|v|1
agreement|anlaşma|n|1
agriculture|tarım|n|1
aim|amaç|n|1
allow|izin vermek|v|1
almost|neredeyse|d|1
alone|yalnız|a|1
already|zaten|d|1
alter|değiştirmek|v|1
although|-e rağmen|d|1
amount|miktar|n|1
analyse|analiz etmek|v|1
ancient|antik, eski|a|1
announce|duyurmak|v|1
annual|yıllık|a|1
answer|cevap|n|1
anxious|endişeli|a|1
apparent|açık, belli|a|1
apply|başvurmak|v|1
appointment|randevu|n|1
appreciate|takdir etmek|v|1
approach|yaklaşım|n|1
appropriate|uygun|a|1
approve|onaylamak|v|1
approximately|yaklaşık olarak|d|1
area|alan, bölge|n|1
argue|tartışmak|v|1
argument|tartışma, argüman|n|1
arrange|düzenlemek|v|1
arrive|varmak|v|1
article|makale|n|1
aspect|yön, boyut|n|1
assess|değerlendirmek|v|1
assume|varsaymak|v|1
attack|saldırı|n|1
attempt|girişim, deneme|n|1
attend|katılmak|v|1
attention|dikkat|n|1
attitude|tutum|n|1
attract|çekmek|v|1
audience|izleyici|n|1
author|yazar|n|1
available|mevcut|a|1
average|ortalama|a|1
avoid|kaçınmak|v|1
aware|farkında|a|1
balance|denge|n|1
ban|yasaklamak|v|1
basic|temel|a|1
behaviour|davranış|n|1
belief|inanç|n|1
belong|ait olmak|v|1
beneficial|faydalı|a|1
benefit|fayda|n|1
birth|doğum|n|1
boost|artırmak|v|1
border|sınır|n|1
borrow|ödünç almak|v|1
brain|beyin|n|1
brave|cesur|a|1
brief|kısa|a|1
broad|geniş|a|1
budget|bütçe|n|1
build|inşa etmek|v|1
burden|yük|n|1
calculate|hesaplamak|v|1
campaign|kampanya|n|1
cancel|iptal etmek|v|1
capacity|kapasite|n|1
career|kariyer|n|1
careful|dikkatli|a|1
cause|neden olmak|v|1
celebrate|kutlamak|v|1
century|yüzyıl|n|1
certain|kesin, emin|a|1
challenge|zorluk, meydan okuma|n|1
chance|şans, fırsat|n|1
change|değişim|n|1
character|karakter|n|1
charge|ücret|n|1
cheap|ucuz|a|1
choice|seçim|n|1
choose|seçmek|v|1
citizen|vatandaş|n|1
claim|iddia etmek|v|1
clear|açık, net|a|1
climate|iklim|n|1
collapse|çökmek|v|1
collect|toplamak|v|1
combine|birleştirmek|v|1
comfortable|rahat|a|1
common|yaygın, ortak|a|1
community|topluluk|n|1
compare|karşılaştırmak|v|1
competition|rekabet, yarışma|n|1
complain|şikâyet etmek|v|1
complete|tamamlamak|v|1
complex|karmaşık|a|1
comprehensive|kapsamlı|a|1
concern|endişe|n|1
condition|koşul, durum|n|1
conduct|yürütmek|v|1
confident|kendinden emin|a|1
confirm|doğrulamak|v|1
connect|bağlamak|v|1
consequence|sonuç|n|1
consider|düşünmek, göz önünde bulundurmak|v|1
considerable|oldukça büyük|a|1
consistent|tutarlı|a|1
contain|içermek|v|1
continue|devam etmek|v|1
contribute|katkıda bulunmak|v|1
control|kontrol etmek|v|1
controversial|tartışmalı|a|1
convince|ikna etmek|v|1
correct|doğru|a|1
cost|maliyet|n|1
create|yaratmak|v|1
crime|suç|n|1
crisis|kriz|n|1
criticise|eleştirmek|v|1
crowded|kalabalık|a|1
crucial|çok önemli|a|1
culture|kültür|n|1
cure|tedavi etmek|v|1
curious|meraklı|a|1
current|güncel, şimdiki|a|1
customer|müşteri|n|1
damage|zarar|n|1
danger|tehlike|n|1
data|veri|n|1
deal|uğraşmak, ilgilenmek|v|1
debate|tartışma|n|1
decide|karar vermek|v|1
decision|karar|n|1
decline|azalmak|v|1
decrease|azalmak|v|1
deep|derin|a|1
defend|savunmak|v|1
degree|derece|n|1
delay|ertelemek, geciktirmek|v|1
deliver|teslim etmek|v|1
demand|talep|n|1
demonstrate|göstermek|v|1
deny|inkâr etmek|v|1
depend|bağlı olmak|v|1
describe|tanımlamak, betimlemek|v|1
desire|arzu|n|1
destroy|yok etmek|v|1
detail|ayrıntı|n|1
detect|tespit etmek|v|1
develop|geliştirmek|v|1
development|gelişme|n|1
difference|fark|n|1
difficult|zor|a|1
direct|doğrudan|a|1
disappear|kaybolmak|v|1
discover|keşfetmek|v|1
discuss|tartışmak, görüşmek|v|1
disease|hastalık|n|1
distance|mesafe|n|1
distinct|belirgin, farklı|a|1
diverse|çeşitli|a|1
divide|bölmek|v|1
dominant|baskın|a|1
doubt|şüphe|n|1
earn|kazanmak|v|1
economy|ekonomi|n|1
education|eğitim|n|1
effect|etki|n|1
effective|etkili|a|1
effort|çaba|n|1
elderly|yaşlı|a|1
electricity|elektrik|n|1
eliminate|ortadan kaldırmak|v|1
emerge|ortaya çıkmak|v|1
emphasize|vurgulamak|v|1
employ|istihdam etmek|v|1
empty|boş|a|1
encourage|cesaretlendirmek|v|1
energy|enerji|n|1
enhance|geliştirmek|v|1
enjoy|keyif almak|v|1
enormous|devasa|a|1
enough|yeterli|a|1
ensure|sağlamak, garantilemek|v|1
environment|çevre|n|1
equal|eşit|a|1
error|hata|n|1
escape|kaçmak|v|1
essential|temel, gerekli|a|1
estimate|tahmin etmek|v|1
evaluate|değerlendirmek|v|1
event|olay|n|1
eventually|sonunda|d|1
evidence|kanıt|n|1
evident|açık, belli|a|1
exact|tam, kesin|a|1
examine|incelemek|v|1
example|örnek|n|1
excellent|mükemmel|a|1
exchange|değiş tokuş|n|1
exist|var olmak|v|1
expand|genişlemek|v|1
expect|beklemek|v|1
expensive|pahalı|a|1
experience|deneyim|n|1
experiment|deney|n|1
expert|uzman|n|1
explain|açıklamak|v|1
explore|keşfetmek, araştırmak|v|1
express|ifade etmek|v|1
extreme|aşırı|a|1
fact|gerçek|n|1
factor|etken|n|1
fail|başarısız olmak|v|1
failure|başarısızlık|n|1
fair|adil|a|1
familiar|tanıdık|a|1
famous|ünlü|a|1
fear|korku|n|1
feature|özellik|n|1
feed|beslemek|v|1
field|alan|n|1
figure|rakam, şekil|n|1
final|son|a|1
financial|mali|a|1
float|yüzmek, süzülmek|v|1
focus|odaklanmak|v|1
follow|takip etmek|v|1
force|zorlamak|v|1
forecast|tahmin|n|1
foreign|yabancı|a|1
forget|unutmak|v|1
forgive|affetmek|v|1
form|biçim|n|1
former|eski, önceki|a|1
fortunately|neyse ki|d|1
freedom|özgürlük|n|1
frequent|sık|a|1
fuel|yakıt|n|1
function|işlev|n|1
fundamental|temel|a|1
future|gelecek|n|1
gain|kazanmak, elde etmek|v|1
general|genel|a|1
generation|nesil|n|1
generous|cömert|a|1
global|küresel|a|1
goal|hedef|n|1
government|hükümet|n|1
gradually|yavaş yavaş|d|1
grow|büyümek|v|1
growth|büyüme|n|1
guess|tahmin etmek|v|1
guide|rehber|n|1
habit|alışkanlık|n|1
handle|başa çıkmak|v|1
harm|zarar vermek|v|1
health|sağlık|n|1
heat|ısı|n|1
height|yükseklik|n|1
history|tarih|n|1
huge|kocaman|a|1
human|insan|n|1
hypothesis|hipotez|n|1
identical|aynı, özdeş|a|1
ignore|görmezden gelmek|v|1
illness|hastalık|n|1
illustrate|örneklendirmek|v|1
image|görüntü|n|1
imagine|hayal etmek|v|1
immediately|hemen|d|1
impact|etki|n|1
importance|önem|n|1
improve|geliştirmek, iyileştirmek|v|1
include|içermek, kapsamak|v|1
income|gelir|n|1
increase|artmak|v|1
independent|bağımsız|a|1
industry|sanayi|n|1
inevitable|kaçınılmaz|a|1
influence|etkilemek|v|1
inform|bilgilendirmek|v|1
information|bilgi|n|1
injury|yaralanma|n|1
innovative|yenilikçi|a|1
instead|yerine|d|1
instruction|talimat|n|1
intelligent|zeki|a|1
intend|niyet etmek|v|1
intense|yoğun|a|1
interest|ilgi|n|1
international|uluslararası|a|1
interpret|yorumlamak|v|1
introduce|tanıtmak|v|1
invent|icat etmek|v|1
invest|yatırım yapmak|v|1
investigate|araştırmak|v|1
involve|içermek, dahil etmek|v|1
irrelevant|ilgisiz|a|1
issue|sorun, konu|n|1
item|öğe, madde|n|1
join|katılmak|v|1
journey|yolculuk|n|1
judge|yargılamak|v|1
knowledge|bilgi, bilgi birikimi|n|1
lack|eksiklik|n|1
language|dil|n|1
law|yasa|n|1
lead|yol açmak, liderlik etmek|v|1
level|seviye|n|1
limit|sınır|n|1
local|yerel|a|1
locate|yerini bulmak|v|1
lonely|yalnız, kimsesiz|a|1
loss|kayıp|n|1
maintain|sürdürmek|v|1
major|başlıca, büyük|a|1
majority|çoğunluk|n|1
manage|yönetmek|v|1
material|malzeme|n|1
matter|önemli olmak|v|1
measure|ölçmek|v|1
medicine|ilaç, tıp|n|1
memory|hafıza, anı|n|1
mention|bahsetmek|v|1
method|yöntem|n|1
million|milyon|n|1
mistake|hata|n|1
modern|modern, çağdaş|a|1
modify|değiştirmek|v|1
moment|an|n|1
moreover|üstelik|d|1
movement|hareket|n|1
natural|doğal|a|1
nearly|neredeyse|d|1
necessary|gerekli|a|1
negative|olumsuz|a|1
neighbour|komşu|n|1
nervous|gergin|a|1
nevertheless|yine de|d|1
normal|normal|a|1
notice|fark etmek|v|1
numerous|çok sayıda|a|1
object|nesne|n|1
observe|gözlemlemek|v|1
obstacle|engel|n|1
obtain|elde etmek|v|1
obvious|apaçık|a|1
occur|meydana gelmek|v|1
offer|teklif etmek|v|1
official|resmi|a|1
opinion|görüş|n|1
opportunity|fırsat|n|1
opposite|zıt|a|1
order|düzen, sıra|n|1
ordinary|sıradan|a|1
organise|düzenlemek, organize etmek|v|1
original|özgün|a|1
outcome|sonuç|n|1
overcome|üstesinden gelmek|v|1
own|sahip olmak|v|1
pain|acı|n|1
participate|katılmak|v|1
particular|belirli|a|1
patient|sabırlı|a|1
pattern|örüntü, desen|n|1
peaceful|huzurlu|a|1
percentage|yüzde|n|1
perfect|kusursuz|a|1
perform|gerçekleştirmek|v|1
period|dönem|n|1
permanent|kalıcı|a|1
permission|izin|n|1
personal|kişisel|a|1
persuade|ikna etmek|v|1
physical|fiziksel|a|1
plan|planlamak|v|1
planet|gezegen|n|1
pleasant|hoş|a|1
policy|politika|n|1
polite|kibar|a|1
pollution|kirlilik|n|1
popular|popüler|a|1
population|nüfus|n|1
positive|olumlu|a|1
possible|mümkün|a|1
poverty|yoksulluk|n|1
power|güç|n|1
practice|uygulama, pratik|n|1
predict|tahmin etmek|v|1
prefer|tercih etmek|v|1
prepare|hazırlamak|v|1
present|sunmak|v|1
preserve|korumak|v|1
pressure|baskı|n|1
prevent|önlemek|v|1
previous|önceki|a|1
price|fiyat|n|1
private|özel|a|1
probably|muhtemelen|d|1
process|süreç|n|1
produce|üretmek|v|1
product|ürün|n|1
progress|ilerleme|n|1
project|proje|n|1
promise|söz vermek|v|1
protect|korumak|v|1
proud|gururlu|a|1
prove|kanıtlamak|v|1
provide|sağlamak|v|1
public|kamu, halk|n|1
publish|yayımlamak|v|1
purpose|amaç|n|1
quality|kalite|n|1
quantity|nicelik, miktar|n|1
quickly|hızla|d|1
quiet|sessiz|a|1
raise|yükseltmek|v|1
range|aralık, yelpaze|n|1
rapid|hızlı|a|1
rare|nadir|a|1
rather|oldukça, daha çok|d|1
reach|ulaşmak|v|1
react|tepki vermek|v|1
realise|fark etmek|v|1
reason|neden, sebep|n|1
receive|almak|v|1
recent|son, yakın zamanda olan|a|1
recognise|tanımak|v|1
recommend|önermek|v|1
record|kaydetmek|v|1
recover|iyileşmek|v|1
reduce|azaltmak|v|1
refuse|reddetmek|v|1
region|bölge|n|1
regular|düzenli|a|1
relationship|ilişki|n|1
relax|rahatlamak|v|1
release|serbest bırakmak|v|1
reliable|güvenilir|a|1
remain|kalmak|v|1
remarkable|dikkat çekici|a|1
remind|hatırlatmak|v|1
remove|kaldırmak|v|1
repair|onarmak|v|1
replace|yerine koymak|v|1
report|rapor|n|1
represent|temsil etmek|v|1
request|rica, talep|n|1
require|gerektirmek|v|1
research|araştırma|n|1
resource|kaynak|n|1
respect|saygı|n|1
respond|yanıt vermek|v|1
responsible|sorumlu|a|1
result|sonuç|n|1
return|geri dönmek|v|1
reveal|ortaya çıkarmak|v|1
rich|zengin|a|1
risk|risk|n|1
role|rol|n|1
rule|kural|n|1
safe|güvenli|a|1
salary|maaş|n|1
satisfy|tatmin etmek|v|1
save|kurtarmak, biriktirmek|v|1
scientist|bilim insanı|n|1
search|aramak|v|1
secret|gizli|a|1
security|güvenlik|n|1
select|seçmek|v|1
separate|ayırmak|v|1
serious|ciddi|a|1
service|hizmet|n|1
severe|şiddetli|a|1
share|paylaşmak|v|1
shortage|kıtlık|n|1
significant|önemli|a|1
similar|benzer|a|1
simple|basit|a|1
situation|durum|n|1
skill|beceri|n|1
society|toplum|n|1
solution|çözüm|n|1
solve|çözmek|v|1
source|kaynak|n|1
species|tür|n|1
spend|harcamak|v|1
spread|yaymak|v|1
stable|istikrarlı|a|1
standard|standart|n|1
state|belirtmek|v|1
statement|açıklama, ifade|n|1
strength|güç|n|1
stress|stres|n|1
strict|katı, sıkı|a|1
structure|yapı|n|1
struggle|mücadele etmek|v|1
succeed|başarılı olmak|v|1
success|başarı|n|1
sudden|ani|a|1
suffer|acı çekmek|v|1
sufficient|yeterli|a|1
suggest|önermek|v|1
suitable|uygun|a|1
supply|tedarik etmek|v|1
support|desteklemek|v|1
suppose|varsaymak, sanmak|v|1
surface|yüzey|n|1
surprise|şaşırtmak|v|1
surround|çevrelemek|v|1
survey|anket|n|1
survive|hayatta kalmak|v|1
system|sistem|n|1
target|hedef|n|1
task|görev|n|1
technology|teknoloji|n|1
temperature|sıcaklık|n|1
temporary|geçici|a|1
tend|eğiliminde olmak|v|1
theory|kuram|n|1
threat|tehdit|n|1
tiny|minik|a|1
total|toplam|a|1
tradition|gelenek|n|1
traffic|trafik|n|1
train|eğitmek|v|1
treat|davranmak, tedavi etmek|v|1
trust|güvenmek|v|1
truth|gerçek, doğruluk|n|1
typical|tipik|a|1
unique|eşsiz|a|1
unusual|alışılmadık|a|1
useful|yararlı|a|1
usually|genellikle|d|1
utilize|kullanmak|v|1
value|değer|n|1
various|çeşitli|a|1
victim|kurban|n|1
view|görüş|n|1
violent|şiddetli, saldırgan|a|1
vital|hayati|a|1
volunteer|gönüllü|n|1
warn|uyarmak|v|1
waste|israf etmek|v|1
wealth|zenginlik|n|1
weight|ağırlık|n|1
wide|geniş|a|1
widespread|yaygın|a|1
wonder|merak etmek|v|1
worry|endişelenmek|v|1
worth|değer|a|1
abolish|kaldırmak, yürürlükten kaldırmak|v|2
absurd|saçma|a|2
abundant|bol, bereketli|a|2
abuse|kötüye kullanmak|v|2
academy|akademi|n|2
accelerate|hızlandırmak|v|2
accessible|erişilebilir|a|2
accommodate|barındırmak|v|2
accordingly|buna göre|d|2
accountable|hesap verebilir|a|2
accumulate|biriktirmek|v|2
accuse|suçlamak|v|2
acknowledge|kabul etmek|v|2
acquire|edinmek|v|2
adapt|uyum sağlamak|v|2
addict|bağımlı|n|2
adjust|ayarlamak|v|2
administer|yönetmek, uygulamak|v|2
adolescent|ergen|n|2
adverse|olumsuz, ters|a|2
advocate|savunmak|v|2
aesthetic|estetik|a|2
affordable|uygun fiyatlı|a|2
aggressive|saldırgan|a|2
alarming|endişe verici|a|2
alien|yabancı|a|2
alleviate|hafifletmek|v|2
alliance|ittifak|n|2
allocate|tahsis etmek|v|2
alternative|alternatif, seçenek|n|2
altitude|rakım|n|2
ambiguous|belirsiz, muğlak|a|2
ambition|hırs, tutku|n|2
amend|değiştirmek, düzeltmek|v|2
analogy|benzetme|n|2
ancestor|ata|n|2
anonymous|isimsiz|a|2
anticipate|öngörmek|v|2
apparatus|aygıt|n|2
appeal|hitap etmek|v|2
applicant|başvuru sahibi|n|2
appoint|atamak|v|2
appraise|değer biçmek|v|2
apprehend|yakalamak|v|2
approval|onay|n|2
aptitude|yatkınlık|n|2
archaeology|arkeoloji|n|2
arise|ortaya çıkmak|v|2
artificial|yapay|a|2
assemble|toplamak, birleştirmek|v|2
assert|ileri sürmek|v|2
asset|varlık, değer|n|2
assign|görevlendirmek|v|2
assist|yardım etmek|v|2
associate|ilişkilendirmek|v|2
assumption|varsayım|n|2
assure|temin etmek|v|2
atmosphere|atmosfer|n|2
attach|eklemek, iliştirmek|v|2
attain|ulaşmak, erişmek|v|2
attribute|atfetmek|v|2
authentic|gerçek, otantik|a|2
authority|otorite, yetki|n|2
automatic|otomatik|a|2
awkward|garip, beceriksiz|a|2
backward|geri kalmış|a|2
bankrupt|iflas etmiş|a|2
barely|ancak, zar zor|d|2
barrier|engel|n|2
behalf|adına|n|2
beneath|altında|d|2
betray|ihanet etmek|v|2
beware|dikkat etmek|v|2
bias|önyargı|n|2
biased|önyargılı|a|2
blame|suçlamak|v|2
bond|bağ|n|2
boundary|sınır|n|2
breakthrough|çığır açan buluş|n|2
bribe|rüşvet|n|2
brutal|acımasız|a|2
bulk|büyük kısım|n|2
bureaucracy|bürokrasi|n|2
calm|sakin|a|2
candidate|aday|n|2
capable|yetenekli|a|2
capture|ele geçirmek|v|2
casualty|kayıp, kazazede|n|2
catastrophe|felaket|n|2
cautious|temkinli|a|2
cease|sona ermek|v|2
celebrity|ünlü kişi|n|2
certify|onaylamak, belgelemek|v|2
chaos|kaos|n|2
characteristic|özellik|n|2
chronic|kronik|a|2
circulate|dolaşmak|v|2
circumstance|koşul, durum|n|2
cite|alıntı yapmak|v|2
civil|sivil|a|2
clarify|açıklığa kavuşturmak|v|2
classify|sınıflandırmak|v|2
cluster|küme|n|2
coastal|kıyı|a|2
cognitive|bilişsel|a|2
coherent|tutarlı|a|2
collaborate|iş birliği yapmak|v|2
colleague|meslektaş|n|2
collective|toplu, ortak|a|2
colony|koloni|n|2
commence|başlamak|v|2
commit|işlemek, adamak|v|2
commodity|emtia, mal|n|2
compact|sıkı, küçük|a|2
companion|arkadaş, refakatçi|n|2
compatible|uyumlu|a|2
compensate|telafi etmek|v|2
competent|yetkin|a|2
compile|derlemek|v|2
complement|tamamlamak|v|2
component|bileşen|n|2
compose|oluşturmak|v|2
compound|bileşik|n|2
comprehend|kavramak|v|2
comprise|içermek, oluşmak|v|2
compromise|uzlaşma|n|2
compulsory|zorunlu|a|2
conceal|gizlemek|v|2
conceive|tasarlamak|v|2
concentrate|yoğunlaşmak|v|2
concept|kavram|n|2
conclude|sonuçlandırmak|v|2
concrete|somut|a|2
condemn|kınamak|v|2
confess|itiraf etmek|v|2
confine|sınırlamak|v|2
confront|yüzleşmek|v|2
confusion|karışıklık|n|2
conquer|fethetmek|v|2
conscious|bilinçli|a|2
consent|rıza, onay|n|2
conservation|koruma|n|2
conservative|tutucu|a|2
considerate|düşünceli|a|2
constant|sabit, sürekli|a|2
constitute|oluşturmak|v|2
constrain|kısıtlamak|v|2
construct|inşa etmek|v|2
consult|danışmak|v|2
consume|tüketmek|v|2
contaminate|kirletmek|v|2
contemplate|düşünüp taşınmak|v|2
contemporary|çağdaş|a|2
contend|iddia etmek|v|2
context|bağlam|n|2
contract|sözleşme|n|2
contradict|çelişmek|v|2
contrary|aksine|a|2
contrast|karşıtlık|n|2
convenient|elverişli|a|2
conventional|geleneksel|a|2
convert|dönüştürmek|v|2
convey|iletmek, aktarmak|v|2
conviction|kanaat, mahkumiyet|n|2
cooperate|iş birliği yapmak|v|2
coordinate|koordine etmek|v|2
cope|başa çıkmak|v|2
corporate|kurumsal|a|2
correspond|karşılık gelmek|v|2
corrupt|yozlaşmış|a|2
counterpart|muadil|n|2
courageous|cesur|a|2
craft|zanaat|n|2
credible|inandırıcı|a|2
criterion|ölçüt|n|2
critical|eleştirel, kritik|a|2
cruel|zalim|a|2
cultivate|yetiştirmek|v|2
cumulative|birikimli|a|2
cynical|alaycı, kuşkucu|a|2
dairy|süt ürünü|n|2
deadline|son tarih|n|2
deceive|aldatmak|v|2
decent|düzgün, makul|a|2
declare|ilan etmek|v|2
dedicate|adamak|v|2
defeat|yenilgi|n|2
defect|kusur|n|2
deficiency|eksiklik|n|2
deficit|açık|n|2
define|tanımlamak|v|2
definite|kesin|a|2
delegate|yetki vermek|v|2
deliberately|kasıtlı olarak|d|2
delicate|hassas, narin|a|2
democracy|demokrasi|n|2
demolish|yıkmak|v|2
dense|yoğun|a|2
dependent|bağımlı|a|2
depict|tasvir etmek|v|2
deposit|depozito, birikinti|n|2
depression|depresyon, durgunluk|n|2
deprivation|yoksunluk|n|2
deprive|yoksun bırakmak|v|2
derive|türetmek, elde etmek|v|2
deserve|hak etmek|v|2
designate|belirlemek|v|2
despair|umutsuzluk|n|2
desperate|çaresiz|a|2
destination|varış yeri|n|2
detain|gözaltına almak|v|2
deteriorate|kötüleşmek|v|2
determine|belirlemek|v|2
devastating|yıkıcı|a|2
devise|tasarlamak|v|2
devote|adamak|v|2
diagnose|teşhis koymak|v|2
dilemma|ikilem|n|2
dimension|boyut|n|2
diminish|azalmak|v|2
diplomatic|diplomatik|a|2
disability|engellilik|n|2
disadvantage|dezavantaj|n|2
disaster|felaket|n|2
discipline|disiplin|n|2
disclose|açıklamak, ifşa etmek|v|2
discourage|cesaretini kırmak|v|2
discriminate|ayrımcılık yapmak|v|2
dismiss|reddetmek, kovmak|v|2
disorder|bozukluk|n|2
display|sergilemek|v|2
dispose|elden çıkarmak|v|2
dispute|anlaşmazlık|n|2
disrupt|bozmak, aksatmak|v|2
dissolve|çözmek, çözünmek|v|2
distinguish|ayırt etmek|v|2
distort|çarpıtmak|v|2
distribute|dağıtmak|v|2
district|ilçe, bölge|n|2
diversity|çeşitlilik|n|2
domestic|yerli, evsel|a|2
donate|bağışlamak|v|2
draft|taslak|n|2
drastic|sert, köklü|a|2
drought|kuraklık|n|2
durable|dayanıklı|a|2
dynamic|dinamik|a|2
eager|istekli|a|2
ecology|ekoloji|n|2
efficient|verimli|a|2
elaborate|ayrıntılı|a|2
elegant|zarif|a|2
element|öğe|n|2
eligible|uygun, hak sahibi|a|2
embrace|benimsemek|v|2
emission|salım|n|2
empathy|empati|n|2
empirical|deneysel|a|2
enable|olanak sağlamak|v|2
encounter|karşılaşmak|v|2
endanger|tehlikeye atmak|v|2
endure|katlanmak|v|2
enforce|uygulamak, yürürlüğe koymak|v|2
engage|meşgul olmak, katılmak|v|2
enormously|son derece|d|2
enrich|zenginleştirmek|v|2
enterprise|girişim|n|2
entitle|hak vermek|v|2
entity|varlık|n|2
epidemic|salgın|n|2
equality|eşitlik|n|2
equip|donatmak|v|2
equivalent|eşdeğer|a|2
era|çağ, dönem|n|2
erode|aşındırmak|v|2
essence|öz|n|2
establish|kurmak|v|2
ethical|etik|a|2
ethnic|etnik|a|2
evaporate|buharlaşmak|v|2
evolve|evrimleşmek|v|2
exaggerate|abartmak|v|2
exceed|aşmak|v|2
exceptional|olağanüstü|a|2
excessive|aşırı|a|2
exclude|hariç tutmak|v|2
execute|yürütmek, idam etmek|v|2
exhaust|tüketmek|v|2
exhibit|sergilemek|v|2
expansion|genişleme|n|2
expenditure|harcama|n|2
explicit|açık, net|a|2
exploit|sömürmek|v|2
expose|maruz bırakmak|v|2
external|dış|a|2
extinct|nesli tükenmiş|a|2
extract|çıkarmak|v|2
fabricate|uydurmak|v|2
facilitate|kolaylaştırmak|v|2
famine|kıtlık|n|2
fascinating|büyüleyici|a|2
fatal|ölümcül|a|2
fatigue|yorgunluk|n|2
feasible|uygulanabilir|a|2
fertile|verimli, doğurgan|a|2
finite|sonlu|a|2
flexible|esnek|a|2
fluent|akıcı|a|2
forbid|yasaklamak|v|2
formulate|formüle etmek|v|2
fossil|fosil|n|2
foundation|temel, vakıf|n|2
fraction|kesir, küçük parça|n|2
fragile|kırılgan|a|2
framework|çerçeve|n|2
fraud|dolandırıcılık|n|2
frustrate|hüsrana uğratmak|v|2
fulfil|yerine getirmek|v|2
furthermore|ayrıca|d|2
gap|boşluk, açık|n|2
gender|toplumsal cinsiyet|n|2
generate|üretmek|v|2
genetic|genetik|a|2
genuine|samimi, gerçek|a|2
gesture|jest|n|2
govern|yönetmek|v|2
grant|vermek, bahşetmek|v|2
grateful|minnettar|a|2
guarantee|garanti etmek|v|2
guilty|suçlu|a|2
habitat|yaşam alanı|n|2
harsh|sert|a|2
harvest|hasat|n|2
hazardous|tehlikeli|a|2
hence|bu nedenle|d|2
heritage|miras|n|2
hesitate|tereddüt etmek|v|2
hierarchy|hiyerarşi|n|2
highlight|vurgulamak|v|2
hinder|engellemek|v|2
hostile|düşmanca|a|2
humble|alçakgönüllü|a|2
identify|belirlemek|v|2
ideology|ideoloji|n|2
immense|muazzam|a|2
immigrant|göçmen|n|2
immune|bağışık|a|2
impartial|tarafsız|a|2
implement|uygulamak|v|2
implication|sonuç, ima|n|2
imply|ima etmek|v|2
impose|dayatmak|v|2
impress|etkilemek|v|2
impulse|dürtü|n|2
incentive|teşvik|n|2
incident|olay|n|2
incline|eğilim göstermek|v|2
incorporate|dahil etmek|v|2
indicate|göstermek, işaret etmek|v|2
indifferent|kayıtsız|a|2
individual|birey|n|2
induce|teşvik etmek, neden olmak|v|2
infection|enfeksiyon|n|2
infer|sonuç çıkarmak|v|2
inferior|aşağı, düşük|a|2
infinite|sonsuz|a|2
inflation|enflasyon|n|2
infrastructure|altyapı|n|2
ingredient|malzeme, bileşen|n|2
inhabit|yaşamak, ikamet etmek|v|2
inherit|miras almak|v|2
initial|ilk|a|2
initiate|başlatmak|v|2
injure|yaralamak|v|2
innocent|masum|a|2
input|girdi|n|2
inquiry|soruşturma|n|2
insight|kavrayış, iç görü|n|2
insist|ısrar etmek|v|2
inspect|denetlemek|v|2
inspire|ilham vermek|v|2
install|kurmak|v|2
instance|örnek|n|2
instinct|içgüdü|n|2
institution|kurum|n|2
insufficient|yetersiz|a|2
insult|hakaret etmek|v|2
intact|bozulmamış|a|2
integrate|bütünleştirmek|v|2
intellectual|entelektüel|a|2
intensive|yoğun|a|2
interact|etkileşmek|v|2
interfere|müdahale etmek|v|2
interval|aralık|n|2
intervene|araya girmek|v|2
intimate|samimi|a|2
invade|istila etmek|v|2
invaluable|paha biçilmez|a|2
irrigation|sulama|n|2
isolate|yalıtmak|v|2
journal|dergi|n|2
justify|haklı çıkarmak|v|2
landscape|manzara|n|2
launch|başlatmak|v|2
legal|yasal|a|2
legislation|mevzuat|n|2
legitimate|meşru|a|2
liberal|özgürlükçü|a|2
likewise|aynı şekilde|d|2
literacy|okuryazarlık|n|2
literal|kelimesi kelimesine|a|2
logical|mantıklı|a|2
loyal|sadık|a|2
luxury|lüks|n|2
magnificent|görkemli|a|2
mandatory|zorunlu|a|2
manipulate|manipüle etmek|v|2
manufacture|imal etmek|v|2
margin|kenar boşluğu|n|2
marine|deniz|a|2
massive|çok büyük|a|2
mature|olgun|a|2
maximise|en üst düzeye çıkarmak|v|2
mechanism|mekanizma|n|2
mediate|arabuluculuk yapmak|v|2
medieval|ortaçağa ait|a|2
merely|sadece|d|2
migrate|göç etmek|v|2
military|askeri|a|2
minimum|asgari|a|2
minority|azınlık|n|2
misleading|yanıltıcı|a|2
mobile|hareketli|a|2
moderate|ılımlı|a|2
modest|mütevazı|a|2
monitor|izlemek|v|2
moral|ahlaki|a|2
motivate|motive etmek|v|2
mutual|karşılıklı|a|2
myth|efsane|n|2
narrow|dar|a|2
neglect|ihmal etmek|v|2
negotiate|müzakere etmek|v|2
neutral|tarafsız|a|2
nonetheless|yine de|d|2
norm|norm|n|2
notably|özellikle|d|2
notion|kavram, fikir|n|2
nutrition|beslenme|n|2
objective|nesnel|a|2
obligation|yükümlülük|n|2
occupy|işgal etmek|v|2
odd|tuhaf|a|2
ongoing|süregelen|a|2
oppose|karşı çıkmak|v|2
optimistic|iyimser|a|2
optional|isteğe bağlı|a|2
organism|organizma|n|2
orientation|yönelim|n|2
outbreak|salgın, patlak verme|n|2
output|çıktı|n|2
outstanding|üstün, olağanüstü|a|2
overall|genel olarak|d|2
overlook|gözden kaçırmak|v|2
overseas|yurt dışı|a|2
overwhelming|ezici|a|2
panic|panik|n|2
parallel|paralel|a|2
partial|kısmi|a|2
participant|katılımcı|n|2
passive|edilgen|a|2
peculiar|tuhaf, kendine özgü|a|2
penalty|ceza|n|2
perceive|algılamak|v|2
perception|algı|n|2
persist|sürmek, devam etmek|v|2
perspective|bakış açısı|n|2
phenomenon|olgu|n|2
philosophy|felsefe|n|2
pioneer|öncü|n|2
pose|oluşturmak, sormak|v|2
possess|sahip olmak|v|2
potential|potansiyel|a|2
practical|pratik|a|2
precaution|önlem|n|2
precede|önce gelmek|v|2
precise|kesin, tam|a|2
predecessor|selef|n|2
preference|tercih|n|2
prejudice|önyargı|n|2
preliminary|ön, hazırlık|a|2
premature|erken|a|2
prescribe|reçete yazmak|v|2
presume|varsaymak|v|2
pretend|rol yapmak|v|2
prevalent|yaygın|a|2
priority|öncelik|n|2
procedure|prosedür|n|2
proceed|ilerlemek|v|2
profound|derin|a|2
prohibit|yasaklamak|v|2
prohibition|yasak|n|2
prominent|önde gelen|a|2
promote|teşvik etmek|v|2
prompt|tetiklemek|v|2
proportion|oran|n|2
prospect|olasılık, beklenti|n|2
prosperity|refah|n|2
protest|protesto etmek|v|2
provoke|kışkırtmak|v|2
psychology|psikoloji|n|2
punish|cezalandırmak|v|2
pursue|peşinden gitmek|v|2
qualify|hak kazanmak|v|2
radical|köklü|a|2
random|rastgele|a|2
rational|akılcı|a|2
recession|durgunluk|n|2
recipient|alıcı|n|2
reconcile|uzlaştırmak|v|2
recruit|işe almak|v|2
refer|atıfta bulunmak|v|2
reflect|yansıtmak|v|2
reform|reform|n|2
regulate|düzenlemek|v|2
reinforce|güçlendirmek|v|2
reject|reddetmek|v|2
relevant|ilgili|a|2
relieve|rahatlatmak|v|2
reluctance|isteksizlik|n|2
reluctant|isteksiz|a|2
rely|güvenmek, dayanmak|v|2
remedy|çare|n|2
remote|uzak|a|2
renewable|yenilenebilir|a|2
reproduce|üremek, çoğaltmak|v|2
reputation|ün, itibar|n|2
resemble|benzemek|v|2
reside|ikamet etmek|v|2
resign|istifa etmek|v|2
resist|direnmek|v|2
resolve|çözmek|v|2
restore|eski haline getirmek|v|2
restrict|kısıtlamak|v|2
retain|elinde tutmak|v|2
retire|emekli olmak|v|2
reverse|tersine çevirmek|v|2
revise|gözden geçirmek|v|2
revolution|devrim|n|2
reward|ödül|n|2
rigid|katı|a|2
rival|rakip|n|2
robust|güçlü, sağlam|a|2
routine|rutin|n|2
rural|kırsal|a|2
sacrifice|fedakârlık|n|2
sanction|yaptırım|n|2
scarce|kıt|a|2
scope|kapsam|n|2
secure|güvence altına almak|v|2
seek|aramak|v|2
segment|bölüm|n|2
sensible|mantıklı|a|2
sensitive|hassas|a|2
sequence|sıra, dizi|n|2
settle|yerleşmek|v|2
shelter|barınak|n|2
shift|değişim, kayma|n|2
shrink|küçülmek|v|2
signify|anlamına gelmek|v|2
simultaneously|aynı anda|d|2
sincere|içten|a|2
skeptical|şüpheci|a|2
soil|toprak|n|2
solid|katı|a|2
sophisticated|karmaşık, gelişmiş|a|2
sovereign|egemen|a|2
specify|belirtmek|v|2
spectacular|muhteşem|a|2
speculate|tahmin yürütmek|v|2
sphere|alan, küre|n|2
stability|istikrar|n|2
stake|pay|n|2
statistic|istatistik|n|2
status|statü|n|2
steady|istikrarlı, sabit|a|2
stimulate|uyarmak, teşvik etmek|v|2
strategy|strateji|n|2
strive|çabalamak|v|2
subsequent|sonraki|a|2
subsidy|sübvansiyon|n|2
substantial|önemli, büyük|a|2
substitute|yerine koymak|v|2
suburb|banliyö|n|2
summarise|özetlemek|v|2
superior|üstün|a|2
supplement|takviye etmek|v|2
suppress|bastırmak|v|2
surgery|ameliyat|n|2
surplus|fazla|n|2
susceptible|duyarlı, yatkın|a|2
suspend|askıya almak|v|2
suspicious|şüpheli|a|2
sustain|sürdürmek|v|2
sympathy|sempati, anlayış|n|2
symptom|belirti|n|2
tackle|ele almak|v|2
tension|gerginlik|n|2
terminate|sona erdirmek|v|2
territory|bölge, toprak|n|2
textile|tekstil|n|2
theme|tema|n|2
thereby|böylece|d|2
thorough|ayrıntılı, titiz|a|2
thrive|gelişmek|v|2
tolerate|tahammül etmek|v|2
tough|zorlu|a|2
toxic|zehirli|a|2
trace|iz|n|2
transform|dönüştürmek|v|2
transmit|iletmek|v|2
transparent|şeffaf|a|2
trend|eğilim|n|2
trigger|tetiklemek|v|2
triumph|zafer|n|2
ultimate|nihai|a|2
uncover|ortaya çıkarmak|v|2
undergo|geçirmek, maruz kalmak|v|2
underlying|altta yatan|a|2
unify|birleştirmek|v|2
universal|evrensel|a|2
unprecedented|eşi görülmemiş|a|2
urban|kentsel|a|2
urge|teşvik etmek, ısrar etmek|v|2
vague|belirsiz|a|2
valid|geçerli|a|2
variable|değişken|n|2
vary|değişmek|v|2
verify|doğrulamak|v|2
version|sürüm|n|2
vessel|gemi, damar|n|2
via|yoluyla|d|2
vision|vizyon, görme|n|2
voluntary|gönüllü|a|2
vulnerable|savunmasız|a|2
welfare|refah|n|2
whereas|oysa|d|2
withdraw|geri çekmek|v|2
witness|tanık|n|2
worship|ibadet etmek|v|2
abate|dinmek, azalmak|v|3
aberration|sapma|n|3
abhor|nefret etmek|v|3
abide|uymak|v|3
abrupt|ani, sert|a|3
abstain|uzak durmak|v|3
abstract|soyut|a|3
accentuate|vurgulamak, belirginleştirmek|v|3
acclaim|övgü|n|3
accrue|birikmek|v|3
acquiesce|razı olmak|v|3
acumen|keskin zekâ|n|3
adamant|kararlı, inatçı|a|3
adhere|bağlı kalmak|v|3
adjacent|bitişik|a|3
admonish|uyarmak, azarlamak|v|3
adversary|düşman, hasım|n|3
adversity|sıkıntı, zorluk|n|3
affluent|varlıklı|a|3
aggravate|kötüleştirmek|v|3
aggregate|toplam|n|3
alienate|yabancılaştırmak|v|3
allegation|iddia|n|3
allude|ima etmek|v|3
amass|yığmak, biriktirmek|v|3
ameliorate|iyileştirmek|v|3
amenable|uysal, yatkın|a|3
ample|bol, geniş|a|3
amplify|güçlendirmek, yükseltmek|v|3
anomaly|anormallik|n|3
antagonise|düşman etmek|v|3
antecedent|öncül|n|3
antiquated|modası geçmiş|a|3
apathy|ilgisizlik|n|3
appease|yatıştırmak|v|3
apprehensive|kaygılı|a|3
arbitrary|keyfi|a|3
arduous|meşakkatli|a|3
articulate|açıkça ifade etmek|v|3
ascertain|tespit etmek|v|3
ascribe|atfetmek|v|3
aspire|arzulamak|v|3
assiduous|gayretli|a|3
astute|kurnaz, zeki|a|3
attenuate|zayıflatmak|v|3
augment|artırmak|v|3
austerity|kemer sıkma|n|3
autonomous|özerk|a|3
avert|önlemek, savuşturmak|v|3
banish|sürgün etmek|v|3
benevolent|iyiliksever|a|3
benign|zararsız, iyi huylu|a|3
bewilder|şaşkına çevirmek|v|3
bleak|kasvetli|a|3
bolster|desteklemek|v|3
brittle|kırılgan, gevrek|a|3
bureaucratic|bürokratik|a|3
buttress|desteklemek|v|3
candid|açık sözlü|a|3
capricious|kaprisli|a|3
catalyst|katalizör|n|3
caveat|uyarı, çekince|n|3
censure|kınamak|v|3
circumvent|atlatmak|v|3
clandestine|gizli|a|3
coerce|zorlamak|v|3
cogent|ikna edici|a|3
cohesive|bütünleşik|a|3
coincide|aynı zamana denk gelmek|v|3
collateral|ikincil, teminat|a|3
commensurate|orantılı|a|3
compel|zorlamak|v|3
compelling|ikna edici|a|3
complacent|kayıtsız, rehavet içinde|a|3
comply|uymak|v|3
concur|hemfikir olmak|v|3
conducive|elverişli|a|3
confer|vermek, görüşmek|v|3
congenial|uyumlu, hoş|a|3
conjecture|tahmin, varsayım|n|3
connotation|çağrışım|n|3
consensus|uzlaşı|n|3
consolidate|pekiştirmek|v|3
conspicuous|göze çarpan|a|3
contemplative|düşünceli|a|3
contentious|tartışmalı|a|3
contingent|bağlı, koşullu|a|3
conundrum|bilmece, çıkmaz|n|3
converge|bir araya gelmek|v|3
copious|bol|a|3
corroborate|doğrulamak|v|3
credulous|saf, her şeye inanan|a|3
culminate|sonuçlanmak|v|3
culpable|kusurlu, suçlu|a|3
curb|dizginlemek|v|3
cursory|üstünkörü|a|3
daunting|göz korkutan|a|3
dearth|kıtlık, yokluk|n|3
debilitate|güçten düşürmek|v|3
decimate|kırıp geçirmek|v|3
decipher|şifresini çözmek|v|3
defer|ertelemek|v|3
deference|saygı|n|3
degrade|bozmak, aşağılamak|v|3
delineate|tasvir etmek, çizmek|v|3
delusion|yanılgı|n|3
demise|ölüm, son|n|3
denounce|kınamak|v|3
deplete|tüketmek|v|3
deplore|üzüntü duymak, kınamak|v|3
deploy|konuşlandırmak|v|3
deride|alay etmek|v|3
detrimental|zararlı|a|3
deviate|sapmak|v|3
diffuse|yaymak|v|3
digress|konudan sapmak|v|3
dilute|seyreltmek|v|3
discard|atmak, çıkarmak|v|3
discern|ayırt etmek|v|3
discrepancy|tutarsızlık|n|3
disdain|küçümseme|n|3
disparity|eşitsizlik|n|3
dispel|dağıtmak, gidermek|v|3
disperse|dağılmak|v|3
disseminate|yaymak|v|3
dissent|muhalefet|n|3
distraught|perişan|a|3
divergent|farklı, ayrışan|a|3
divulge|açığa vurmak|v|3
dogmatic|dogmatik|a|3
dormant|uykuda, etkisiz|a|3
dubious|şüpheli|a|3
duplicate|kopyalamak|v|3
dwindle|azalmak, erimek|v|3
eclectic|seçmeci|a|3
efficacy|etkinlik|n|3
elicit|ortaya çıkarmak|v|3
elusive|anlaşılması zor|a|3
emancipate|özgürleştirmek|v|3
embark|başlamak, girişmek|v|3
embody|somutlaştırmak|v|3
eminent|seçkin, ünlü|a|3
emulate|örnek almak|v|3
encompass|kapsamak|v|3
endemic|yerel, endemik|a|3
endorse|desteklemek, onaylamak|v|3
enigma|muamma|n|3
entail|gerektirmek|v|3
enumerate|sıralamak|v|3
ephemeral|geçici|a|3
equitable|hakkaniyetli|a|3
eradicate|kökünü kazımak|v|3
erratic|düzensiz|a|3
erroneous|hatalı|a|3
espouse|benimsemek|v|3
exacerbate|şiddetlendirmek|v|3
exemplify|örneklemek|v|3
exempt|muaf|a|3
exert|uygulamak, sarf etmek|v|3
exhaustive|ayrıntılı, kapsamlı|a|3
exonerate|aklamak|v|3
expedite|hızlandırmak|v|3
explicate|açıklamak|v|3
extol|övmek|v|3
extravagant|savurgan|a|3
facet|yön, cephe|n|3
fallacy|yanılgı, safsata|n|3
fathom|anlamak, kavramak|v|3
feeble|zayıf, güçsüz|a|3
ferocious|vahşi|a|3
fervent|ateşli, coşkulu|a|3
fickle|dönek|a|3
flaw|kusur|n|3
flourish|gelişmek, serpilmek|v|3
fluctuate|dalgalanmak|v|3
foment|kışkırtmak|v|3
forfeit|kaybetmek, vazgeçmek|v|3
formidable|zorlu, ürkütücü|a|3
fortify|güçlendirmek|v|3
fortuitous|tesadüfi|a|3
frugal|tutumlu|a|3
futile|beyhude|a|3
galvanise|harekete geçirmek|v|3
garner|toplamak, kazanmak|v|3
gratuitous|gereksiz, nedensiz|a|3
gregarious|sosyal, girişken|a|3
grievance|şikâyet|n|3
gullible|saf, kolay kandırılan|a|3
hackneyed|basmakalıp|a|3
hamper|engellemek|v|3
harbinger|habercisi|n|3
haughty|kibirli|a|3
heed|dikkate almak|v|3
heterogeneous|heterojen|a|3
hinge|bağlı olmak|v|3
homogeneous|homojen|a|3
hostility|düşmanlık|n|3
hypothetical|varsayımsal|a|3
idiosyncratic|kendine özgü|a|3
immerse|daldırmak|v|3
imminent|yakın, eli kulağında|a|3
impair|zayıflatmak|v|3
impede|engellemek|v|3
imperative|zorunlu|a|3
impetus|itici güç|n|3
implicit|örtük|a|3
impoverish|yoksullaştırmak|v|3
inadvertently|istemeden|d|3
incessant|aralıksız|a|3
incidence|görülme sıklığı|n|3
incite|kışkırtmak|v|3
incongruous|uyumsuz|a|3
incumbent|görevdeki|a|3
indigenous|yerli|a|3
indispensable|vazgeçilmez|a|3
induct|kabul etmek|v|3
inept|beceriksiz|a|3
inexorable|durdurulamaz|a|3
infamous|kötü şöhretli|a|3
infringe|ihlal etmek|v|3
ingenious|dâhice|a|3
inherent|doğasında olan|a|3
inhibit|engellemek, baskılamak|v|3
innate|doğuştan|a|3
innocuous|zararsız|a|3
insatiable|doymak bilmez|a|3
insidious|sinsi|a|3
instigate|başlatmak, kışkırtmak|v|3
insurmountable|aşılmaz|a|3
intermittent|aralıklı|a|3
intractable|inatçı, çözülmesi zor|a|3
intricate|karmaşık|a|3
intrinsic|içsel|a|3
inundate|sel gibi basmak|v|3
invoke|başvurmak, anmak|v|3
irrevocable|geri alınamaz|a|3
jeopardise|tehlikeye atmak|v|3
juxtapose|yan yana koymak|v|3
laborious|zahmetli|a|3
lament|yakınmak|v|3
latent|gizli, örtük|a|3
lavish|cömert, savurgan|a|3
lax|gevşek|a|3
lethargic|uyuşuk|a|3
leverage|kaldıraç, nüfuz|n|3
linger|oyalanmak, sürmek|v|3
lucid|açık, anlaşılır|a|3
lucrative|kârlı|a|3
magnitude|büyüklük|n|3
malevolent|kötü niyetli|a|3
malleable|şekil verilebilir|a|3
mandate|yetki, görev|n|3
manifest|göstermek, ortaya koymak|v|3
meagre|yetersiz, kıt|a|3
meticulous|titiz|a|3
misconception|yanlış kanı|n|3
mitigate|hafifletmek|v|3
mitigation|hafifletme|n|3
mollify|yatıştırmak|v|3
momentous|çok önemli|a|3
mundane|sıradan|a|3
myriad|sayısız|a|3
nascent|yeni oluşan|a|3
nebulous|belirsiz|a|3
nefarious|kötü, alçakça|a|3
negate|geçersiz kılmak|v|3
negligible|önemsiz, ihmal edilebilir|a|3
nonchalant|kayıtsız|a|3
notorious|kötü şöhretli|a|3
novel|yeni, alışılmamış|a|3
nuance|nüans|n|3
nullify|hükümsüz kılmak|v|3
obscure|belirsiz, anlaşılmaz|a|3
obsolete|eskimiş|a|3
obstinate|inatçı|a|3
offset|dengelemek|v|3
ominous|uğursuz|a|3
onerous|külfetli|a|3
opaque|opak, anlaşılmaz|a|3
opulent|zengin, şatafatlı|a|3
ostensibly|görünüşte|d|3
ostracise|dışlamak|v|3
oust|görevden uzaklaştırmak|v|3
overt|açık, aleni|a|3
pacify|yatıştırmak|v|3
palpable|elle tutulur|a|3
paradigm|paradigma|n|3
paradox|çelişki|n|3
paramount|en önemli|a|3
pathology|patoloji|n|3
paucity|azlık|n|3
pejorative|aşağılayıcı|a|3
penchant|düşkünlük|n|3
perennial|kalıcı, daimi|a|3
peripheral|çevresel, ikincil|a|3
pernicious|zararlı|a|3
perpetrate|işlemek (suç)|v|3
perpetuate|sürdürmek|v|3
pertinent|ilgili|a|3
pervasive|her yere yayılmış|a|3
placate|yatıştırmak|v|3
plausible|akla yatkın|a|3
plethora|bolluk|n|3
pragmatic|pragmatik|a|3
precarious|güvencesiz|a|3
preclude|önlemek|v|3
precocious|erken gelişmiş|a|3
predicament|çıkmaz|n|3
predisposition|yatkınlık|n|3
predominantly|ağırlıklı olarak|d|3
preeminent|seçkin|a|3
premise|öncül|n|3
prerequisite|ön koşul|n|3
prestigious|saygın|a|3
pretext|bahane|n|3
prevail|hâkim olmak|v|3
prevalence|yaygınlık|n|3
pristine|bozulmamış|a|3
proclaim|ilan etmek|v|3
procrastinate|ertelemek|v|3
prodigious|olağanüstü|a|3
proficient|usta, yetkin|a|3
proliferate|hızla çoğalmak|v|3
prolific|üretken|a|3
prolong|uzatmak|v|3
prone|eğilimli|a|3
propagate|yaymak|v|3
propensity|eğilim|n|3
proponent|savunucu|n|3
prosecute|kovuşturmak|v|3
protracted|uzun süren|a|3
provisional|geçici|a|3
proximity|yakınlık|n|3
prudent|ihtiyatlı|a|3
punitive|cezai|a|3
quell|bastırmak|v|3
querulous|şikâyetçi|a|3
ramification|sonuç, yan etki|n|3
rampant|yaygın, kontrolsüz|a|3
rapport|uyum, yakınlık|n|3
ratify|onaylamak|v|3
rebuke|azarlamak|v|3
rebut|çürütmek|v|3
recalcitrant|inatçı, söz dinlemez|a|3
reciprocal|karşılıklı|a|3
reclaim|geri kazanmak|v|3
rectify|düzeltmek|v|3
recuperate|iyileşmek|v|3
redundant|gereksiz|a|3
refute|çürütmek|v|3
relegate|alt sıraya düşürmek|v|3
relentless|amansız|a|3
relinquish|vazgeçmek|v|3
remnant|kalıntı|n|3
render|hâle getirmek|v|3
renounce|vazgeçmek|v|3
replenish|yeniden doldurmak|v|3
reprimand|azarlamak|v|3
repudiate|reddetmek|v|3
resilient|dayanıklı|a|3
resurgence|yeniden canlanma|n|3
retaliate|misilleme yapmak|v|3
reticent|ağzı sıkı|a|3
retract|geri almak|v|3
retrospect|geçmişe bakış|n|3
revere|saygı duymak|v|3
rhetoric|söz sanatı, retorik|n|3
rudimentary|temel, ilkel|a|3
salient|göze çarpan|a|3
sanguine|iyimser|a|3
scant|az, yetersiz|a|3
scrupulous|titiz, dürüst|a|3
scrutinise|incelemek|v|3
scrutiny|inceleme|n|3
secluded|tenha|a|3
sedentary|hareketsiz|a|3
segregate|ayırmak|v|3
semblance|görünüş|n|3
skewed|çarpık|a|3
solicit|talep etmek|v|3
soothe|yatıştırmak|v|3
sparse|seyrek|a|3
spontaneous|kendiliğinden|a|3
sporadic|ara sıra olan|a|3
spurious|sahte|a|3
squander|çarçur etmek|v|3
stagnant|durgun|a|3
staunch|sadık, sağlam|a|3
stifle|bastırmak, boğmak|v|3
stringent|sıkı|a|3
subjugate|boyun eğdirmek|v|3
subordinate|ast|n|3
subside|yatışmak|v|3
substantiate|kanıtlamak|v|3
subtle|ince, belli belirsiz|a|3
subvert|yıkmak, altüst etmek|v|3
succinct|özlü|a|3
succumb|yenik düşmek|v|3
superfluous|gereksiz|a|3
supersede|yerini almak|v|3
supplant|yerini almak|v|3
surmise|tahmin etmek|v|3
surpass|geçmek, aşmak|v|3
susceptibility|duyarlılık|n|3
sustainable|sürdürülebilir|a|3
synthesise|sentezlemek|v|3
tacit|zımni|a|3
tangible|somut|a|3
tantamount|eşdeğer|a|3
tedious|sıkıcı|a|3
temperate|ılıman|a|3
tenacious|azimli|a|3
tentative|geçici, deneme niteliğinde|a|3
tenuous|zayıf, ince|a|3
terse|kısa ve sert|a|3
thwart|engellemek|v|3
tranquil|sakin|a|3
transient|geçici|a|3
trepidation|korku, endişe|n|3
trivial|önemsiz|a|3
truncate|kısaltmak|v|3
ubiquitous|her yerde bulunan|a|3
unanimous|oybirliğiyle|a|3
undermine|zayıflatmak|v|3
unequivocal|kesin, açık|a|3
unravel|çözmek|v|3
upheaval|çalkantı|n|3
usurp|gasp etmek|v|3
vehement|şiddetli|a|3
venerable|saygıdeğer|a|3
verbose|laf kalabalığı yapan|a|3
vex|sinirlendirmek|v|3
viable|uygulanabilir|a|3
vicarious|dolaylı|a|3
vigilant|tetikte|a|3
vindicate|haklı çıkarmak|v|3
volatile|değişken|a|3
wane|azalmak|v|3
warrant|gerektirmek, haklı kılmak|v|3
wary|temkinli|a|3
whimsical|kaprisli|a|3
yield|sağlamak, vermek|v|3
zealous|gayretli|a|3
''';
