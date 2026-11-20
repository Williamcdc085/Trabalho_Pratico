import 'package:flutter/material.dart';

import '../models/destino.dart';

/// Exibe a confirmação de reserva de um pacote.
Future<void> mostrarReserva(BuildContext context, Destino destino) async {
  final confirmou = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Confirmar reserva'),
      content: Text(
        'Pacote: ${destino.nome}\n'
        'Duração: ${destino.noites} noites\n'
        'Valor: ${destino.precoFormatado} por pessoa',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx, false),
          child: const Text('Cancelar'),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(ctx, true),
          child: const Text('Reservar'),
        ),
      ],
    ),
  );

  if (confirmou == true && context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Reserva de ${destino.nome} registrada!')),
    );
  }
}
