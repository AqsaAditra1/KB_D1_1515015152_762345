DOMAINS
pohonchar = pohon(char, pohonchar, pohonchar); akhir /*pohonchar disini dimaksudkan sama dengan pohon dinyatakan dgn type char dan pohonchar; akhir */

PREDICATES
nondeterm lakukan(pohonchar) 	/* lakukan dgn argumen pohonchar, terdapat Keywoard nondeterm pada  PREDICATES yang  berfungsi 
				untuk memberitahu bahwa predikat tersebut mempunyai lebih dari satu kemungkinan jawaban*/ 
kerjakan(char, pohonchar, pohonchar)% predikat kerjakan berisi argumen (char,pohonchar,dan pohonchar)
buat_pohon(pohonchar, pohonchar) %predikat buat_pohon berisi argumen (pohonchar,pohonchar) 
sisip(char, pohonchar, pohonchar) % predikat sisip berisi argumen (char,pohonchar,pohonchar)
cetak_pohon(pohonchar) % predikat cetak_pohon berisi argumen (pohonchar) 
nondeterm ulang % Kegunaan ulang adalah agar lacakbalik terjadinya tak terhingga sehingga tidak berulang-ulang 

CLAUSES
lakukan(Pohon):- %lakukan Pohon ? jika 
ulang,nl, % ulang,nextline(baris baru)
write("*******************************************************"),nl,  
write("Ketik 1 meng-update pohon\n"), % menampilkan kata-kata tersebut di layar output 
write("Ketik 2 mencetak pohon\n"), % menampilkan kata-kata tersebut di layar output 
write("Ketik 7 keluar\n"), % menampilkan kata-kata tersebut di layar output 
write("*******************************************************"),nl,  
write("Masukkan angka - "), % menampilkan kalimatnya di layar output
readchar(X),nl, % menginputkan karakter apapun untuk variabel X
kerjakan(X, Pohon, PohonBaru), % kerjakan dgn pertanyaan variabel X,Pohon,dan Pohonchar ? 
lakukan(PohonBaru). %kemudian lakukan Pohonbaru ?
kerjakan('1',Pohon,PohonBaru):- % kerjakan pilihan 1, Pohon,Pohonchar ? variabel X sudah diisi dengan angka 1  
write("Ketik karakter # untuk mengakhiri: "), % menampilkan kalimatnya di layar output
buat_pohon(Pohon, PohonBaru). % buat_pohon dengan pertanyaan Pohon,Pohonchar ?
kerjakan('2',Pohon,Pohon):- % kerjakan pilihan 2,Pohon,Pohon ? jika
cetak_pohon(Pohon), % cetak_pohon dari inputan variabel X di tampung dalam parameter Pohon tersebut
write("\nTekan sembarang tombol"), % menampilkan kalimatnya di layar output
readchar(_),nl. % menginputkan karakter apapun untuk variabel X
kerjakan('7', _, akhir):- % kerjakan pilihan 7 dan mengakhirinya jika  
exit. % keluar

buat_pohon(Pohon, PohonBaru):- % buat_pohon dengan Pohon,Pohonchar ? jika
readchar(C), % inputkan karakter apapun yang akan di tampung di variabel C
C<>'#',!, % variabel C bukan karakter # dan karakter tanda !
write(C, " "), % di tampung di variabel C
sisip(C, Pohon, PohonTemp), % sisip dgn variabel C,Pohon,PohonTemp ?
buat_pohon(PohonTemp, PohonBaru). % buat_pohon dgn PohonTemp dan PohonBaru ?
buat_pohon(Pohon, Pohon). % buat_pohon dgn Pohon dan Pohon ?
sisip(Baru,akhir,pohon(Baru,akhir,akhir)):-!. % sisip dgn parameter (Baru,akhir,pohon(Baru,akhir,akhir) jika bukan  
sisip(Baru,pohon(Elemen,Kiri,Kanan),pohon(Elemen,KiriBaru,Kanan)):- % sisip dgn parameter (Baru,pohon(Elemen,Kiri,Kanan), kemudian pohon(Elemen,KiriBaru,Kanan) jika  
Baru<Elemen,!, % Baru kurang dari elemen dan Bukan
sisip(Baru,Kiri,KiriBaru). % sisip dgn parameter (Baru,Kiri,KiriBaru)
sisip(Baru,pohon(Elemen,Kiri,Kanan),pohon(Elemen,Kiri,KananBaru)):- % sisip dgn parameter (Baru,pohon(Elemen,Kiri,Kanan), kemudian pohon(Elemen,Kiri,KananBaru) jika
sisip(Baru,Kanan,KananBaru). % sisip dgn parameter (Baru,Kanan,KananBaru)
cetak_pohon(akhir). % cetak_pohon akhir
cetak_pohon(pohon(Item,Kiri,Kanan)):- % cetak_pohon dgn (pohon(Item,Kiri,Kanan) jika
cetak_pohon(Kiri), % cetak_pohon(Kiri)
write(Item, " "), % di tulis Item
cetak_pohon(Kanan).% cetak_pohon (kanan)
ulang. % ulang
ulang:-ulang. % ulang jika ulang

GOAL
write("********** Sortir Pohon Karakter ************"),nl, % menampilkan kalimatnya di layar output,nextline(baris baru) 
lakukan(akhir). %lakukan akan memanggil dari isi parameter akhir.
% contoh kita pilih pilihan 1 lalu inputkan nama "aqsa" lalu akhiri dengan karakter #
% kemudian pilih kembali pilihan 1 dan inputkan nama "aditra" lalu pilih pilihan 2 untuk mencetak pohon
 