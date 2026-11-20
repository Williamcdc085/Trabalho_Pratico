import 'package:flutter/material.dart';

import 'pages/contato_tab.dart';
import 'pages/destinos_tab.dart';
import 'pages/pacotes_tab.dart';
import 'pages/sobre_tab.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sua Viagem Nosso Compromisso',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 89, 204, 194)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

/// Tela principal: AppBar com barra de navegação superior (TabBar)
/// para Destinos, Pacotes de viagem, Contato e Sobre nós.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sua Viagem Nosso Compromisso'),
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            labelColor: scheme.onPrimary,
            unselectedLabelColor: scheme.onPrimary.withAlpha(180),
            indicatorColor: scheme.onPrimary,
            tabs: const [
              Tab(icon: Icon(Icons.public), text: 'Destinos'),
              Tab(icon: Icon(Icons.luggage), text: 'Pacotes de viagem'),
              Tab(icon: Icon(Icons.support_agent), text: 'Contato'),
              Tab(icon: Icon(Icons.info_outline), text: 'Sobre nós'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            DestinosTab(),
            PacotesTab(),
            ContatoTab(),
            SobreTab(),
          ],
        ),
      ),
    );
  }
}
