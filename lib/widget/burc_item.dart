import 'package:burc_rehberi/constant/constant.dart';
import 'package:burc_rehberi/model/burc_model.dart';
import 'package:burc_rehberi/view/burc_detay.dart';
import 'package:flutter/material.dart';

class BurcItem extends StatefulWidget {
  const BurcItem({super.key, required this.listelenenBurc});
  final Burc listelenenBurc;

  @override
  State<BurcItem> createState() => _BurcItemState();
}

class _BurcItemState extends State<BurcItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      BurcDetay(secilenBurc: widget.listelenenBurc),
                ),
              );
            },
            leading: Image.asset(
              widget.listelenenBurc.burcKucukResim,
              fit: BoxFit.fill,
            ),
            title: Text(
              widget.listelenenBurc.burcAdi,
              style: ConstStyle.normalStyle,
            ),
            subtitle: Text(
              widget.listelenenBurc.burcTarih,
              style: ConstStyle.normalStyle,
            ),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
          ),
        ),
      ),
    );
  }
}
