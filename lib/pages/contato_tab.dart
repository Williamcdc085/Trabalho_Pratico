import 'package:flutter/material.dart';

/// Aba "Contato": canais de atendimento e formulário de mensagem.
class ContatoTab extends StatefulWidget {
  const ContatoTab({super.key});

  @override
  State<ContatoTab> createState() => _ContatoTabState();
}

class _ContatoTabState extends State<ContatoTab> {
  final _formKey = GlobalKey<FormState>();
  final _nome = TextEditingController();
  final _mensagem = TextEditingController();

  @override
  void dispose() {
    _nome.dispose();
    _mensagem.dispose();
    super.dispose();
  }

  void _enviar() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Obrigado, ${_nome.text}! Retornaremos em breve.')),
      );
      _nome.clear();
      _mensagem.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const ListTile(
          leading: Icon(Icons.phone),
          title: Text('Telefone'),
          subtitle: Text('(19) 4002-8922'),
        ),
        const ListTile(
          leading: Icon(Icons.email),
          title: Text('E-mail'),
          subtitle: Text('contato@suaviagem.com.br'),
        ),
        const ListTile(
          leading: Icon(Icons.location_on),
          title: Text('Endereço'),
          subtitle: Text('Av. José de Campos Souza, 100 - Campinas/SP'),
        ),
        const Divider(height: 32),
        Text(
          'Envie uma mensagem',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nome,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Informe seu nome' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _mensagem,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Mensagem',
                  border: OutlineInputBorder(),
                ),
                validator: (v) => (v == null || v.trim().isEmpty)
                    ? 'Escreva sua mensagem'
                    : null,
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: _enviar,
                  icon: const Icon(Icons.send),
                  label: const Text('Enviar'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
