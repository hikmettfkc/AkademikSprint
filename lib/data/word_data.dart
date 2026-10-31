// Ozgun, elle hazirlanmis kelime listesi. Akademik metinler ve dil sinavlari odakli.
// Bicim: ingilizce | turkce | tur | seviye (1 kolay, 2 orta, 3 zor)
// Tur: v fiil, n isim, a sifat, d zarf, p phrasal verb / kalip, c baglac / baglayici
// Baska bir uygulama, kitap veya siteden kopyalanmamistir.
const String rawWords = r'''
abandon|terk etmek|v|1
ability|yetenek|n|1
absence|yokluk, devamsızlık|n|1
absent|yok, devamsız|a|1
absolute|mutlak|a|1
absorb|emmek|v|1
academic|akademik|a|1
accept|kabul etmek|v|1
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
admission|kabul, giriş|n|1
admit|itiraf etmek|v|1
adopt|benimsemek|v|1
adult|yetişkin|n|1
advance|ilerlemek|v|1
advantage|avantaj|n|1
advertise|reklam yapmak|v|1
advice|tavsiye|n|1
affect|etkilemek|v|1
afford|parası yetmek|v|1
afraid|korkmuş|a|1
afterwards|sonradan|d|1
agree|katılmak, hemfikir olmak|v|1
agreement|anlaşma|n|1
agriculture|tarım|n|1
aid|yardım|n|1
aim|amaç|n|1
alive|canlı, hayatta|a|1
allow|izin vermek|v|1
almost|neredeyse|d|1
alone|yalnız|a|1
already|zaten|d|1
alter|değiştirmek|v|1
although|-e rağmen|c|1
amazing|şaşırtıcı|a|1
amount|miktar|n|1
analyse|analiz etmek|v|1
ancient|antik, eski|a|1
anger|öfke|n|1
animal|hayvan|n|1
anniversary|yıl dönümü|n|1
announce|duyurmak|v|1
annual|yıllık|a|1
answer|cevap|n|1
anxious|endişeli|a|1
apparent|açık, belli|a|1
apparently|görünüşe göre|d|1
appear|görünmek|v|1
appearance|görünüş|n|1
application|başvuru, uygulama|n|1
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
arrest|tutuklamak|v|1
arrival|varış|n|1
arrive|varmak|v|1
article|makale|n|1
artist|sanatçı|n|1
as a result|sonuç olarak|c|1
as long as|-dığı sürece|c|1
as soon as|-er -mez|c|1
as well as|-in yanı sıra|c|1
asleep|uykuda|a|1
aspect|yön, boyut|n|1
assess|değerlendirmek|v|1
assignment|ödev, görev|n|1
assume|varsaymak|v|1
atom|atom|n|1
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
avoidance|kaçınma|n|1
aware|farkında|a|1
awful|berbat|a|1
back up|desteklemek|p|1
background|geçmiş, arka plan|n|1
bacteria|bakteri|n|1
balance|denge|n|1
ban|yasaklamak|v|1
basic|temel|a|1
bear|katlanmak|v|1
beat|yenmek|v|1
because of|yüzünden, -den dolayı|c|1
beginning|başlangıç|n|1
behave|davranmak|v|1
behaviour|davranış|n|1
belief|inanç|n|1
belong|ait olmak|v|1
beneficial|faydalı|a|1
benefit|fayda|n|1
besides|ayrıca|c|1
beyond|ötesinde|c|1
billion|milyar|n|1
birth|doğum|n|1
bitter|acı|a|1
blood|kan|n|1
boil|kaynamak|v|1
bone|kemik|n|1
boost|artırmak|v|1
border|sınır|n|1
boring|sıkıcı|a|1
borrow|ödünç almak|v|1
bottom|alt, dip|n|1
brain|beyin|n|1
branch|şube, dal|n|1
brave|cesur|a|1
break down|bozulmak, parçalamak|p|1
breath|nefes|n|1
breathe|nefes almak|v|1
brief|kısa|a|1
bright|parlak|a|1
brilliant|parlak, harika|a|1
bring up|gündeme getirmek, yetiştirmek|p|1
broad|geniş|a|1
budget|bütçe|n|1
build|inşa etmek|v|1
burden|yük|n|1
burn|yakmak|v|1
bury|gömmek|v|1
business|iş, işletme|n|1
calculate|hesaplamak|v|1
calculation|hesaplama|n|1
call off|iptal etmek|p|1
campaign|kampanya|n|1
cancel|iptal etmek|v|1
capacity|kapasite|n|1
capital|başkent, sermaye|n|1
carbon|karbon|n|1
career|kariyer|n|1
careful|dikkatli|a|1
carry on|devam etmek|p|1
carry out|yürütmek, gerçekleştirmek|p|1
catch up with|yetişmek|p|1
cause|neden olmak|v|1
celebrate|kutlamak|v|1
cell|hücre|n|1
century|yüzyıl|n|1
ceremony|tören|n|1
certain|kesin, emin|a|1
challenge|zorluk, meydan okuma|n|1
chance|şans, fırsat|n|1
change|değişim|n|1
chapter|bölüm|n|1
character|karakter|n|1
charge|ücret|n|1
cheap|ucuz|a|1
chemical|kimyasal|a|1
childhood|çocukluk|n|1
choice|seçim|n|1
choose|seçmek|v|1
circle|daire|n|1
citizen|vatandaş|n|1
claim|iddia etmek|v|1
classic|klasik|a|1
clear|açık, net|a|1
clever|zeki|a|1
climate|iklim|n|1
coal|kömür|n|1
coast|kıyı|n|1
collapse|çökmek|v|1
collect|toplamak|v|1
combine|birleştirmek|v|1
come across|rastlamak|p|1
comfortable|rahat|a|1
common|yaygın, ortak|a|1
communicate|iletişim kurmak|v|1
communication|iletişim|n|1
community|topluluk|n|1
company|şirket|n|1
compare|karşılaştırmak|v|1
competition|rekabet, yarışma|n|1
competitor|rakip|n|1
complain|şikâyet etmek|v|1
complaint|şikâyet|n|1
complete|tamamlamak|v|1
complex|karmaşık|a|1
comprehensive|kapsamlı|a|1
concern|endişe|n|1
conclusion|sonuç|n|1
condition|koşul, durum|n|1
conduct|yürütmek|v|1
conference|konferans|n|1
confident|kendinden emin|a|1
confirm|doğrulamak|v|1
conflict|çatışma|n|1
connect|bağlamak|v|1
consequence|sonuç|n|1
consider|düşünmek, göz önünde bulundurmak|v|1
considerable|oldukça büyük|a|1
consist of|-den oluşmak|p|1
consistent|tutarlı|a|1
consumer|tüketici|n|1
contact|iletişim, temas|n|1
contain|içermek|v|1
content|içerik|n|1
continent|kıta|n|1
continue|devam etmek|v|1
contribute|katkıda bulunmak|v|1
contribution|katkı|n|1
control|kontrol etmek|v|1
controversial|tartışmalı|a|1
conversation|konuşma|n|1
convince|ikna etmek|v|1
cooperation|iş birliği|n|1
copy|kopyalamak|v|1
corner|köşe|n|1
correct|doğru|a|1
cost|maliyet|n|1
cotton|pamuk|n|1
council|konsey|n|1
count|saymak|v|1
courage|cesaret|n|1
crash|çarpmak|v|1
create|yaratmak|v|1
crime|suç|n|1
crisis|kriz|n|1
criticise|eleştirmek|v|1
crop|ekin, ürün|n|1
cross|geçmek|v|1
crowd|kalabalık|n|1
crowded|kalabalık|a|1
crucial|çok önemli|a|1
cultural|kültürel|a|1
culture|kültür|n|1
cure|tedavi etmek|v|1
curious|meraklı|a|1
current|güncel, şimdiki|a|1
customer|müşteri|n|1
daily|günlük|a|1
damage|zarar|n|1
danger|tehlike|n|1
dangerous|tehlikeli|a|1
data|veri|n|1
dead|ölü|a|1
deal|uğraşmak, ilgilenmek|v|1
deal with|ele almak|p|1
death|ölüm|n|1
debate|tartışma|n|1
debt|borç|n|1
decade|on yıl|n|1
decide|karar vermek|v|1
decision|karar|n|1
decline|azalmak|v|1
decrease|azalmak|v|1
deep|derin|a|1
defend|savunmak|v|1
definition|tanım|n|1
degree|derece|n|1
delay|ertelemek, geciktirmek|v|1
deliver|teslim etmek|v|1
demand|talep|n|1
demonstrate|göstermek|v|1
deny|inkâr etmek|v|1
department|bölüm|n|1
departure|ayrılış|n|1
depend|bağlı olmak|v|1
depend on|bağlı olmak|p|1
depth|derinlik|n|1
describe|tanımlamak, betimlemek|v|1
design|tasarlamak|v|1
desire|arzu|n|1
despite|-e rağmen|c|1
dessert|tatlı|n|1
destroy|yok etmek|v|1
detail|ayrıntı|n|1
detect|tespit etmek|v|1
develop|geliştirmek|v|1
development|gelişme|n|1
device|cihaz|n|1
diet|beslenme düzeni|n|1
difference|fark|n|1
difficult|zor|a|1
direct|doğrudan|a|1
direction|yön|n|1
dirty|kirli|a|1
disagree|katılmamak|v|1
disappear|kaybolmak|v|1
discover|keşfetmek|v|1
discovery|keşif|n|1
discuss|tartışmak, görüşmek|v|1
disease|hastalık|n|1
distance|mesafe|n|1
distinct|belirgin, farklı|a|1
diverse|çeşitli|a|1
divide|bölmek|v|1
document|belge|n|1
dominant|baskın|a|1
doubt|şüphe|n|1
dream|hayal etmek|v|1
drop|düşürmek|v|1
dry|kuru|a|1
due to|nedeniyle|c|1
duty|görev|n|1
earn|kazanmak|v|1
earthquake|deprem|n|1
easily|kolayca|d|1
economy|ekonomi|n|1
edge|kenar|n|1
editor|editör|n|1
educate|eğitmek|v|1
education|eğitim|n|1
effect|etki|n|1
effective|etkili|a|1
effort|çaba|n|1
elderly|yaşlı|a|1
election|seçim|n|1
electricity|elektrik|n|1
eliminate|ortadan kaldırmak|v|1
emerge|ortaya çıkmak|v|1
emergency|acil durum|n|1
emotion|duygu|n|1
emphasize|vurgulamak|v|1
employ|istihdam etmek|v|1
employee|çalışan|n|1
employer|işveren|n|1
empty|boş|a|1
encourage|cesaretlendirmek|v|1
enemy|düşman|n|1
energy|enerji|n|1
engine|motor|n|1
engineer|mühendis|n|1
enhance|geliştirmek|v|1
enjoy|keyif almak|v|1
enormous|devasa|a|1
enough|yeterli|a|1
ensure|sağlamak, garantilemek|v|1
entrance|giriş|n|1
environment|çevre|n|1
equal|eşit|a|1
equipment|ekipman|n|1
error|hata|n|1
escape|kaçmak|v|1
especially|özellikle|d|1
essential|temel, gerekli|a|1
estimate|tahmin etmek|v|1
evaluate|değerlendirmek|v|1
even if|-se bile|c|1
even though|-dığı halde|c|1
event|olay|n|1
eventually|sonunda|d|1
evidence|kanıt|n|1
evident|açık, belli|a|1
exact|tam, kesin|a|1
exam|sınav|n|1
examine|incelemek|v|1
example|örnek|n|1
excellent|mükemmel|a|1
exchange|değiş tokuş|n|1
excited|heyecanlı|a|1
exercise|egzersiz|n|1
exhibition|sergi|n|1
exist|var olmak|v|1
expand|genişlemek|v|1
expect|beklemek|v|1
expensive|pahalı|a|1
experience|deneyim|n|1
experiment|deney|n|1
expert|uzman|n|1
explain|açıklamak|v|1
explanation|açıklama|n|1
explore|keşfetmek, araştırmak|v|1
explosion|patlama|n|1
export|ihraç etmek|v|1
express|ifade etmek|v|1
extra|ek, fazladan|a|1
extreme|aşırı|a|1
fact|gerçek|n|1
factor|etken|n|1
factory|fabrika|n|1
fail|başarısız olmak|v|1
failure|başarısızlık|n|1
fair|adil|a|1
familiar|tanıdık|a|1
famous|ünlü|a|1
fashion|moda|n|1
fault|kusur, hata|n|1
favour|iyilik|n|1
fear|korku|n|1
feature|özellik|n|1
feed|beslemek|v|1
fence|çit|n|1
festival|festival|n|1
field|alan|n|1
fight|savaşmak|v|1
figure|rakam, şekil|n|1
figure out|anlamak, çözmek|p|1
fill|doldurmak|v|1
fill in|doldurmak|p|1
film|film|n|1
final|son|a|1
finally|sonunda|d|1
financial|mali|a|1
find out|öğrenmek|p|1
flight|uçuş|n|1
float|yüzmek, süzülmek|v|1
flood|sel|n|1
flow|akmak|v|1
focus|odaklanmak|v|1
focus on|odaklanmak|p|1
fold|katlamak|v|1
follow|takip etmek|v|1
for instance|örneğin|c|1
force|zorlamak|v|1
forecast|tahmin|n|1
foreign|yabancı|a|1
forest|orman|n|1
forget|unutmak|v|1
forgive|affetmek|v|1
form|biçim|n|1
former|eski, önceki|a|1
fortunately|neyse ki|d|1
freedom|özgürlük|n|1
frequent|sık|a|1
fresh|taze|a|1
friendship|arkadaşlık|n|1
frighten|korkutmak|v|1
fuel|yakıt|n|1
function|işlev|n|1
fundamental|temel|a|1
future|gelecek|n|1
gain|kazanmak, elde etmek|v|1
gas|gaz|n|1
gather|toplamak|v|1
general|genel|a|1
generation|nesil|n|1
generous|cömert|a|1
get along with|iyi geçinmek|p|1
get over|atlatmak|p|1
get rid of|kurtulmak|p|1
gift|hediye|n|1
give up|vazgeçmek|p|1
global|küresel|a|1
goal|hedef|n|1
government|hükümet|n|1
grade|not, sınıf|n|1
gradual|kademeli|a|1
gradually|yavaş yavaş|d|1
grain|tahıl|n|1
greet|selamlamak|v|1
ground|zemin|n|1
grow|büyümek|v|1
growth|büyüme|n|1
guard|korumak|v|1
guess|tahmin etmek|v|1
guest|misafir|n|1
guide|rehber|n|1
habit|alışkanlık|n|1
hand in|teslim etmek|p|1
handle|başa çıkmak|v|1
happiness|mutluluk|n|1
harm|zarar vermek|v|1
hate|nefret etmek|v|1
health|sağlık|n|1
healthy|sağlıklı|a|1
heart|kalp|n|1
heat|ısı|n|1
heavy|ağır|a|1
height|yükseklik|n|1
hide|saklamak|v|1
hire|kiralamak, işe almak|v|1
historic|tarihi|a|1
history|tarih|n|1
holiday|tatil|n|1
honest|dürüst|a|1
hope|umut etmek|v|1
host|ev sahibi|n|1
household|hane|n|1
however|ancak|c|1
huge|kocaman|a|1
human|insan|n|1
hunt|avlamak|v|1
hurry|acele etmek|v|1
hypothesis|hipotez|n|1
ice|buz|n|1
identical|aynı, özdeş|a|1
identity|kimlik|n|1
ignore|görmezden gelmek|v|1
illegal|yasa dışı|a|1
illness|hastalık|n|1
illustrate|örneklendirmek|v|1
image|görüntü|n|1
imagine|hayal etmek|v|1
immediately|hemen|d|1
impact|etki|n|1
import|ithal etmek|v|1
importance|önem|n|1
impossible|imkânsız|a|1
improve|geliştirmek, iyileştirmek|v|1
in addition to|-e ek olarak|c|1
in order to|-mek için|c|1
in spite of|-e rağmen|c|1
inch|inç|n|1
include|içermek, kapsamak|v|1
income|gelir|n|1
increase|artmak|v|1
indeed|gerçekten|d|1
independent|bağımsız|a|1
industrial|endüstriyel|a|1
industry|sanayi|n|1
inevitable|kaçınılmaz|a|1
infant|bebek|n|1
influence|etkilemek|v|1
inform|bilgilendirmek|v|1
information|bilgi|n|1
injury|yaralanma|n|1
innovative|yenilikçi|a|1
insect|böcek|n|1
inside|içeride|d|1
instead|yerine|c|1
instead of|yerine|c|1
instruction|talimat|n|1
intelligent|zeki|a|1
intend|niyet etmek|v|1
intense|yoğun|a|1
interest|ilgi|n|1
international|uluslararası|a|1
interpret|yorumlamak|v|1
interview|mülakat|n|1
introduce|tanıtmak|v|1
invent|icat etmek|v|1
invention|icat|n|1
invest|yatırım yapmak|v|1
investigate|araştırmak|v|1
investigation|soruşturma|n|1
invite|davet etmek|v|1
involve|içermek, dahil etmek|v|1
irrelevant|ilgisiz|a|1
island|ada|n|1
issue|sorun, konu|n|1
item|öğe, madde|n|1
jewellery|mücevher|n|1
join|katılmak|v|1
joke|şaka|n|1
journey|yolculuk|n|1
judge|yargılamak|v|1
justice|adalet|n|1
kill|öldürmek|v|1
kingdom|krallık|n|1
knowledge|bilgi, bilgi birikimi|n|1
laboratory|laboratuvar|n|1
lack|eksiklik|n|1
land|kara, arazi|n|1
language|dil|n|1
largely|büyük ölçüde|d|1
lately|son zamanlarda|d|1
law|yasa|n|1
lawyer|avukat|n|1
layer|katman|n|1
lead|yol açmak, liderlik etmek|v|1
lead to|yol açmak|p|1
leader|lider|n|1
lecture|ders, konferans|n|1
length|uzunluk|n|1
lesson|ders|n|1
level|seviye|n|1
liberty|özgürlük|n|1
lift|kaldırmak|v|1
limit|sınır|n|1
liquid|sıvı|n|1
literature|edebiyat|n|1
loan|kredi, borç|n|1
local|yerel|a|1
locate|yerini bulmak|v|1
lonely|yalnız, kimsesiz|a|1
look after|bakmak, ilgilenmek|p|1
look forward to|dört gözle beklemek|p|1
loss|kayıp|n|1
luck|şans|n|1
machine|makine|n|1
mainly|başlıca, çoğunlukla|d|1
maintain|sürdürmek|v|1
major|başlıca, büyük|a|1
majority|çoğunluk|n|1
manage|yönetmek|v|1
manager|yönetici|n|1
market|pazar|n|1
marriage|evlilik|n|1
material|malzeme|n|1
matter|önemli olmak|v|1
meal|öğün|n|1
meaning|anlam|n|1
meanwhile|bu arada|c|1
measure|ölçmek|v|1
media|medya|n|1
medical|tıbbi|a|1
medicine|ilaç, tıp|n|1
member|üye|n|1
memory|hafıza, anı|n|1
mental|zihinsel|a|1
mention|bahsetmek|v|1
message|mesaj|n|1
metal|metal|n|1
method|yöntem|n|1
million|milyon|n|1
mind|zihin|n|1
mineral|mineral|n|1
mistake|hata|n|1
mixture|karışım|n|1
model|model|n|1
modern|modern, çağdaş|a|1
modify|değiştirmek|v|1
moment|an|n|1
mood|ruh hali|n|1
moreover|üstelik|c|1
mountain|dağ|n|1
movement|hareket|n|1
muscle|kas|n|1
museum|müze|n|1
nation|ulus|n|1
natural|doğal|a|1
nature|doğa|n|1
nearly|neredeyse|d|1
necessary|gerekli|a|1
negative|olumsuz|a|1
neighbour|komşu|n|1
nervous|gergin|a|1
network|ağ|n|1
nevertheless|yine de|c|1
noise|gürültü|n|1
normal|normal|a|1
notice|fark etmek|v|1
numerous|çok sayıda|a|1
nurse|hemşire|n|1
object|nesne|n|1
observe|gözlemlemek|v|1
obstacle|engel|n|1
obtain|elde etmek|v|1
obvious|apaçık|a|1
occur|meydana gelmek|v|1
ocean|okyanus|n|1
offer|teklif etmek|v|1
official|resmi|a|1
oil|petrol, yağ|n|1
on the other hand|öte yandan|c|1
operation|ameliyat, işlem|n|1
opinion|görüş|n|1
opportunity|fırsat|n|1
opposite|zıt|a|1
order|düzen, sıra|n|1
ordinary|sıradan|a|1
organ|organ|n|1
organisation|kuruluş|n|1
organise|düzenlemek, organize etmek|v|1
original|özgün|a|1
otherwise|aksi halde|c|1
outcome|sonuç|n|1
outdoor|açık hava|a|1
overcome|üstesinden gelmek|v|1
own|sahip olmak|v|1
oxygen|oksijen|n|1
pain|acı|n|1
painful|acı veren|a|1
painting|tablo|n|1
participate|katılmak|v|1
particular|belirli|a|1
partner|ortak|n|1
passenger|yolcu|n|1
past|geçmiş|n|1
patient|sabırlı|a|1
pattern|örüntü, desen|n|1
payment|ödeme|n|1
peace|barış|n|1
peaceful|huzurlu|a|1
percentage|yüzde|n|1
perfect|kusursuz|a|1
perform|gerçekleştirmek|v|1
performance|performans|n|1
period|dönem|n|1
permanent|kalıcı|a|1
permission|izin|n|1
personal|kişisel|a|1
persuade|ikna etmek|v|1
pet|evcil hayvan|n|1
photograph|fotoğraf|n|1
physical|fiziksel|a|1
pick up|öğrenmek, toplamak|p|1
plan|planlamak|v|1
planet|gezegen|n|1
plant|bitki|n|1
plastic|plastik|n|1
pleasant|hoş|a|1
poem|şiir|n|1
poet|şair|n|1
point out|belirtmek|p|1
poison|zehir|n|1
policy|politika|n|1
polite|kibar|a|1
politician|politikacı|n|1
politics|siyaset|n|1
pollution|kirlilik|n|1
poor|yoksul|a|1
popular|popüler|a|1
population|nüfus|n|1
port|liman|n|1
positive|olumlu|a|1
possible|mümkün|a|1
poverty|yoksulluk|n|1
power|güç|n|1
powerful|güçlü|a|1
practice|uygulama, pratik|n|1
predict|tahmin etmek|v|1
prefer|tercih etmek|v|1
pregnant|hamile|a|1
prepare|hazırlamak|v|1
present|sunmak|v|1
preserve|korumak|v|1
pressure|baskı|n|1
prevent|önlemek|v|1
previous|önceki|a|1
price|fiyat|n|1
prison|hapishane|n|1
private|özel|a|1
prize|ödül|n|1
probably|muhtemelen|d|1
process|süreç|n|1
produce|üretmek|v|1
product|ürün|n|1
professor|profesör|n|1
profit|kâr|n|1
progress|ilerleme|n|1
project|proje|n|1
promise|söz vermek|v|1
property|mülk|n|1
proposal|öneri|n|1
protect|korumak|v|1
protein|protein|n|1
proud|gururlu|a|1
prove|kanıtlamak|v|1
provide|sağlamak|v|1
psychologist|psikolog|n|1
public|kamu, halk|n|1
publish|yayımlamak|v|1
punishment|ceza|n|1
pure|saf|a|1
purpose|amaç|n|1
put off|ertelemek|p|1
quality|kalite|n|1
quantity|nicelik, miktar|n|1
quarter|çeyrek|n|1
queue|kuyruk|n|1
quickly|hızla|d|1
quiet|sessiz|a|1
rain|yağmur|n|1
raise|yükseltmek|v|1
range|aralık, yelpaze|n|1
rapid|hızlı|a|1
rare|nadir|a|1
rather|oldukça, daha çok|c|1
reach|ulaşmak|v|1
react|tepki vermek|v|1
reader|okur|n|1
realise|fark etmek|v|1
reality|gerçeklik|n|1
reason|neden, sebep|n|1
receive|almak|v|1
recent|son, yakın zamanda olan|a|1
recipe|tarif|n|1
recognise|tanımak|v|1
recommend|önermek|v|1
record|kaydetmek|v|1
recover|iyileşmek|v|1
reduce|azaltmak|v|1
reduction|azalma|n|1
refuse|reddetmek|v|1
region|bölge|n|1
regular|düzenli|a|1
relationship|ilişki|n|1
relax|rahatlamak|v|1
release|serbest bırakmak|v|1
reliable|güvenilir|a|1
religion|din|n|1
rely on|güvenmek|p|1
remain|kalmak|v|1
remarkable|dikkat çekici|a|1
remind|hatırlatmak|v|1
remove|kaldırmak|v|1
rent|kiralamak|v|1
repair|onarmak|v|1
repeat|tekrar etmek|v|1
replace|yerine koymak|v|1
reply|yanıt|n|1
report|rapor|n|1
represent|temsil etmek|v|1
request|rica, talep|n|1
require|gerektirmek|v|1
rescue|kurtarmak|v|1
research|araştırma|n|1
resident|sakin|n|1
resource|kaynak|n|1
respect|saygı|n|1
respond|yanıt vermek|v|1
responsible|sorumlu|a|1
rest|dinlenmek|v|1
result|sonuç|n|1
result in|ile sonuçlanmak|p|1
retirement|emeklilik|n|1
return|geri dönmek|v|1
reveal|ortaya çıkarmak|v|1
review|incelemek|v|1
rich|zengin|a|1
risk|risk|n|1
river|nehir|n|1
robot|robot|n|1
rock|kaya|n|1
role|rol|n|1
root|kök|n|1
rough|pürüzlü, kaba|a|1
royal|kraliyet|a|1
rubbish|çöp|n|1
rule|kural|n|1
run out of|tükenmek|p|1
sad|üzgün|a|1
safe|güvenli|a|1
sail|yelken açmak|v|1
salary|maaş|n|1
sale|satış|n|1
salt|tuz|n|1
sample|örnek|n|1
satisfy|tatmin etmek|v|1
save|kurtarmak, biriktirmek|v|1
scale|ölçek|n|1
scene|sahne|n|1
schedule|program|n|1
science|bilim|n|1
scientist|bilim insanı|n|1
screen|ekran|n|1
sea|deniz|n|1
search|aramak|v|1
season|mevsim|n|1
secret|gizli|a|1
security|güvenlik|n|1
seed|tohum|n|1
select|seçmek|v|1
sentence|cümle|n|1
separate|ayırmak|v|1
serious|ciddi|a|1
service|hizmet|n|1
set up|kurmak|p|1
severe|şiddetli|a|1
shape|şekil|n|1
share|paylaşmak|v|1
sharp|keskin|a|1
shine|parlamak|v|1
shock|şok|n|1
shortage|kıtlık|n|1
shortly|kısa süre içinde|d|1
show up|ortaya çıkmak, gelmek|p|1
sickness|hastalık|n|1
sight|görme|n|1
signal|sinyal|n|1
significant|önemli|a|1
silence|sessizlik|n|1
silver|gümüş|n|1
similar|benzer|a|1
simple|basit|a|1
situation|durum|n|1
skill|beceri|n|1
skin|deri|n|1
smell|koku|n|1
smoke|duman|n|1
so that|-sin diye|c|1
society|toplum|n|1
soldier|asker|n|1
solution|çözüm|n|1
solve|çözmek|v|1
soul|ruh|n|1
source|kaynak|n|1
space|uzay, alan|n|1
species|tür|n|1
speech|konuşma|n|1
speed|hız|n|1
spend|harcamak|v|1
spirit|ruh|n|1
sport|spor|n|1
spread|yaymak|v|1
stable|istikrarlı|a|1
staff|personel|n|1
stage|aşama|n|1
standard|standart|n|1
star|yıldız|n|1
state|belirtmek|v|1
statement|açıklama, ifade|n|1
steal|çalmak|v|1
steel|çelik|n|1
stomach|mide|n|1
storm|fırtına|n|1
strange|tuhaf|a|1
stranger|yabancı|n|1
strength|güç|n|1
stress|stres|n|1
strict|katı, sıkı|a|1
structure|yapı|n|1
struggle|mücadele etmek|v|1
student|öğrenci|n|1
subject|konu, ders|n|1
succeed|başarılı olmak|v|1
success|başarı|n|1
such as|gibi|c|1
sudden|ani|a|1
suffer|acı çekmek|v|1
sufficient|yeterli|a|1
sugar|şeker|n|1
suggest|önermek|v|1
suitable|uygun|a|1
summary|özet|n|1
sun|güneş|n|1
supermarket|süpermarket|n|1
supply|tedarik etmek|v|1
support|desteklemek|v|1
suppose|varsaymak, sanmak|v|1
surface|yüzey|n|1
surgeon|cerrah|n|1
surprise|şaşırtmak|v|1
surround|çevrelemek|v|1
survey|anket|n|1
survive|hayatta kalmak|v|1
sweet|tatlı|a|1
symbol|sembol|n|1
system|sistem|n|1
take part in|katılmak|p|1
take place|gerçekleşmek|p|1
talent|yetenek|n|1
target|hedef|n|1
task|görev|n|1
tax|vergi|n|1
technology|teknoloji|n|1
teenager|genç|n|1
temperature|sıcaklık|n|1
temporary|geçici|a|1
tend|eğiliminde olmak|v|1
thanks to|sayesinde|c|1
theory|kuram|n|1
therefore|bu nedenle|c|1
threat|tehdit|n|1
thus|böylece|c|1
tiny|minik|a|1
tool|alet|n|1
tooth|diş|n|1
topic|konu|n|1
total|toplam|a|1
tour|tur|n|1
tourist|turist|n|1
trade|ticaret|n|1
tradition|gelenek|n|1
traffic|trafik|n|1
train|eğitmek|v|1
transport|taşımak|v|1
travel|seyahat etmek|v|1
treat|davranmak, tedavi etmek|v|1
tree|ağaç|n|1
trial|deneme, dava|n|1
trip|gezi|n|1
tropical|tropikal|a|1
trouble|sorun|n|1
trust|güvenmek|v|1
truth|gerçek, doğruluk|n|1
turn down|reddetmek|p|1
turn into|-e dönüşmek|p|1
twice|iki kez|d|1
typical|tipik|a|1
unemployment|işsizlik|n|1
uniform|üniforma|n|1
union|birlik|n|1
unique|eşsiz|a|1
universe|evren|n|1
university|üniversite|n|1
unknown|bilinmeyen|a|1
unless|-medikçe|c|1
unusual|alışılmadık|a|1
upset|üzgün|a|1
useful|yararlı|a|1
usually|genellikle|d|1
utilize|kullanmak|v|1
value|değer|n|1
various|çeşitli|a|1
vegetable|sebze|n|1
vehicle|araç|n|1
victim|kurban|n|1
view|görüş|n|1
village|köy|n|1
violent|şiddetli, saldırgan|a|1
virus|virüs|n|1
visible|görünür|a|1
visitor|ziyaretçi|n|1
vital|hayati|a|1
voice|ses|n|1
volunteer|gönüllü|n|1
vote|oy vermek|v|1
wage|ücret|n|1
war|savaş|n|1
warn|uyarmak|v|1
waste|israf etmek|v|1
wave|dalga|n|1
weak|zayıf|a|1
wealth|zenginlik|n|1
weapon|silah|n|1
weather|hava durumu|n|1
wedding|düğün|n|1
weight|ağırlık|n|1
wherever|her nerede|c|1
whether|-ip -mediği|c|1
while|-iken|c|1
wide|geniş|a|1
widespread|yaygın|a|1
wild|vahşi|a|1
wind|rüzgâr|n|1
wing|kanat|n|1
winner|kazanan|n|1
wisdom|bilgelik|n|1
wonder|merak etmek|v|1
wood|odun, tahta|n|1
work out|çözmek, egzersiz yapmak|p|1
worker|işçi|n|1
worry|endişelenmek|v|1
worth|değer|a|1
wound|yara|n|1
yet|yine de, henüz|c|1
youth|gençlik|n|1
zone|bölge|n|1
abnormal|anormal|a|2
abolish|kaldırmak, yürürlükten kaldırmak|v|2
abroad|yurt dışında|d|2
absorption|emilim|n|2
abstraction|soyutlama|n|2
absurd|saçma|a|2
abundance|bolluk|n|2
abundant|bol, bereketli|a|2
abuse|kötüye kullanmak|v|2
academy|akademi|n|2
accelerate|hızlandırmak|v|2
accelerated|hızlandırılmış|a|2
acceptance|kabul|n|2
accessible|erişilebilir|a|2
accommodate|barındırmak|v|2
accordingly|buna göre, bu nedenle|c|2
account for|açıklamak, oluşturmak|p|2
accountable|hesap verebilir|a|2
accumulate|biriktirmek|v|2
accumulation|birikim|n|2
accuracy|doğruluk|n|2
accuse|suçlamak|v|2
acid|asit|n|2
acknowledge|kabul etmek|v|2
acquire|edinmek|v|2
acquisition|edinim|n|2
adapt|uyum sağlamak|v|2
adaptation|uyum, uyarlama|n|2
add up to|toplamı etmek|p|2
addict|bağımlı|n|2
addiction|bağımlılık|n|2
adjust|ayarlamak|v|2
administer|yönetmek, uygulamak|v|2
administration|yönetim|n|2
adolescence|ergenlik|n|2
adolescent|ergen|n|2
advent|ortaya çıkış, geliş|n|2
adverse|olumsuz, ters|a|2
advocacy|savunuculuk|n|2
advocate|savunmak|v|2
aesthetic|estetik|a|2
affection|sevgi, şefkat|n|2
affordable|uygun fiyatlı|a|2
aggression|saldırganlık|n|2
aggressive|saldırgan|a|2
aging|yaşlanma|n|2
agricultural|tarımsal|a|2
alarming|endişe verici|a|2
alien|yabancı|a|2
allergy|alerji|n|2
alleviate|hafifletmek|v|2
alliance|ittifak|n|2
allocate|tahsis etmek|v|2
allocation|tahsis|n|2
alternative|alternatif, seçenek|n|2
altitude|rakım|n|2
ambiguous|belirsiz, muğlak|a|2
ambition|hırs, tutku|n|2
amend|değiştirmek, düzeltmek|v|2
analogy|benzetme|n|2
analysis|analiz|n|2
analytical|analitik|a|2
anatomy|anatomi|n|2
ancestor|ata|n|2
anonymous|isimsiz|a|2
anticipate|öngörmek|v|2
anticipation|beklenti|n|2
anxiety|kaygı|n|2
apparatus|aygıt|n|2
appeal|hitap etmek|v|2
appetite|iştah|n|2
applicant|başvuru sahibi|n|2
appoint|atamak|v|2
appraise|değer biçmek|v|2
apprehend|yakalamak|v|2
approval|onay|n|2
approximate|yaklaşık|a|2
aptitude|yatkınlık|n|2
archaeology|arkeoloji|n|2
archive|arşiv|n|2
arguably|tartışmaya açık olarak|d|2
arise|ortaya çıkmak|v|2
artificial|yapay|a|2
as opposed to|-in aksine|c|2
as though|sanki|c|2
aspiration|özlem, hedef|n|2
assemble|toplamak, birleştirmek|v|2
assert|ileri sürmek|v|2
assessment|değerlendirme|n|2
asset|varlık, değer|n|2
assign|görevlendirmek|v|2
assist|yardım etmek|v|2
assistance|yardım|n|2
associate|ilişkilendirmek|v|2
assumption|varsayım|n|2
assure|temin etmek|v|2
astronomy|astronomi|n|2
atmosphere|atmosfer|n|2
attach|eklemek, iliştirmek|v|2
attain|ulaşmak, erişmek|v|2
attainment|başarı, erişim|n|2
attendance|katılım|n|2
attribute|atfetmek|v|2
attribution|atıf|n|2
auditory|işitsel|a|2
authentic|gerçek, otantik|a|2
authorise|yetkilendirmek|v|2
authority|otorite, yetki|n|2
automatic|otomatik|a|2
autonomy|özerklik|n|2
availability|bulunabilirlik|n|2
awareness|farkındalık|n|2
awkward|garip, beceriksiz|a|2
backward|geri kalmış|a|2
bankrupt|iflas etmiş|a|2
barely|ancak, zar zor|d|2
barrier|engel|n|2
behalf|adına|n|2
behavioural|davranışsal|a|2
beneath|altında|c|2
beneficiary|yararlanıcı|n|2
betray|ihanet etmek|v|2
beware|dikkat etmek|v|2
bias|önyargı|n|2
biased|önyargılı|a|2
biodiversity|biyolojik çeşitlilik|n|2
biological|biyolojik|a|2
biology|biyoloji|n|2
blame|suçlamak|v|2
bloodstream|kan dolaşımı|n|2
bond|bağ|n|2
boundary|sınır|n|2
break out|patlak vermek|p|2
breakthrough|çığır açan buluş|n|2
breed|üremek, yetiştirmek|v|2
bribe|rüşvet|n|2
bring about|neden olmak|p|2
brutal|acımasız|a|2
build up|biriktirmek, güçlendirmek|p|2
bulk|büyük kısım|n|2
bureaucracy|bürokrasi|n|2
by contrast|buna karşılık|c|2
by means of|aracılığıyla|c|2
call for|gerektirmek|p|2
calm|sakin|a|2
calorie|kalori|n|2
cancer|kanser|n|2
candidate|aday|n|2
capable|yetenekli|a|2
capture|ele geçirmek|v|2
cardiovascular|kalp-damar|a|2
casualty|kayıp, kazazede|n|2
catastrophe|felaket|n|2
cautious|temkinli|a|2
cease|sona ermek|v|2
celebrity|ünlü kişi|n|2
census|nüfus sayımı|n|2
certainty|kesinlik|n|2
certify|onaylamak, belgelemek|v|2
chamber|oda, meclis|n|2
chaos|kaos|n|2
characteristic|özellik|n|2
childbirth|doğum|n|2
cholesterol|kolesterol|n|2
chromosome|kromozom|n|2
chronic|kronik|a|2
circulate|dolaşmak|v|2
circulation|dolaşım|n|2
circumstance|koşul, durum|n|2
cite|alıntı yapmak|v|2
civil|sivil|a|2
civilisation|uygarlık|n|2
clarify|açıklığa kavuşturmak|v|2
clarity|açıklık, netlik|n|2
classification|sınıflandırma|n|2
classify|sınıflandırmak|v|2
clinical|klinik|a|2
cluster|küme|n|2
coastal|kıyı|a|2
coexist|bir arada var olmak|v|2
cognition|biliş|n|2
cognitive|bilişsel|a|2
coherence|tutarlılık|n|2
coherent|tutarlı|a|2
coincidence|tesadüf|n|2
collaborate|iş birliği yapmak|v|2
colleague|meslektaş|n|2
collective|toplu, ortak|a|2
colony|koloni|n|2
combustion|yanma|n|2
come up with|bulmak, ortaya atmak|p|2
commence|başlamak|v|2
commerce|ticaret|n|2
commission|komisyon|n|2
commit|işlemek, adamak|v|2
commitment|bağlılık, taahhüt|n|2
commodity|emtia, mal|n|2
communal|ortak, toplumsal|a|2
compact|sıkı, küçük|a|2
companion|arkadaş, refakatçi|n|2
comparable|karşılaştırılabilir|a|2
compassion|merhamet|n|2
compatible|uyumlu|a|2
compensate|telafi etmek|v|2
compensation|tazminat|n|2
competence|yeterlilik|n|2
competent|yetkin|a|2
compile|derlemek|v|2
complement|tamamlamak|v|2
complexity|karmaşıklık|n|2
complication|komplikasyon|n|2
component|bileşen|n|2
compose|oluşturmak|v|2
compound|bileşik|n|2
comprehend|kavramak|v|2
comprehension|kavrama|n|2
comprise|içermek, oluşmak|v|2
compromise|uzlaşma|n|2
compulsory|zorunlu|a|2
conceal|gizlemek|v|2
conceive|tasarlamak|v|2
concentrate|yoğunlaşmak|v|2
concentration|yoğunlaşma, derişim|n|2
concept|kavram|n|2
conception|anlayış, kavrayış|n|2
conclude|sonuçlandırmak|v|2
concrete|somut|a|2
condemn|kınamak|v|2
confess|itiraf etmek|v|2
confidence|güven|n|2
confine|sınırlamak|v|2
confinement|kapatılma|n|2
conformity|uygunluk|n|2
confront|yüzleşmek|v|2
confusion|karışıklık|n|2
congestion|tıkanıklık|n|2
conquer|fethetmek|v|2
conscious|bilinçli|a|2
consciousness|bilinç|n|2
consecutive|ardışık|a|2
consent|rıza, onay|n|2
consequently|sonuç olarak|c|2
conservation|koruma|n|2
conservationist|çevre koruyucu|n|2
conservative|tutucu|a|2
considerably|önemli ölçüde|d|2
considerate|düşünceli|a|2
consistency|tutarlılık|n|2
constant|sabit, sürekli|a|2
constitute|oluşturmak|v|2
constitution|anayasa|n|2
constrain|kısıtlamak|v|2
construct|inşa etmek|v|2
consult|danışmak|v|2
consume|tüketmek|v|2
consumption|tüketim|n|2
contaminate|kirletmek|v|2
contamination|kirlenme|n|2
contemplate|düşünüp taşınmak|v|2
contemporary|çağdaş|a|2
contend|iddia etmek|v|2
context|bağlam|n|2
continuity|süreklilik|n|2
contraception|doğum kontrolü|n|2
contract|sözleşme|n|2
contradict|çelişmek|v|2
contradiction|çelişki|n|2
contrary|aksine|a|2
contrast|karşıtlık|n|2
controversy|tartışma|n|2
convenient|elverişli|a|2
convention|sözleşme, gelenek|n|2
conventional|geleneksel|a|2
conversion|dönüşüm|n|2
convert|dönüştürmek|v|2
convey|iletmek, aktarmak|v|2
conviction|kanaat, mahkumiyet|n|2
cooperate|iş birliği yapmak|v|2
coordinate|koordine etmek|v|2
cope|başa çıkmak|v|2
corporate|kurumsal|a|2
correlation|ilişki, bağıntı|n|2
correspond|karşılık gelmek|v|2
corrupt|yozlaşmış|a|2
count on|güvenmek|p|2
counterfeit|sahte|a|2
counterpart|muadil|n|2
courageous|cesur|a|2
craft|zanaat|n|2
creativity|yaratıcılık|n|2
credibility|güvenilirlik|n|2
credible|inandırıcı|a|2
criterion|ölçüt|n|2
critical|eleştirel, kritik|a|2
crucially|en önemlisi|d|2
cruel|zalim|a|2
cuisine|mutfak|n|2
cultivate|yetiştirmek|v|2
cumulative|birikimli|a|2
curiosity|merak|n|2
curriculum|müfredat|n|2
custom|gelenek|n|2
cut back on|azaltmak|p|2
cut down on|kısmak, azaltmak|p|2
cycle|döngü|n|2
cynical|alaycı, kuşkucu|a|2
dairy|süt ürünü|n|2
deadline|son tarih|n|2
decay|çürüme|n|2
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
deforestation|ormansızlaşma|n|2
degeneration|bozulma|n|2
dehydration|susuzluk|n|2
delegate|yetki vermek|v|2
deliberate|kasıtlı|a|2
deliberately|kasıtlı olarak|d|2
delicate|hassas, narin|a|2
democracy|demokrasi|n|2
demographic|demografik|a|2
demolish|yıkmak|v|2
dense|yoğun|a|2
density|yoğunluk|n|2
dependence|bağımlılık|n|2
dependent|bağımlı|a|2
depict|tasvir etmek|v|2
deposit|depozito, birikinti|n|2
depression|depresyon, durgunluk|n|2
deprivation|yoksunluk|n|2
deprive|yoksun bırakmak|v|2
derive|türetmek, elde etmek|v|2
descendant|torun, soyundan gelen|n|2
desertification|çölleşme|n|2
deserve|hak etmek|v|2
designate|belirlemek|v|2
despair|umutsuzluk|n|2
desperate|çaresiz|a|2
destination|varış yeri|n|2
detain|gözaltına almak|v|2
detection|tespit|n|2
deteriorate|kötüleşmek|v|2
determination|kararlılık|n|2
determine|belirlemek|v|2
devastating|yıkıcı|a|2
devise|tasarlamak|v|2
devote|adamak|v|2
diabetes|diyabet|n|2
diagnose|teşhis koymak|v|2
diagnosis|teşhis|n|2
dialect|lehçe|n|2
die out|yok olmak|p|2
digestion|sindirim|n|2
dilemma|ikilem|n|2
dimension|boyut|n|2
diminish|azalmak|v|2
diplomatic|diplomatik|a|2
disability|engellilik|n|2
disadvantage|dezavantaj|n|2
disappointment|hayal kırıklığı|n|2
disaster|felaket|n|2
discipline|disiplin|n|2
disclose|açıklamak, ifşa etmek|v|2
discourage|cesaretini kırmak|v|2
discriminate|ayrımcılık yapmak|v|2
discrimination|ayrımcılık|n|2
dismiss|reddetmek, kovmak|v|2
disorder|bozukluk|n|2
display|sergilemek|v|2
dispose|elden çıkarmak|v|2
dispute|anlaşmazlık|n|2
disrupt|bozmak, aksatmak|v|2
dissolve|çözmek, çözünmek|v|2
distinction|ayrım|n|2
distinguish|ayırt etmek|v|2
distort|çarpıtmak|v|2
distribute|dağıtmak|v|2
distribution|dağıtım, dağılım|n|2
district|ilçe, bölge|n|2
diversity|çeşitlilik|n|2
domain|alan|n|2
domestic|yerli, evsel|a|2
dominate|hâkim olmak|v|2
donate|bağışlamak|v|2
dose|doz|n|2
draft|taslak|n|2
drastic|sert, köklü|a|2
draw up|hazırlamak (belge)|p|2
drought|kuraklık|n|2
durable|dayanıklı|a|2
duration|süre|n|2
dynamic|dinamik|a|2
eager|istekli|a|2
earnings|kazanç|n|2
ecology|ekoloji|n|2
ecosystem|ekosistem|n|2
efficiency|verimlilik|n|2
efficient|verimli|a|2
elaborate|ayrıntılı|a|2
elaboration|ayrıntılandırma|n|2
electoral|seçimle ilgili|a|2
elegant|zarif|a|2
element|öğe|n|2
eligible|uygun, hak sahibi|a|2
elimination|eleme|n|2
embrace|benimsemek|v|2
embryo|embriyo|n|2
emerging|gelişmekte olan|a|2
emigrate|yurt dışına göç etmek|v|2
emission|salım|n|2
empathy|empati|n|2
emphasis|vurgu|n|2
empirical|deneysel|a|2
employment|istihdam|n|2
enable|olanak sağlamak|v|2
encounter|karşılaşmak|v|2
encouragement|teşvik|n|2
end up|sonunda olmak, varmak|p|2
endanger|tehlikeye atmak|v|2
endangered|nesli tehlikede|a|2
endure|katlanmak|v|2
enforce|uygulamak, yürürlüğe koymak|v|2
engage|meşgul olmak, katılmak|v|2
enhancement|geliştirme|n|2
enormously|son derece|d|2
enrich|zenginleştirmek|v|2
enrolment|kayıt|n|2
enterprise|girişim|n|2
entertainment|eğlence|n|2
enthusiasm|coşku|n|2
entitle|hak vermek|v|2
entity|varlık|n|2
entrepreneur|girişimci|n|2
epidemic|salgın|n|2
equality|eşitlik|n|2
equation|denklem|n|2
equator|ekvator|n|2
equip|donatmak|v|2
equivalent|eşdeğer|a|2
era|çağ, dönem|n|2
erode|aşındırmak|v|2
erosion|erozyon|n|2
essence|öz|n|2
establish|kurmak|v|2
estimation|tahmin|n|2
ethical|etik|a|2
ethics|etik|n|2
ethnic|etnik|a|2
evaluation|değerlendirme|n|2
evaporate|buharlaşmak|v|2
evolution|evrim|n|2
evolve|evrimleşmek|v|2
exaggerate|abartmak|v|2
exaggeration|abartı|n|2
excavation|kazı|n|2
exceed|aşmak|v|2
exceptional|olağanüstü|a|2
excessive|aşırı|a|2
exclude|hariç tutmak|v|2
exclusion|dışlama|n|2
exclusive|özel, ayrıcalıklı|a|2
execute|yürütmek, idam etmek|v|2
exhaust|tüketmek|v|2
exhaustion|bitkinlik|n|2
exhibit|sergilemek|v|2
expansion|genişleme|n|2
expectancy|beklenti|n|2
expedition|keşif gezisi|n|2
expenditure|harcama|n|2
explicit|açık, net|a|2
exploit|sömürmek|v|2
exploitation|sömürü|n|2
expose|maruz bırakmak|v|2
exposure|maruz kalma|n|2
external|dış|a|2
extinct|nesli tükenmiş|a|2
extinction|nesil tükenmesi|n|2
extract|çıkarmak|v|2
fabricate|uydurmak|v|2
facilitate|kolaylaştırmak|v|2
facility|tesis|n|2
famine|kıtlık|n|2
fascinating|büyüleyici|a|2
fatal|ölümcül|a|2
fatigue|yorgunluk|n|2
feasibility|uygulanabilirlik|n|2
feasible|uygulanabilir|a|2
federal|federal|a|2
fertile|verimli, doğurgan|a|2
fertility|doğurganlık|n|2
fiction|kurgu|n|2
finite|sonlu|a|2
flexible|esnek|a|2
fluctuation|dalgalanma|n|2
fluent|akıcı|a|2
forbid|yasaklamak|v|2
formulate|formüle etmek|v|2
fossil|fosil|n|2
foundation|temel, vakıf|n|2
fraction|kesir, küçük parça|n|2
fragile|kırılgan|a|2
fragment|parça|n|2
framework|çerçeve|n|2
fraud|dolandırıcılık|n|2
frequency|sıklık|n|2
friction|sürtünme|n|2
frustrate|hüsrana uğratmak|v|2
fulfil|yerine getirmek|v|2
fundamentally|temelde|d|2
furthermore|ayrıca|c|2
galaxy|galaksi|n|2
gap|boşluk, açık|n|2
gender|toplumsal cinsiyet|n|2
gene|gen|n|2
generate|üretmek|v|2
genetic|genetik|a|2
genuine|samimi, gerçek|a|2
geography|coğrafya|n|2
geology|jeoloji|n|2
gesture|jest|n|2
give in|pes etmek, boyun eğmek|p|2
glacier|buzul|n|2
go through|yaşamak, gözden geçirmek|p|2
govern|yönetmek|v|2
grant|vermek, bahşetmek|v|2
grateful|minnettar|a|2
gravity|yerçekimi|n|2
greenhouse|sera|n|2
guarantee|garanti etmek|v|2
guilty|suçlu|a|2
habitat|yaşam alanı|n|2
habitual|alışılmış|a|2
hardship|zorluk|n|2
harmful|zararlı|a|2
harsh|sert|a|2
harvest|hasat|n|2
hazard|tehlike|n|2
hazardous|tehlikeli|a|2
hence|bu nedenle|c|2
heredity|kalıtım|n|2
heritage|miras|n|2
hesitate|tereddüt etmek|v|2
hierarchy|hiyerarşi|n|2
highlight|vurgulamak|v|2
hinder|engellemek|v|2
hold back|engellemek, tutmak|p|2
hormone|hormon|n|2
hostage|rehine|n|2
hostile|düşmanca|a|2
humanity|insanlık|n|2
humble|alçakgönüllü|a|2
humidity|nem|n|2
hygiene|hijyen|n|2
hypothesise|hipotez kurmak|v|2
identify|belirlemek|v|2
ideology|ideoloji|n|2
illusion|yanılsama|n|2
imitate|taklit etmek|v|2
immense|muazzam|a|2
immigrant|göçmen|n|2
immigration|göç|n|2
immune|bağışık|a|2
immunity|bağışıklık|n|2
impartial|tarafsız|a|2
implement|uygulamak|v|2
implementation|uygulama|n|2
implication|sonuç, ima|n|2
imply|ima etmek|v|2
impose|dayatmak|v|2
impress|etkilemek|v|2
impulse|dürtü|n|2
in case|-e karşı, olur da diye|c|2
in contrast to|-in aksine|c|2
in favour of|lehine|c|2
in terms of|açısından|c|2
inability|yetersizlik|n|2
incentive|teşvik|n|2
incident|olay|n|2
incline|eğilim göstermek|v|2
inclusion|dahil etme|n|2
incorporate|dahil etmek|v|2
indicate|göstermek, işaret etmek|v|2
indifferent|kayıtsız|a|2
individual|birey|n|2
induce|teşvik etmek, neden olmak|v|2
inequality|eşitsizlik|n|2
infancy|bebeklik|n|2
infection|enfeksiyon|n|2
infer|sonuç çıkarmak|v|2
inferior|aşağı, düşük|a|2
infinite|sonsuz|a|2
inflammation|iltihap|n|2
inflation|enflasyon|n|2
infrastructure|altyapı|n|2
ingredient|malzeme, bileşen|n|2
inhabit|yaşamak, ikamet etmek|v|2
inhabitant|sakin|n|2
inherit|miras almak|v|2
inheritance|miras|n|2
initial|ilk|a|2
initiate|başlatmak|v|2
initiative|girişim|n|2
injection|iğne, enjeksiyon|n|2
injure|yaralamak|v|2
innocent|masum|a|2
innovation|yenilik|n|2
input|girdi|n|2
inquiry|soruşturma|n|2
insight|kavrayış, iç görü|n|2
insist|ısrar etmek|v|2
insomnia|uykusuzluk|n|2
inspect|denetlemek|v|2
inspire|ilham vermek|v|2
install|kurmak|v|2
installation|kurulum|n|2
instance|örnek|n|2
instinct|içgüdü|n|2
institution|kurum|n|2
insufficient|yetersiz|a|2
insult|hakaret etmek|v|2
intact|bozulmamış|a|2
integrate|bütünleştirmek|v|2
integration|bütünleşme|n|2
integrity|dürüstlük, bütünlük|n|2
intellectual|entelektüel|a|2
intelligence|zekâ|n|2
intensity|yoğunluk|n|2
intensive|yoğun|a|2
intention|niyet|n|2
interact|etkileşmek|v|2
interaction|etkileşim|n|2
interfere|müdahale etmek|v|2
interference|müdahale|n|2
interpretation|yorum|n|2
interval|aralık|n|2
intervene|araya girmek|v|2
intervention|müdahale|n|2
intimate|samimi|a|2
intuition|sezgi|n|2
invade|istila etmek|v|2
invaluable|paha biçilmez|a|2
invasion|istila|n|2
investment|yatırım|n|2
irrigate|sulamak|v|2
irrigation|sulama|n|2
isolate|yalıtmak|v|2
isolation|yalnızlık, yalıtım|n|2
journal|dergi|n|2
justification|gerekçe|n|2
justify|haklı çıkarmak|v|2
keep up with|ayak uydurmak|p|2
labour|emek|n|2
landscape|manzara|n|2
latitude|enlem|n|2
launch|başlatmak|v|2
lay off|işten çıkarmak|p|2
legacy|miras|n|2
legal|yasal|a|2
legislation|mevzuat|n|2
legislative|yasama|a|2
legitimate|meşru|a|2
liberal|özgürlükçü|a|2
lifespan|yaşam süresi|n|2
likelihood|olasılık|n|2
likewise|aynı şekilde|c|2
linguistic|dilbilimsel|a|2
literacy|okuryazarlık|n|2
literal|kelimesi kelimesine|a|2
livestock|çiftlik hayvanları|n|2
logical|mantıklı|a|2
longevity|uzun ömür|n|2
longitude|boylam|n|2
look down on|küçümsemek|p|2
look into|araştırmak|p|2
look up to|saygı duymak|p|2
loyal|sadık|a|2
luxury|lüks|n|2
magnificent|görkemli|a|2
make up|oluşturmak, uydurmak|p|2
make up for|telafi etmek|p|2
malnutrition|yetersiz beslenme|n|2
mammal|memeli|n|2
mandatory|zorunlu|a|2
manipulate|manipüle etmek|v|2
mankind|insanlık|n|2
manufacture|imal etmek|v|2
manuscript|el yazması|n|2
margin|kenar boşluğu|n|2
marine|deniz|a|2
massive|çok büyük|a|2
mature|olgun|a|2
maximise|en üst düzeye çıkarmak|v|2
measurement|ölçüm|n|2
mechanical|mekanik|a|2
mechanism|mekanizma|n|2
mediate|arabuluculuk yapmak|v|2
medieval|ortaçağa ait|a|2
merely|sadece|c|2
metabolism|metabolizma|n|2
microscope|mikroskop|n|2
migrate|göç etmek|v|2
migration|göç|n|2
military|askeri|a|2
minimise|en aza indirmek|v|2
minimum|asgari|a|2
minority|azınlık|n|2
misleading|yanıltıcı|a|2
misunderstanding|yanlış anlama|n|2
mobile|hareketli|a|2
moderate|ılımlı|a|2
modest|mütevazı|a|2
moisture|nem|n|2
molecule|molekül|n|2
monitor|izlemek|v|2
moral|ahlaki|a|2
mortality|ölüm oranı|n|2
motivate|motive etmek|v|2
motivation|motivasyon|n|2
mutation|mutasyon|n|2
mutual|karşılıklı|a|2
myth|efsane|n|2
namely|yani, şöyle ki|c|2
narrative|anlatı|n|2
narrow|dar|a|2
nationality|uyruk|n|2
navigation|seyrüsefer|n|2
necessity|gereklilik|n|2
neglect|ihmal etmek|v|2
negotiate|müzakere etmek|v|2
negotiation|müzakere|n|2
nervous system|sinir sistemi|n|2
neuron|nöron|n|2
neutral|tarafsız|a|2
nomadic|göçebe|a|2
nonetheless|yine de|c|2
norm|norm|n|2
notably|özellikle|c|2
notion|kavram, fikir|n|2
nourish|beslemek|v|2
now that|madem ki, artık|c|2
nuclear|nükleer|a|2
nutrient|besin maddesi|n|2
nutrition|beslenme|n|2
obesity|obezite|n|2
objective|nesnel|a|2
obligation|yükümlülük|n|2
observation|gözlem|n|2
occupation|meslek|n|2
occupy|işgal etmek|v|2
occurrence|olay, meydana gelme|n|2
odd|tuhaf|a|2
offspring|yavru, döl|n|2
on account of|nedeniyle|c|2
on behalf of|adına|c|2
on the contrary|aksine|c|2
once|-ir -mez, bir kez|c|2
ongoing|süregelen|a|2
oppose|karşı çıkmak|v|2
optimism|iyimserlik|n|2
optimistic|iyimser|a|2
optional|isteğe bağlı|a|2
orbit|yörünge|n|2
organic|organik|a|2
organism|organizma|n|2
orientation|yönelim|n|2
outbreak|salgın, patlak verme|n|2
output|çıktı|n|2
outstanding|üstün, olağanüstü|a|2
overall|genel olarak|d|2
overlook|gözden kaçırmak|v|2
overseas|yurt dışı|a|2
overweight|kilolu|a|2
overwhelming|ezici|a|2
owing to|yüzünden|c|2
ownership|sahiplik|n|2
panic|panik|n|2
parallel|paralel|a|2
parasite|parazit|n|2
partial|kısmi|a|2
participant|katılımcı|n|2
participation|katılım|n|2
pass away|vefat etmek|p|2
passive|edilgen|a|2
peculiar|tuhaf, kendine özgü|a|2
penalty|ceza|n|2
pension|emekli maaşı|n|2
perceive|algılamak|v|2
perception|algı|n|2
persist|sürmek, devam etmek|v|2
persistence|ısrar, süreklilik|n|2
perspective|bakış açısı|n|2
pesticide|tarım ilacı|n|2
phenomenon|olgu|n|2
philosophy|felsefe|n|2
photosynthesis|fotosentez|n|2
physician|hekim|n|2
pioneer|öncü|n|2
plague|veba|n|2
pollutant|kirletici|n|2
portion|porsiyon, pay|n|2
pose|oluşturmak, sormak|v|2
possess|sahip olmak|v|2
potential|potansiyel|a|2
practical|pratik|a|2
precaution|önlem|n|2
precede|önce gelmek|v|2
precipitation|yağış|n|2
precise|kesin, tam|a|2
precision|kesinlik|n|2
predator|yırtıcı hayvan|n|2
predecessor|selef|n|2
prediction|tahmin|n|2
preference|tercih|n|2
pregnancy|hamilelik|n|2
prejudice|önyargı|n|2
preliminary|ön, hazırlık|a|2
premature|erken|a|2
prescribe|reçete yazmak|v|2
preservation|koruma|n|2
presume|varsaymak|v|2
pretend|rol yapmak|v|2
prevalent|yaygın|a|2
prevention|önleme|n|2
prey|av|n|2
primarily|öncelikle|d|2
prior to|-den önce|c|2
priority|öncelik|n|2
privacy|mahremiyet|n|2
privilege|ayrıcalık|n|2
probability|olasılık|n|2
procedure|prosedür|n|2
proceed|ilerlemek|v|2
productivity|verimlilik|n|2
profound|derin|a|2
prohibit|yasaklamak|v|2
prohibition|yasak|n|2
prominent|önde gelen|a|2
promote|teşvik etmek|v|2
prompt|tetiklemek|v|2
proportion|oran|n|2
prospect|olasılık, beklenti|n|2
prosperity|refah|n|2
prosperous|müreffeh|a|2
protest|protesto etmek|v|2
provided that|şartıyla|c|2
province|il|n|2
provoke|kışkırtmak|v|2
psychology|psikoloji|n|2
publication|yayın|n|2
punish|cezalandırmak|v|2
pursue|peşinden gitmek|v|2
put forward|ileri sürmek|p|2
put up with|katlanmak|p|2
qualification|nitelik|n|2
qualify|hak kazanmak|v|2
questionnaire|anket formu|n|2
radiation|radyasyon|n|2
radical|köklü|a|2
rainfall|yağış|n|2
random|rastgele|a|2
rational|akılcı|a|2
recession|durgunluk|n|2
recipient|alıcı|n|2
reconcile|uzlaştırmak|v|2
recovery|iyileşme|n|2
recruit|işe almak|v|2
recycle|geri dönüştürmek|v|2
refer|atıfta bulunmak|v|2
reflect|yansıtmak|v|2
reform|reform|n|2
refugee|mülteci|n|2
regardless of|-e bakılmaksızın|c|2
regulate|düzenlemek|v|2
regulation|düzenleme|n|2
rehabilitation|rehabilitasyon|n|2
reinforce|güçlendirmek|v|2
reject|reddetmek|v|2
relevant|ilgili|a|2
reliability|güvenilirlik|n|2
relieve|rahatlatmak|v|2
reluctance|isteksizlik|n|2
reluctant|isteksiz|a|2
rely|güvenmek, dayanmak|v|2
remedy|çare|n|2
remote|uzak|a|2
renewable|yenilenebilir|a|2
reproduce|üremek, çoğaltmak|v|2
reproduction|üreme|n|2
reptile|sürüngen|n|2
reputation|ün, itibar|n|2
resemble|benzemek|v|2
reside|ikamet etmek|v|2
resign|istifa etmek|v|2
resist|direnmek|v|2
resistance|direnç|n|2
resolve|çözmek|v|2
respiratory|solunum|a|2
restore|eski haline getirmek|v|2
restrict|kısıtlamak|v|2
result from|-den kaynaklanmak|p|2
retain|elinde tutmak|v|2
retention|tutma, koruma|n|2
retire|emekli olmak|v|2
revenue|gelir|n|2
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
satellite|uydu|n|2
scarce|kıt|a|2
scarcity|kıtlık|n|2
scholar|akademisyen|n|2
scholarship|burs|n|2
scope|kapsam|n|2
secondary|ikincil|a|2
secure|güvence altına almak|v|2
sediment|tortu|n|2
seek|aramak|v|2
segment|bölüm|n|2
self-esteem|özsaygı|n|2
sensible|mantıklı|a|2
sensitive|hassas|a|2
sequence|sıra, dizi|n|2
set out|yola çıkmak, ortaya koymak|p|2
settle|yerleşmek|v|2
settlement|yerleşim|n|2
severity|şiddet|n|2
shelter|barınak|n|2
shift|değişim, kayma|n|2
shrink|küçülmek|v|2
sibling|kardeş|n|2
signify|anlamına gelmek|v|2
simulation|benzetim|n|2
simultaneously|aynı anda|d|2
sincere|içten|a|2
skeleton|iskelet|n|2
skeptical|şüpheci|a|2
slavery|kölelik|n|2
so as to|-mek için|c|2
socialise|sosyalleşmek|v|2
soil|toprak|n|2
solar|güneş|a|2
solid|katı|a|2
sophisticated|karmaşık, gelişmiş|a|2
sovereign|egemen|a|2
specify|belirtmek|v|2
specimen|numune|n|2
spectacular|muhteşem|a|2
spectrum|yelpaze, tayf|n|2
speculate|tahmin yürütmek|v|2
sphere|alan, küre|n|2
stability|istikrar|n|2
stake|pay|n|2
stand for|temsil etmek, simgelemek|p|2
stand out|göze çarpmak|p|2
statistic|istatistik|n|2
status|statü|n|2
steady|istikrarlı, sabit|a|2
stimulate|uyarmak, teşvik etmek|v|2
stimulus|uyaran|n|2
storage|depolama|n|2
strategy|strateji|n|2
strive|çabalamak|v|2
subsequent|sonraki|a|2
subsequently|daha sonra|c|2
subsidy|sübvansiyon|n|2
substance|madde|n|2
substantial|önemli, büyük|a|2
substitute|yerine koymak|v|2
suburb|banliyö|n|2
suburban|banliyöye ait|a|2
summarise|özetlemek|v|2
superior|üstün|a|2
supplement|takviye etmek|v|2
suppress|bastırmak|v|2
surgery|ameliyat|n|2
surplus|fazla|n|2
surveillance|gözetim|n|2
survival|hayatta kalma|n|2
susceptible|duyarlı, yatkın|a|2
suspend|askıya almak|v|2
suspicious|şüpheli|a|2
sustain|sürdürmek|v|2
sustainability|sürdürülebilirlik|n|2
sympathy|sempati, anlayış|n|2
symptom|belirti|n|2
synthetic|sentetik|a|2
tackle|ele almak|v|2
take after|benzemek|p|2
take into account|hesaba katmak|p|2
take over|devralmak|p|2
take up|başlamak, kaplamak|p|2
telescope|teleskop|n|2
tendency|eğilim|n|2
tension|gerginlik|n|2
terminate|sona erdirmek|v|2
territory|bölge, toprak|n|2
textile|tekstil|n|2
theme|tema|n|2
therapy|terapi|n|2
thereby|böylece|c|2
thorough|ayrıntılı, titiz|a|2
thrive|gelişmek|v|2
tissue|doku|n|2
tolerate|tahammül etmek|v|2
tough|zorlu|a|2
toxic|zehirli|a|2
trace|iz|n|2
transform|dönüştürmek|v|2
transition|geçiş|n|2
transmission|iletim|n|2
transmit|iletmek|v|2
transparent|şeffaf|a|2
treatment|tedavi|n|2
trend|eğilim|n|2
tribe|kabile|n|2
trigger|tetiklemek|v|2
triumph|zafer|n|2
tuition|öğrenim ücreti|n|2
tumour|tümör|n|2
turn out|ortaya çıkmak, anlaşılmak|p|2
ultimate|nihai|a|2
uncover|ortaya çıkarmak|v|2
undergo|geçirmek, maruz kalmak|v|2
undergraduate|lisans öğrencisi|n|2
underlying|altta yatan|a|2
unemployed|işsiz|a|2
unify|birleştirmek|v|2
universal|evrensel|a|2
unprecedented|eşi görülmemiş|a|2
urban|kentsel|a|2
urbanisation|kentleşme|n|2
urge|teşvik etmek, ısrar etmek|v|2
vaccination|aşılama|n|2
vaccine|aşı|n|2
vague|belirsiz|a|2
valid|geçerli|a|2
validity|geçerlilik|n|2
variable|değişken|n|2
vary|değişmek|v|2
vegetation|bitki örtüsü|n|2
velocity|hız|n|2
verbal|sözlü|a|2
verify|doğrulamak|v|2
version|sürüm|n|2
vessel|gemi, damar|n|2
via|yoluyla|c|2
vision|vizyon, görme|n|2
visual|görsel|a|2
vitamin|vitamin|n|2
vocabulary|kelime dağarcığı|n|2
volcano|yanardağ|n|2
volume|hacim|n|2
voluntary|gönüllü|a|2
vulnerable|savunmasız|a|2
wear out|yıpranmak, yormak|p|2
welfare|refah|n|2
whereas|oysa|c|2
wildlife|yaban hayatı|n|2
wipe out|yok etmek|p|2
with regard to|ile ilgili olarak|c|2
with the exception of|haricinde|c|2
withdraw|geri çekmek|v|2
witness|tanık|n|2
workforce|iş gücü|n|2
worship|ibadet etmek|v|2
abate|dinmek, azalmak|v|3
aberration|sapma|n|3
abhor|nefret etmek|v|3
abide|uymak|v|3
abrasion|aşınma|n|3
abrupt|ani, sert|a|3
abstain|uzak durmak|v|3
abstinence|perhiz, uzak durma|n|3
abstract|soyut|a|3
accentuate|vurgulamak, belirginleştirmek|v|3
accession|katılım, göreve geliş|n|3
acclaim|övgü|n|3
accrue|birikmek|v|3
acquiesce|razı olmak|v|3
acquit|beraat ettirmek|v|3
acrimonious|sert, kırıcı|a|3
acumen|keskin zekâ|n|3
adamant|kararlı, inatçı|a|3
adept|usta|a|3
adhere|bağlı kalmak|v|3
adhere to|bağlı kalmak|p|3
adjacent|bitişik|a|3
adjourn|ertelemek (toplantı)|v|3
admittedly|kabul etmek gerekir ki|c|3
admonish|uyarmak, azarlamak|v|3
adulthood|yetişkinlik|n|3
adversary|düşman, hasım|n|3
adversity|sıkıntı, zorluk|n|3
affinity|yakınlık, benzerlik|n|3
affluent|varlıklı|a|3
aggravate|kötüleştirmek|v|3
aggravation|kötüleşme|n|3
aggregate|toplam|n|3
agrarian|tarımsal|a|3
albeit|-se de, gerçi|c|3
alienate|yabancılaştırmak|v|3
allegation|iddia|n|3
alleviation|hafifletme|n|3
allot|ayırmak, pay etmek|v|3
allow for|hesaba katmak|p|3
allude|ima etmek|v|3
alteration|değişiklik|n|3
altruism|özgecilik|n|3
amass|yığmak, biriktirmek|v|3
ambivalent|kararsız, ikircikli|a|3
ameliorate|iyileştirmek|v|3
amenable|uysal, yatkın|a|3
amenity|olanak, konfor|n|3
amiable|cana yakın|a|3
amount to|anlamına gelmek, varmak|p|3
ample|bol, geniş|a|3
amplify|güçlendirmek, yükseltmek|v|3
analogous|benzer|a|3
annex|ilhak etmek|v|3
annihilate|yok etmek|v|3
anomaly|anormallik|n|3
antagonise|düşman etmek|v|3
antecedent|öncül|n|3
antidote|panzehir|n|3
antiquated|modası geçmiş|a|3
antithesis|karşıt|n|3
apathy|ilgisizlik|n|3
appease|yatıştırmak|v|3
apprehensive|kaygılı|a|3
apprentice|çırak|n|3
arbitrary|keyfi|a|3
arbitrate|hakemlik yapmak|v|3
archaic|eskimiş, arkaik|a|3
ardent|ateşli, gayretli|a|3
arduous|meşakkatli|a|3
aridity|kuraklık|n|3
arousal|uyarılma|n|3
articulate|açıkça ifade etmek|v|3
ascend|yükselmek|v|3
ascertain|tespit etmek|v|3
ascribe|atfetmek|v|3
aspersion|iftira|n|3
aspire|arzulamak|v|3
assiduous|gayretli|a|3
assimilate|özümsemek|v|3
astute|kurnaz, zeki|a|3
asymmetry|asimetri|n|3
atrophy|körelme|n|3
attenuate|zayıflatmak|v|3
attest|tanıklık etmek|v|3
attribute to|-e bağlamak, atfetmek|p|3
attrition|yıpranma, azalma|n|3
audacious|cüretkâr|a|3
augment|artırmak|v|3
auspicious|uğurlu|a|3
austerity|kemer sıkma|n|3
autonomous|özerk|a|3
avert|önlemek, savuşturmak|v|3
avid|hevesli|a|3
banish|sürgün etmek|v|3
bear out|doğrulamak|p|3
belie|yalanlamak, gizlemek|v|3
bellicose|kavgacı|a|3
benevolent|iyiliksever|a|3
benign|zararsız, iyi huylu|a|3
bequeath|miras bırakmak|v|3
bewilder|şaşkına çevirmek|v|3
blatant|bariz|a|3
bleak|kasvetli|a|3
bolster|desteklemek|v|3
bountiful|bol, cömert|a|3
breach|ihlal|n|3
brittle|kırılgan, gevrek|a|3
bureaucratic|bürokratik|a|3
burgeon|hızla gelişmek|v|3
buttress|desteklemek|v|3
cajole|kandırmak, dil dökmek|v|3
calamity|felaket|n|3
callous|duygusuz|a|3
camaraderie|dostluk|n|3
candid|açık sözlü|a|3
capitulate|teslim olmak|v|3
capricious|kaprisli|a|3
cardinal|temel, asıl|a|3
cartography|haritacılık|n|3
castigate|şiddetle eleştirmek|v|3
catalyst|katalizör|n|3
caveat|uyarı, çekince|n|3
censure|kınamak|v|3
cessation|durma, kesilme|n|3
chronological|kronolojik|a|3
circumspect|ihtiyatlı|a|3
circumvent|atlatmak|v|3
clandestine|gizli|a|3
coalesce|birleşmek|v|3
coerce|zorlamak|v|3
cogent|ikna edici|a|3
cogitate|derin düşünmek|v|3
cognisant|farkında|a|3
coherently|tutarlı biçimde|d|3
cohesive|bütünleşik|a|3
coincide|aynı zamana denk gelmek|v|3
collateral|ikincil, teminat|a|3
colloquial|konuşma diline ait|a|3
commend|övmek|v|3
commensurate|orantılı|a|3
compel|zorlamak|v|3
compelling|ikna edici|a|3
compendium|özet, derleme|n|3
complacent|kayıtsız, rehavet içinde|a|3
comply|uymak|v|3
comply with|uymak|p|3
compulsion|zorlama, dürtü|n|3
concede|kabullenmek|v|3
concomitant|eşlik eden|a|3
concur|hemfikir olmak|v|3
condone|göz yummak|v|3
conducive|elverişli|a|3
confer|vermek, görüşmek|v|3
confiscate|el koymak|v|3
conflagration|büyük yangın|n|3
congenial|uyumlu, hoş|a|3
congregate|toplanmak|v|3
conjecture|tahmin, varsayım|n|3
connotation|çağrışım|n|3
conscientious|vicdanlı, özenli|a|3
consensus|uzlaşı|n|3
consign|teslim etmek|v|3
consolidate|pekiştirmek|v|3
conspicuous|göze çarpan|a|3
constituent|bileşen|n|3
construe|yorumlamak|v|3
contaminant|kirletici|n|3
contemplative|düşünceli|a|3
contemptuous|küçümseyici|a|3
contentious|tartışmalı|a|3
contiguous|bitişik|a|3
contingent|bağlı, koşullu|a|3
contravene|çiğnemek, aykırı olmak|v|3
conundrum|bilmece, çıkmaz|n|3
converge|bir araya gelmek|v|3
conversely|tersine|c|3
convoluted|karmaşık|a|3
copious|bol|a|3
corollary|doğal sonuç|n|3
corroborate|doğrulamak|v|3
covert|gizli|a|3
credence|inanç, itibar|n|3
credulous|saf, her şeye inanan|a|3
crucible|zorlu sınav|n|3
culminate|sonuçlanmak|v|3
culpable|kusurlu, suçlu|a|3
curb|dizginlemek|v|3
cursory|üstünkörü|a|3
curtail|kısmak|v|3
daunting|göz korkutan|a|3
dearth|kıtlık, yokluk|n|3
debacle|fiyasko|n|3
debilitate|güçten düşürmek|v|3
decimate|kırıp geçirmek|v|3
decipher|şifresini çözmek|v|3
decree|kararname|n|3
deduce|sonuç çıkarmak|v|3
defer|ertelemek|v|3
deference|saygı|n|3
defiance|meydan okuma|n|3
deficient|eksik, yetersiz|a|3
degrade|bozmak, aşağılamak|v|3
deleterious|zararlı|a|3
deliberation|müzakere|n|3
delineate|tasvir etmek, çizmek|v|3
delusion|yanılgı|n|3
demeanour|tavır|n|3
demise|ölüm, son|n|3
demystify|aydınlatmak|v|3
denote|belirtmek|v|3
denounce|kınamak|v|3
deplete|tüketmek|v|3
deplore|üzüntü duymak, kınamak|v|3
deploy|konuşlandırmak|v|3
deprecate|kınamak, değersizleştirmek|v|3
deride|alay etmek|v|3
derivative|türev|n|3
desiccate|kurutmak|v|3
desolate|ıssız|a|3
destitute|yoksul|a|3
deter|caydırmak|v|3
deterrent|caydırıcı|n|3
detrimental|zararlı|a|3
deviate|sapmak|v|3
devoid|yoksun|a|3
dexterity|beceri, el çabukluğu|n|3
dichotomy|ikilik|n|3
didactic|öğretici|a|3
diffuse|yaymak|v|3
digress|konudan sapmak|v|3
diligent|çalışkan|a|3
dilute|seyreltmek|v|3
discard|atmak, çıkarmak|v|3
discern|ayırt etmek|v|3
discord|anlaşmazlık|n|3
discrepancy|tutarsızlık|n|3
discrete|ayrı, farklı|a|3
discretion|takdir yetkisi|n|3
disdain|küçümseme|n|3
disgruntled|hoşnutsuz|a|3
disingenuous|samimiyetsiz|a|3
dismantle|sökmek|v|3
disparage|küçümsemek|v|3
disparity|eşitsizlik|n|3
dispel|dağıtmak, gidermek|v|3
dispensable|vazgeçilebilir|a|3
disperse|dağılmak|v|3
disseminate|yaymak|v|3
dissent|muhalefet|n|3
dissipate|dağılmak|v|3
distil|damıtmak|v|3
distraught|perişan|a|3
divergent|farklı, ayrışan|a|3
divulge|açığa vurmak|v|3
do away with|ortadan kaldırmak|p|3
docile|uysal|a|3
dogmatic|dogmatik|a|3
dormant|uykuda, etkisiz|a|3
draw on|yararlanmak|p|3
dubious|şüpheli|a|3
duplicate|kopyalamak|v|3
duress|baskı, zorlama|n|3
dwell on|üzerinde durmak|p|3
dwindle|azalmak, erimek|v|3
ebb|çekilmek, azalmak|v|3
eclectic|seçmeci|a|3
efficacious|etkili|a|3
efficacy|etkinlik|n|3
egalitarian|eşitlikçi|a|3
elated|çok mutlu|a|3
elicit|ortaya çıkarmak|v|3
elucidate|açıklığa kavuşturmak|v|3
elusive|anlaşılması zor|a|3
emanate|yayılmak, çıkmak|v|3
emancipate|özgürleştirmek|v|3
embark|başlamak, girişmek|v|3
embellish|süslemek|v|3
embody|somutlaştırmak|v|3
eminent|seçkin, ünlü|a|3
eminently|son derece|d|3
empathetic|empatik|a|3
emulate|örnek almak|v|3
encompass|kapsamak|v|3
encroach|tecavüz etmek, sınırı aşmak|v|3
endemic|yerel, endemik|a|3
endorse|desteklemek, onaylamak|v|3
endow|bağışlamak, donatmak|v|3
engender|yol açmak|v|3
enigma|muamma|n|3
enmity|düşmanlık|n|3
ensue|ardından gelmek|v|3
entail|gerektirmek|v|3
entrench|kökleştirmek|v|3
enumerate|sıralamak|v|3
envisage|öngörmek|v|3
ephemeral|geçici|a|3
epitome|simge, özet|n|3
equanimity|soğukkanlılık|n|3
equilibrium|denge|n|3
equitable|hakkaniyetli|a|3
eradicate|kökünü kazımak|v|3
eradication|yok etme|n|3
erratic|düzensiz|a|3
erroneous|hatalı|a|3
erudite|bilgili|a|3
escalate|tırmanmak|v|3
eschew|kaçınmak|v|3
esoteric|anlaşılması güç|a|3
espouse|benimsemek|v|3
estrange|soğutmak, uzaklaştırmak|v|3
euphoria|coşku|n|3
evade|kaçmak, sakınmak|v|3
evanescent|uçup giden|a|3
exacerbate|şiddetlendirmek|v|3
exasperate|çileden çıkarmak|v|3
excerpt|alıntı|n|3
exemplify|örneklemek|v|3
exempt|muaf|a|3
exert|uygulamak, sarf etmek|v|3
exhaustive|ayrıntılı, kapsamlı|a|3
exodus|toplu göç|n|3
exonerate|aklamak|v|3
exorbitant|fahiş|a|3
expatriate|yurt dışında yaşayan|n|3
expedient|uygun, işe yarar|a|3
expedite|hızlandırmak|v|3
explicate|açıklamak|v|3
explicitly|açıkça|d|3
extant|hâlâ var olan|a|3
extol|övmek|v|3
extrapolate|tahmin etmek, genellemek|v|3
extravagant|savurgan|a|3
exuberant|coşkun|a|3
facet|yön, cephe|n|3
facetious|şakacı|a|3
fallacy|yanılgı, safsata|n|3
falter|bocalamak|v|3
fastidious|titiz|a|3
fathom|anlamak, kavramak|v|3
fauna|hayvan topluluğu|n|3
feasibly|uygulanabilir biçimde|d|3
fecund|verimli|a|3
feeble|zayıf, güçsüz|a|3
ferocious|vahşi|a|3
fervent|ateşli, coşkulu|a|3
fervour|coşku|n|3
fetter|zincirlemek, kısıtlamak|v|3
fickle|dönek|a|3
fidelity|sadakat|n|3
flagrant|açık, göze batan|a|3
flaw|kusur|n|3
flora|bitki örtüsü|n|3
flourish|gelişmek, serpilmek|v|3
flourishing|gelişen|a|3
fluctuate|dalgalanmak|v|3
fluctuating|dalgalı|a|3
foment|kışkırtmak|v|3
forestall|önlemek|v|3
forfeit|kaybetmek, vazgeçmek|v|3
forgo|vazgeçmek|v|3
formidable|zorlu, ürkütücü|a|3
fortify|güçlendirmek|v|3
fortitude|metanet|n|3
fortuitous|tesadüfi|a|3
fraught|dolu, gergin|a|3
frugal|tutumlu|a|3
fruition|gerçekleşme|n|3
futile|beyhude|a|3
galvanise|harekete geçirmek|v|3
garner|toplamak, kazanmak|v|3
garrulous|geveze|a|3
genesis|başlangıç, köken|n|3
germane|ilgili|a|3
get across|anlatmak, iletmek|p|3
give rise to|yol açmak|p|3
given that|-dığı göz önüne alındığında|c|3
gratify|memnun etmek|v|3
gratuitous|gereksiz, nedensiz|a|3
gravitate|yönelmek|v|3
gregarious|sosyal, girişken|a|3
grievance|şikâyet|n|3
grievous|ağır, ciddi|a|3
grueling|yorucu|a|3
gullible|saf, kolay kandırılan|a|3
hackneyed|basmakalıp|a|3
hallmark|ayırt edici özellik|n|3
hamper|engellemek|v|3
hamstring|engellemek|v|3
hapless|talihsiz|a|3
harbinger|habercisi|n|3
haughty|kibirli|a|3
heed|dikkate almak|v|3
hegemony|hegemonya|n|3
heinous|iğrenç|a|3
hereby|bununla, işbu|c|3
heresy|sapkınlık|n|3
heterogeneous|heterojen|a|3
hiatus|ara, kesinti|n|3
hinge|bağlı olmak|v|3
holistic|bütüncül|a|3
homogeneous|homojen|a|3
hostility|düşmanlık|n|3
hypocrisy|ikiyüzlülük|n|3
hypothetical|varsayımsal|a|3
iconoclast|put kırıcı|n|3
idiosyncratic|kendine özgü|a|3
illicit|yasa dışı|a|3
immerse|daldırmak|v|3
imminent|yakın, eli kulağında|a|3
immutable|değişmez|a|3
impair|zayıflatmak|v|3
impeccable|kusursuz|a|3
impede|engellemek|v|3
impending|yaklaşan|a|3
imperative|zorunlu|a|3
imperceptible|fark edilemez|a|3
impervious|geçirmez, etkilenmez|a|3
impetuous|aceleci|a|3
impetus|itici güç|n|3
implausible|inanılmaz, akla yatmayan|a|3
implicit|örtük|a|3
impoverish|yoksullaştırmak|v|3
impoverished|yoksullaşmış|a|3
impromptu|doğaçlama|a|3
in the light of|ışığında|c|3
inadequacy|yetersizlik|n|3
inadvertently|istemeden|d|3
inasmuch as|-dığı için|c|3
incapacitate|güçsüz bırakmak|v|3
incarcerate|hapsetmek|v|3
incessant|aralıksız|a|3
incidence|görülme sıklığı|n|3
incipient|başlangıç aşamasındaki|a|3
incite|kışkırtmak|v|3
inclement|sert (hava)|a|3
incoherent|tutarsız|a|3
incongruous|uyumsuz|a|3
incremental|artımlı|a|3
incumbent|görevdeki|a|3
indelible|silinmez|a|3
indigenous|yerli|a|3
indigent|yoksul|a|3
indispensable|vazgeçilmez|a|3
indolent|tembel|a|3
indomitable|yılmaz|a|3
inducement|teşvik|n|3
induct|kabul etmek|v|3
inept|beceriksiz|a|3
inertia|atalet|n|3
inexorable|durdurulamaz|a|3
inexplicable|açıklanamaz|a|3
infamous|kötü şöhretli|a|3
infest|istila etmek (zararlı)|v|3
infiltrate|sızmak|v|3
infringe|ihlal etmek|v|3
ingenious|dâhice|a|3
ingrained|kökleşmiş|a|3
inherent|doğasında olan|a|3
inhibit|engellemek, baskılamak|v|3
inhibition|ketlenme|n|3
inimical|zararlı, düşmanca|a|3
iniquity|haksızlık|n|3
innate|doğuştan|a|3
innocuous|zararsız|a|3
innuendo|ima|n|3
insatiable|doymak bilmez|a|3
insidious|sinsi|a|3
insinuate|ima etmek|v|3
insofar as|-dığı ölçüde|c|3
insolvent|iflas etmiş|a|3
instigate|başlatmak, kışkırtmak|v|3
instigation|kışkırtma|n|3
insular|dar görüşlü|a|3
insurmountable|aşılmaz|a|3
integral|ayrılmaz, temel|a|3
interim|geçici|a|3
intermediary|aracı|n|3
intermittent|aralıklı|a|3
intimidate|yıldırmak|v|3
intractable|inatçı, çözülmesi zor|a|3
intransigent|uzlaşmaz|a|3
intrepid|korkusuz|a|3
intricate|karmaşık|a|3
intrinsic|içsel|a|3
inundate|sel gibi basmak|v|3
inundation|su baskını|n|3
invariably|her zaman|d|3
invoke|başvurmak, anmak|v|3
irate|öfkeli|a|3
irreparable|onarılamaz|a|3
irrespective of|-e bakılmaksızın|c|3
irrevocable|geri alınamaz|a|3
jeopardise|tehlikeye atmak|v|3
jubilant|sevinçli|a|3
judicious|sağduyulu|a|3
juncture|kritik an|n|3
juxtapose|yan yana koymak|v|3
kinship|akrabalık|n|3
laborious|zahmetli|a|3
lacklustre|sönük|a|3
lament|yakınmak|v|3
languish|zayıf düşmek|v|3
latent|gizli, örtük|a|3
lavish|cömert, savurgan|a|3
lax|gevşek|a|3
legible|okunaklı|a|3
lenient|hoşgörülü|a|3
lest|-mesin diye|c|3
lethargic|uyuşuk|a|3
leverage|kaldıraç, nüfuz|n|3
liability|yükümlülük|n|3
linger|oyalanmak, sürmek|v|3
live up to|beklentiyi karşılamak|p|3
lofty|yüce|a|3
loquacious|konuşkan|a|3
lucid|açık, anlaşılır|a|3
lucidity|açıklık|n|3
lucrative|kârlı|a|3
magnanimous|yüce gönüllü|a|3
magnitude|büyüklük|n|3
malady|hastalık|n|3
malevolent|kötü niyetli|a|3
malfunction|arıza|n|3
malignant|kötü huylu|a|3
malleable|şekil verilebilir|a|3
mandate|yetki, görev|n|3
manifest|göstermek, ortaya koymak|v|3
marginal|marjinal, önemsiz|a|3
maverick|aykırı kişi|n|3
meagre|yetersiz, kıt|a|3
mediocre|vasat|a|3
melancholy|hüzün|n|3
mercurial|değişken|a|3
metamorphosis|başkalaşım|n|3
methodical|yöntemli|a|3
meticulous|titiz|a|3
milieu|çevre, ortam|n|3
minuscule|minicik|a|3
misconception|yanlış kanı|n|3
misnomer|yanlış ad|n|3
mitigate|hafifletmek|v|3
mitigating|hafifletici|a|3
mitigation|hafifletme|n|3
mollify|yatıştırmak|v|3
momentous|çok önemli|a|3
moratorium|erteleme, geçici yasak|n|3
morbidity|hastalık oranı|n|3
multifaceted|çok yönlü|a|3
mundane|sıradan|a|3
munificent|cömert|a|3
myriad|sayısız|a|3
nadir|en düşük nokta|n|3
nascent|yeni oluşan|a|3
nebulous|belirsiz|a|3
nefarious|kötü, alçakça|a|3
negate|geçersiz kılmak|v|3
negligent|ihmalkâr|a|3
negligible|önemsiz, ihmal edilebilir|a|3
neophyte|acemi|n|3
nominal|sembolik, itibari|a|3
nonchalant|kayıtsız|a|3
nostalgia|özlem|n|3
notorious|kötü şöhretli|a|3
notwithstanding|-e rağmen|c|3
novel|yeni, alışılmamış|a|3
noxious|zehirli|a|3
nuance|nüans|n|3
nullify|hükümsüz kılmak|v|3
nurture|beslemek, yetiştirmek|v|3
oblivious|habersiz|a|3
obscure|belirsiz, anlaşılmaz|a|3
obscurity|belirsizlik|n|3
obsolete|eskimiş|a|3
obstinate|inatçı|a|3
obstruct|engellemek, tıkamak|v|3
obviate|gereksiz kılmak|v|3
officious|işgüzar|a|3
offset|dengelemek|v|3
ominous|uğursuz|a|3
omission|ihmal, atlama|n|3
omnipresent|her yerde olan|a|3
onerous|külfetli|a|3
onset|başlangıç|n|3
opaque|opak, anlaşılmaz|a|3
oppressive|baskıcı|a|3
opulent|zengin, şatafatlı|a|3
ordeal|çile|n|3
ostensibly|görünüşte|d|3
ostentatious|gösterişçi|a|3
ostracise|dışlamak|v|3
oust|görevden uzaklaştırmak|v|3
outlandish|garip|a|3
overarching|kapsayıcı|a|3
overhaul|elden geçirmek|v|3
oversee|denetlemek|v|3
overt|açık, aleni|a|3
pacify|yatıştırmak|v|3
palliative|hafifletici|a|3
palpable|elle tutulur|a|3
panacea|her derde deva|n|3
paradigm|paradigma|n|3
paradox|çelişki|n|3
paramount|en önemli|a|3
partisan|taraftar, yandaş|n|3
pathogen|hastalık yapıcı|n|3
pathology|patoloji|n|3
paucity|azlık|n|3
pedantic|ukala|a|3
pejorative|aşağılayıcı|a|3
penchant|düşkünlük|n|3
penury|yoksulluk|n|3
perennial|kalıcı, daimi|a|3
perfunctory|baştan savma|a|3
peril|tehlike|n|3
peripheral|çevresel, ikincil|a|3
perishable|bozulabilir|a|3
permeate|nüfuz etmek|v|3
pernicious|zararlı|a|3
perpetrate|işlemek (suç)|v|3
perpetuate|sürdürmek|v|3
perplex|şaşırtmak|v|3
pertain|ilgili olmak|v|3
pertinent|ilgili|a|3
perturb|rahatsız etmek|v|3
peruse|dikkatle okumak|v|3
pervasive|her yere yayılmış|a|3
phase out|aşamalı olarak kaldırmak|p|3
philanthropy|hayırseverlik|n|3
pivotal|kilit, çok önemli|a|3
placate|yatıştırmak|v|3
plausibility|akla yatkınlık|n|3
plausible|akla yatkın|a|3
plethora|bolluk|n|3
plight|kötü durum|n|3
polarise|kutuplaştırmak|v|3
potent|güçlü, etkili|a|3
pragmatic|pragmatik|a|3
precarious|güvencesiz|a|3
precedent|emsal|n|3
precipitate|hızlandırmak, tetiklemek|v|3
preclude|önlemek|v|3
precocious|erken gelişmiş|a|3
predicament|çıkmaz|n|3
predisposition|yatkınlık|n|3
predominantly|ağırlıklı olarak|d|3
preeminent|seçkin|a|3
premise|öncül|n|3
preponderance|üstünlük, çoğunluk|n|3
prerequisite|ön koşul|n|3
prestigious|saygın|a|3
presumption|varsayım|n|3
pretext|bahane|n|3
prevail|hâkim olmak|v|3
prevalence|yaygınlık|n|3
prevaricate|kaçamak konuşmak|v|3
pristine|bozulmamış|a|3
proclaim|ilan etmek|v|3
proclivity|eğilim|n|3
procrastinate|ertelemek|v|3
prodigious|olağanüstü|a|3
proficient|usta, yetkin|a|3
profusion|bolluk|n|3
progeny|döl, soy|n|3
prohibitive|engelleyici, çok yüksek|a|3
proliferate|hızla çoğalmak|v|3
prolific|üretken|a|3
prolong|uzatmak|v|3
promulgate|yaymak, ilan etmek|v|3
prone|eğilimli|a|3
propagate|yaymak|v|3
propensity|eğilim|n|3
propitious|elverişli|a|3
proponent|savunucu|n|3
prosaic|sıradan|a|3
proscribe|yasaklamak|v|3
prosecute|kovuşturmak|v|3
protracted|uzun süren|a|3
provenance|köken|n|3
provisional|geçici|a|3
proviso|şart|n|3
proximity|yakınlık|n|3
prudence|sağduyu|n|3
prudent|ihtiyatlı|a|3
punitive|cezai|a|3
quandary|ikilem|n|3
quell|bastırmak|v|3
querulous|şikâyetçi|a|3
quintessential|tipik, özünü yansıtan|a|3
ramification|sonuç, yan etki|n|3
rampant|yaygın, kontrolsüz|a|3
rancour|kin|n|3
rapport|uyum, yakınlık|n|3
ratify|onaylamak|v|3
ravage|harap etmek|v|3
rebuke|azarlamak|v|3
rebut|çürütmek|v|3
recalcitrant|inatçı, söz dinlemez|a|3
recede|geri çekilmek|v|3
reciprocal|karşılıklı|a|3
reclaim|geri kazanmak|v|3
recourse|başvuru|n|3
rectify|düzeltmek|v|3
recuperate|iyileşmek|v|3
redundant|gereksiz|a|3
refute|çürütmek|v|3
reiterate|yinelemek|v|3
relegate|alt sıraya düşürmek|v|3
relentless|amansız|a|3
relinquish|vazgeçmek|v|3
remnant|kalıntı|n|3
remuneration|ücret|n|3
render|hâle getirmek|v|3
renounce|vazgeçmek|v|3
repercussion|yankı, sonuç|n|3
replenish|yeniden doldurmak|v|3
replicate|tekrarlamak|v|3
reprieve|erteleme|n|3
reprimand|azarlamak|v|3
repudiate|reddetmek|v|3
resilient|dayanıklı|a|3
resolute|kararlı|a|3
respite|soluklanma|n|3
restitution|tazmin|n|3
resurgence|yeniden canlanma|n|3
retaliate|misilleme yapmak|v|3
reticent|ağzı sıkı|a|3
retract|geri almak|v|3
retribution|intikam|n|3
retrospect|geçmişe bakış|n|3
revamp|yenilemek|v|3
revere|saygı duymak|v|3
rhetoric|söz sanatı, retorik|n|3
rigorous|titiz, sıkı|a|3
rudimentary|temel, ilkel|a|3
rule out|olasılık dışı bırakmak|p|3
salient|göze çarpan|a|3
salutary|yararlı|a|3
sanguine|iyimser|a|3
satiate|doyurmak|v|3
scant|az, yetersiz|a|3
scathing|sert, yıkıcı (eleştiri)|a|3
scrupulous|titiz, dürüst|a|3
scrutinise|incelemek|v|3
scrutiny|inceleme|n|3
secluded|tenha|a|3
sedentary|hareketsiz|a|3
sedition|ayaklanmaya kışkırtma|n|3
seeing that|-diğine göre|c|3
segregate|ayırmak|v|3
semblance|görünüş|n|3
serendipity|mutlu tesadüf|n|3
servile|köle ruhlu|a|3
shed light on|aydınlatmak|p|3
shrewd|kurnaz|a|3
skewed|çarpık|a|3
skirmish|çatışma|n|3
solace|teselli|n|3
solicit|talep etmek|v|3
solvent|ödeme gücü olan|a|3
sombre|kasvetli|a|3
soothe|yatıştırmak|v|3
sparse|seyrek|a|3
spearhead|öncülük etmek|v|3
spontaneous|kendiliğinden|a|3
sporadic|ara sıra olan|a|3
spurious|sahte|a|3
spurn|reddetmek|v|3
squalid|pis, sefil|a|3
squander|çarçur etmek|v|3
stagnant|durgun|a|3
stagnation|durgunluk|n|3
staunch|sadık, sağlam|a|3
steadfast|sarsılmaz|a|3
stem from|-den kaynaklanmak|p|3
stifle|bastırmak, boğmak|v|3
stipulate|şart koşmak|v|3
stratum|katman|n|3
strident|cırtlak, sert|a|3
stringent|sıkı|a|3
stymie|engellemek|v|3
subjugate|boyun eğdirmek|v|3
subordinate|ast|n|3
subside|yatışmak|v|3
subsidise|desteklemek (mali)|v|3
substantiate|kanıtlamak|v|3
substantive|esaslı|a|3
subtle|ince, belli belirsiz|a|3
subtlety|incelik|n|3
subvert|yıkmak, altüst etmek|v|3
succinct|özlü|a|3
succumb|yenik düşmek|v|3
sumptuous|görkemli|a|3
superfluous|gereksiz|a|3
supersede|yerini almak|v|3
supplant|yerini almak|v|3
supplementary|ek, tamamlayıcı|a|3
surmise|tahmin etmek|v|3
surpass|geçmek, aşmak|v|3
surreptitious|gizlice yapılan|a|3
susceptibility|duyarlılık|n|3
sustainable|sürdürülebilir|a|3
sycophant|dalkavuk|n|3
synthesise|sentezlemek|v|3
tacit|zımni|a|3
taciturn|az konuşan|a|3
tangential|dolaylı ilgili|a|3
tangible|somut|a|3
tantamount|eşdeğer|a|3
tedious|sıkıcı|a|3
temperance|ölçülülük|n|3
temperate|ılıman|a|3
temporal|zamansal|a|3
tenacious|azimli|a|3
tenet|ilke|n|3
tentative|geçici, deneme niteliğinde|a|3
tenuous|zayıf, ince|a|3
terse|kısa ve sert|a|3
thrifty|tutumlu|a|3
thwart|engellemek|v|3
tirade|uzun ve sert konuşma|n|3
torpor|uyuşukluk|n|3
tractable|uysal|a|3
tranquil|sakin|a|3
transcend|aşmak, ötesine geçmek|v|3
transgress|ihlal etmek|v|3
transient|geçici|a|3
treacherous|hain, tehlikeli|a|3
trepidation|korku, endişe|n|3
trivial|önemsiz|a|3
truce|ateşkes|n|3
truncate|kısaltmak|v|3
turbulent|çalkantılı|a|3
ubiquitous|her yerde bulunan|a|3
unanimous|oybirliğiyle|a|3
unassuming|alçakgönüllü|a|3
undermine|zayıflatmak|v|3
undertake|üstlenmek|v|3
unequivocal|kesin, açık|a|3
unprecedentedly|benzeri görülmemiş şekilde|d|3
unravel|çözmek|v|3
unwarranted|haksız, yersiz|a|3
upheaval|çalkantı|n|3
uphold|savunmak, korumak|v|3
usurp|gasp etmek|v|3
utilitarian|faydacı|a|3
vacillate|tereddüt etmek|v|3
validate|doğrulamak|v|3
vanquish|yenmek|v|3
vehement|şiddetli|a|3
venerable|saygıdeğer|a|3
veracity|doğruluk|n|3
verbose|laf kalabalığı yapan|a|3
verdict|karar, hüküm|n|3
vestige|kalıntı|n|3
vex|sinirlendirmek|v|3
viability|uygulanabilirlik|n|3
viable|uygulanabilir|a|3
vicarious|dolaylı|a|3
vigilant|tetikte|a|3
vilify|kötülemek|v|3
vindicate|haklı çıkarmak|v|3
virulent|öldürücü, şiddetli|a|3
vocation|meslek, uğraş|n|3
vociferous|gürültülü, ateşli|a|3
volatile|değişken|a|3
voracious|doymak bilmez|a|3
vulnerability|savunmasızlık|n|3
waive|vazgeçmek, feragat etmek|v|3
wane|azalmak|v|3
warrant|gerektirmek, haklı kılmak|v|3
wary|temkinli|a|3
whereby|-dığı, ki onunla|c|3
whimsical|kaprisli|a|3
wield|kullanmak (güç)|v|3
wistful|özlem dolu|a|3
withstand|dayanmak|v|3
yield|sağlamak, vermek|v|3
zealous|gayretli|a|3
zenith|doruk|n|3
''';
