import 'package:flutter/material.dart';

/// Aba "Sobre nós".
class SobreTab extends StatelessWidget {
  const SobreTab({super.key});

  @override
  Widget build(BuildContext context) {
    final cor = Theme.of(context).colorScheme.primary;
    return ListView(
      padding: const EdgeInsets.all(32),
      children: [
        Icon(Icons.travel_explore, size: 72, color: cor),
        const SizedBox(height: 16),
        Text(
          'ABC Viagens',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 24),
        const Text(
          'A ABC Viagens é uma agência dedicada a transformar '
          'sonhos em roteiros. Selecionamos destinos no Brasil e no mundo, '
          'montamos pacotes completos com hospedagem, passeios e '
          'traslados e acompanhamos você em cada etapa da viagem.\n\n'
          'Em nosso site, você explora '
          'destinos, consulta pacotes, faz reservas e fala com a nossa '
          'equipe de onde estiver, direto do celular, computador ou tablet.',
          
          softWrap: true,
        ),
      ],
    );
  }
}
