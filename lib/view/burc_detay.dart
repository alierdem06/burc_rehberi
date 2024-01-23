import 'package:burc_rehberi/constant/constant.dart';
import 'package:burc_rehberi/model/burc_model.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  const BurcDetay({super.key, required this.secilenBurc});
  final Burc secilenBurc;

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  late PaletteGenerator _generator;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance
        .addPostFrameCallback((timeStamp) => appBarRenginiBul());
  }

  Color appbarRengi = Colors.pink;
  double iconSize = 25;
  double expandenHeight = 250;
  String appBarTitle = "Burcu ve Özellikleri";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColor.scafoldBackColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: iconSize,
                  color: ConstColor.whiteColor,
                )),
            centerTitle: true,
            pinned: true,
            expandedHeight: expandenHeight,
            backgroundColor: appbarRengi,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("${widget.secilenBurc.burcAdi} $appBarTitle",
                  style: ConstStyle.appBarStyle),
              centerTitle: false,
              background: Image.asset(
                widget.secilenBurc.burcBuyukResim,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(4),
                child: Text(
                  widget.secilenBurc.burcDetay,
                  style: ConstStyle.normalStyle,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void appBarRenginiBul() async {
    _generator = await PaletteGenerator.fromImageProvider(
      AssetImage(widget.secilenBurc.burcBuyukResim),
    );
    setState(() {});
    appbarRengi = _generator.dominantColor!.color;
  }
}
