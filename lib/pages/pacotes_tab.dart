import 'package:flutter/material.dart';

import '../data/destinos_data.dart';
import '../widgets/reserva.dart';
import 'destino_page.dart';

/// Aba "Pacotes de viagem": lista de pacotes com botão de reserva.
class PacotesTab extends StatelessWidget {
  const PacotesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: destinos.length,
      itemBuilder: (context, i) {
        final d = destinos[i];
        return Card(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () => abrirDestino(context, d),
                child: Image.asset(
                  d.imagem,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                title: Text('${d.nome} • ${d.noites} noites'),
                subtitle: Text(d.local),
                trailing: Text(
                  d.precoFormatado,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FilledButton.icon(
                    onPressed: () => mostrarReserva(context, d),
                    icon: const Icon(Icons.flight_takeoff),
                    label: const Text('Reservar'),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
