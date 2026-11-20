import 'package:flutter/material.dart';

import '../data/destinos_data.dart';
import '../models/destino.dart';
import '../widgets/banner_destaque.dart';
import 'destino_page.dart';

/// Aba "Destinos": banner de destaque, pesquisa rápida e lista de destinos.
class DestinosTab extends StatefulWidget {
  const DestinosTab({super.key});

  @override
  State<DestinosTab> createState() => _DestinosTabState();
}

class _DestinosTabState extends State<DestinosTab> {
  final TextEditingController _busca = TextEditingController();
  String _consulta = '';

  @override
  void dispose() {
    _busca.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Destino> filtrados =
        destinos.where((d) => d.corresponde(_consulta)).toList();

    return ListView(
      children: [
        // 1. Banner de destaque.
        const BannerDestaque(destinos: destinos),

        // 3. Pesquisa rápida.
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: _busca,
            onChanged: (valor) => setState(() => _consulta = valor),
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              hintText: 'Pesquisar destinos (ex.: Paris, Japão, praia)',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _consulta.isEmpty
                  ? null
                  : IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _busca.clear();
                        setState(() => _consulta = '');
                      },
                    ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
              ),
            ),
          ),
        ),

        if (filtrados.isEmpty)
          const Padding(
            padding: EdgeInsets.all(32),
            child: Center(child: Text('Nenhum destino encontrado.')),
          ),

        // Lista de destinos (ListTile dentro de ListView).
        for (final d in filtrados)
          ListTile(
            leading: CircleAvatar(backgroundImage: AssetImage(d.imagem)),
            title: Text(d.nome),
            subtitle: Text(d.local),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, color: Colors.red[500], size: 18),
                const SizedBox(width: 4),
                Text('${d.avaliacoes}'),
                const Icon(Icons.keyboard_arrow_right),
              ],
            ),
            onTap: () => abrirDestino(context, d),
          ),
        const SizedBox(height: 16),
      ],
    );
  }
}
