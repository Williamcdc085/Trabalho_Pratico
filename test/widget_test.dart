import 'package:explore_mundo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Exibe a barra de navegação e filtra destinos na pesquisa',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Explore Mundo'), findsOneWidget);
    expect(find.text('Destinos'), findsOneWidget);
    expect(find.text('Pacotes de viagem'), findsOneWidget);
    expect(find.text('Contato'), findsOneWidget);
    expect(find.text('Sobre nós'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'zzzz');
    await tester.pump();
    expect(find.text('Nenhum destino encontrado.'), findsOneWidget);
  });
}
