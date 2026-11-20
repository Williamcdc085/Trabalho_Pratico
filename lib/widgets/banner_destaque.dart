import 'dart:async';

import 'package:flutter/material.dart';

import '../models/destino.dart';
import '../pages/destino_page.dart';

/// Banner de destaque: slideshow de imagens dos destinos.
/// Cada imagem é interativa e leva à página do destino ao ser tocada.
class BannerDestaque extends StatefulWidget {
  final List<Destino> destinos;

  const BannerDestaque({super.key, required this.destinos});

  @override
  State<BannerDestaque> createState() => _BannerDestaqueState();
}

class _BannerDestaqueState extends State<BannerDestaque> {
  final PageController _controller = PageController();
  Timer? _timer;
  int _atual = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!_controller.hasClients || widget.destinos.isEmpty) return;
      final proxima = (_atual + 1) % widget.destinos.length;
      _controller.animateToPage(
        proxima,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: widget.destinos.length,
            onPageChanged: (i) => setState(() => _atual = i),
            itemBuilder: (context, i) {
              final d = widget.destinos[i];
              return GestureDetector(
                onTap: () => abrirDestino(context, d),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(d.imagem, fit: BoxFit.cover),
                    // Degradê para dar leitura ao texto sobre a imagem.
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black54],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      right: 16,
                      bottom: 28,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            d.nome,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${d.local} • a partir de ${d.precoFormatado}',
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          // Indicadores de página.
          Positioned(
            left: 0,
            right: 0,
            bottom: 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.destinos.length, (i) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: i == _atual ? 18 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: i == _atual ? Colors.white : Colors.white54,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
