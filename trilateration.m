%% Üç uyduya olan uzaklığa göre konumun bulunması ; 
%% Bu kodda giriş olarak konumu, T anında sabit kabul edilmiş üç farklı uyduya olan uzaklık
%% girilecektir.Kod çıkış olarak bir N konumu verecektir.
%% Muhammet Tarık Yıldırım - Marmara Üniversitesi , 2022

%% Uyduların tanımlanması ; T = "25.11.2022 02:07:29 (EEST)" anında Avrupa üzerinden geçen GSAT0222,
%% Navstar78 ve GAL E18 uyduları seçilmiştir.
%%gsat0222 uzaklık - 23698000 m
%%navstar78 uzaklık - 20501000 m
%%gal e18 uzaklık - 18006000 m
format short; 
GSAT0222 = lla2ecef([56.8 46.3 23242000]);
NAVSTAR78 = lla2ecef([53.8 40.8 20212000]);    %% Uyduların ECEF Koordinat Sisteminde Tanımlanması 
GALE18 = lla2ecef([49.9 11.6 17713000]);
istanbul=[41.015137 28.979530 37.31];
sat1x = GSAT0222(1);
sat1y = GSAT0222(2);
sat1z = GSAT0222(3);
sat2x = NAVSTAR78(1);
sat2y = NAVSTAR78(2);                    %% Uyduların koordinatlarının değişkenlere atanması
sat2z = NAVSTAR78(3);
sat3x = GALE18(1);
sat3y = GALE18(2);
sat3z = GALE18(3);
syms x;
syms y;    
syms z;                               %% Denklemler için değişken oluşturulması

prompt = "Birinci Uyduya Olan Uzaklığı Giriniz : ";
s1 = input(prompt);

prompt = "İkinci Uyduya Olan Uzaklığı Giriniz : ";
s2 = input(prompt);

prompt = "Üçüncü Uyduya Olan Uzaklığı Giriniz :  ";
s3 = input(prompt);

denklem1 = x^2+y^2+z^2-2*sat1x*x-2*sat1y*y-2*sat1z*z-s1^2+sat1x^2+sat1y^2+sat1z^2; 
denklem2 = x^2+y^2+z^2-2*sat2x*x-2*sat2y*y-2*sat2z*z-s2^2+sat2x^2+sat2y^2+sat2z^2;  %% Denklemler
denklem3 = x^2+y^2+z^2-2*sat3x*x-2*sat3y*y-2*sat3z*z-s3^2+sat3x^2+sat3y^2+sat3z^2; 
denklemler = [denklem1 denklem2 denklem3];
konum = [x y z];
cozum = solve(denklemler,konum);
xi=abs(cozum.x);                             %% Denklemin Çözümleri 
yi=abs(cozum.y);
zi=abs(cozum.z);
gkonum=[double(xi(1)) double(yi(1)) double(zi(2))];
N = ecef2lla(gkonum);
hata = N-istanbul;    %% Aradaki koordinat hatası
