import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pemesanan_kamar_hotel/model/kamar_model.dart';
import 'package:pemesanan_kamar_hotel/model/pemesanan_model.dart';
import 'package:pemesanan_kamar_hotel/model/pengguna_model.dart';
import 'package:pemesanan_kamar_hotel/page/pemesanan/pemesanan_page.dart';

// @immutable
class KamarCard extends StatelessWidget {
  KamarCard({super.key, required this.kamar, required this.parallax});

  final KamarModel kamar;
  final bool parallax;
  final GlobalKey _backgroundImageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    String sewa = kamar.disewa ? 'Penuh' : 'Tersedia';
    String harga = NumberFormat.currency(locale: 'id').format(kamar.hargaSewa);
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            // Ukuran gambar kartu
            height: 180,
            width: double.infinity,
            child: parallax
                ? Flow(
                    delegate: ParallaxFlowDelegate(
                      scrollable: Scrollable.of(context),
                      listItemContext: context,
                      backgroundImageKey: _backgroundImageKey,
                    ),
                    children: [
                      Image.network(
                        kamar.fotoURL,
                        fit: BoxFit.cover,
                        key: _backgroundImageKey,
                        // scale: 0.9,
                        alignment: Alignment.center,
                        repeat: ImageRepeat.repeat,
                      ),
                    ],
                  )
                : Image.network(
                    kamar.fotoURL,
                    fit: BoxFit.cover,
                    key: _backgroundImageKey,
                    // scale: 0.9,
                    alignment: Alignment.center,
                    repeat: ImageRepeat.repeat,
                  ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Kamar tipe ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        kamar.tipeKamar,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Text(
                        ' nomor: ${kamar.nomorKamar}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  Text('Kapasitas Kamar : ${kamar.kapasitasKamar}'),
                  Chip(
                    color: MaterialStatePropertyAll(
                      sewa == 'Tersedia'
                          ? const Color.fromARGB(255, 0, 158, 182)
                          : null,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    label: Text(
                      sewa,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: sewa == 'Tersedia'
                            ? Theme.of(context).colorScheme.onPrimary
                            : Colors.black,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rp. ${harga.substring(3)}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PemesananPage(
                                pemesanan: PemesananModel.random(
                                  kamar: kamar,
                                  pemesan: PenggunaModel.random(),
                                ),
                              ),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Theme.of(context).colorScheme.primary),
                        ),
                        child: Text(
                          'Pesan',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ParallaxFlowDelegate extends FlowDelegate {
  ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
  }) : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return BoxConstraints.tightFor(
      width: constraints.maxWidth,
    );
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    // Calculate the position of this list item within the viewport.
    final scrollableBox = scrollable.context.findRenderObject() as RenderBox;
    final listItemBox = listItemContext.findRenderObject() as RenderBox;
    final listItemOffset = listItemBox.localToGlobal(
        listItemBox.size.centerLeft(Offset.zero),
        ancestor: scrollableBox);

    // Determine the percent position of this list item within the
    // scrollable area.
    final viewportDimension = scrollable.position.viewportDimension;
    final scrollFraction =
        (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);

    // Calculate the vertical alignment of the background
    // based on the scroll percent.
    final verticalAlignment = Alignment(0.0, scrollFraction * 2 - 1);

    // Convert the background alignment into a pixel offset for
    // painting purposes.
    final backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;
    final listItemSize = context.size;
    final childRect =
        verticalAlignment.inscribe(backgroundSize, Offset.zero & listItemSize);

    // Paint the background.
    context.paintChild(
      0,
      transform:
          Transform.translate(offset: Offset(0.0, childRect.top)).transform,
    );
  }

  @override
  bool shouldRepaint(ParallaxFlowDelegate oldDelegate) {
    return scrollable != oldDelegate.scrollable ||
        listItemContext != oldDelegate.listItemContext ||
        backgroundImageKey != oldDelegate.backgroundImageKey;
  }
}
