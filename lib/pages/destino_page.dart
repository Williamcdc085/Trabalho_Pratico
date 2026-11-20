import 'package:flutter/material.dart';

import '../models/destino.dart';
import '../widgets/reserva.dart';

/// Abre a página de detalhes de um destino.
void abrirDestino(BuildContext context, Destino destino) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => DestinoPage(destino: destino)),
  );
}

/// Página de destino: imagem, seção de título, seção de botões e texto
/// (Passos 5 a 9 do roteiro do Trabalho Prático).
class DestinoPage extends StatelessWidget {
  final Destino destino;

  const DestinoPage({super.key, required this.destino});

  // Passo 6: método auxiliar que gera uma coluna (ícone + rótulo).
  Column _buildButtonColumn(
    BuildContext context,
    Color color,
    IconData icon,
    String label,
    String mensagem,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(icon, color: color),
          onPressed: () => ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(mensagem))),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Passo 5: Seção de Título (Expanded + Column + ícone de estrela + nota).
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    destino.nome,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  destino.local,
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red[500]),
          Text('${destino.avaliacoes}'),
        ],
      ),
    );

    // Passo 6: Seção de Botões.
    final Color color = Theme.of(context).primaryColor;
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(context, color, Icons.call, 'TELEFONE',
            'Ligando para a Explore Mundo: (19) 4002-8922'),
        _buildButtonColumn(context, color, Icons.near_me, 'ROTA',
            'Traçando rota até ${destino.local}'),
        _buildButtonColumn(context, color, Icons.share, 'COMPARTILHAR',
            'Compartilhando o destino ${destino.nome}'),
      ],
    );

    // Passo 7: Seção de Texto.
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        destino.descricao,
        softWrap: true,
      ),
    );

    // Resumo do pacote + botão de reserva.
    Widget reservaSection = Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '${destino.noites} noites • ${destino.precoFormatado} por pessoa',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: () => mostrarReserva(context, destino),
            icon: const Icon(Icons.flight_takeoff),
            label: const Text('Reservar agora'),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(destino.nome)),
      // Passo 9: ListView no lugar de Column, para permitir rolagem.
      body: ListView(
        children: [
          // Passo 8: imagem carregada do diretório de assets.
          Image.asset(
            destino.imagem,
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection,
          buttonSection,
          textSection,
          reservaSection,
        ],
      ),
    );
  }
}
