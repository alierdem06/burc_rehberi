import 'package:burc_rehberi/constant/constant.dart';
import 'package:burc_rehberi/constant/project_string.dart';
import 'package:burc_rehberi/model/burc_model.dart';
import 'package:burc_rehberi/widget/burc_item.dart';
import 'package:flutter/material.dart';

class Burclar extends StatefulWidget {
  const Burclar({super.key});

  @override
  State<Burclar> createState() => _BurclarState();
}

class _BurclarState extends State<Burclar> {
  late final List<Burc> tumBurclar;
  burclarListesi() {
    tumBurclar = veriKaynaginiHazirla();
  }

  @override
  void initState() {
    super.initState();
    burclarListesi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.scafoldBackColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ConstColor.scafoldBackColor,
        title: Text(Strings.apppName,
            style: ConstStyle.appBarStyle.copyWith(color: Colors.black)),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: tumBurclar.length,
            controller: ScrollController(),
            itemBuilder: (context, index) {
              return BurcItem(listelenenBurc: tumBurclar[index]);
            }),
      ),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> gecici = [];
    for (var i = 0; i < 12; i++) {
      var burcAdi = Strings.burcAdlari[i];
      var burcTarih = Strings.burcTarihleri[i];

      var burcDetay = Strings.burcGenelOzellikleri[i];
      var burcKucukresim =
          "assets/image/${Strings.burcAdlari[i].toLowerCase()}${i + 1}.png";
      var burcBuyukResim =
          "assets/image/${Strings.burcAdlari[i].toLowerCase()}_buyuk${i + 1}.png";
      Burc eklenecekler = Burc(
          burcAdi: burcAdi,
          burcBuyukResim: burcBuyukResim,
          burcDetay: burcDetay,
          burcKucukResim: burcKucukresim,
          burcTarih: burcTarih);
      gecici.add(eklenecekler);
    }
    return gecici;
  }
}
