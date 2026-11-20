# Trabalho Pratico_DGT2812 

Aplicativo Flutter de uma agência de viagens.

## Funcionalidades

- **Banner de destaque**: slideshow automático (a cada 4 s) com imagens dos destinos; tocar em uma imagem abre a página do destino.
- **Barra de navegação superior**: `AppBar` + `TabBar` com Destinos, Pacotes de viagem, Contato e Sobre nós.
- **Pesquisa rápida**: filtra os destinos por nome, local ou descrição.
- **Página de destino**: imagem, título com local e avaliação em estrelas, botões CALL / ROUTE / SHARE, texto descritivo e botão de reserva (layout do roteiro, passos 5 a 9).
- **Pacotes e reservas**: lista de pacotes com valor e diálogo de confirmação de reserva.
- **Contato**: canais de atendimento e formulário com validação.

## Conceitos do roteiro aplicados

| Microatividade | Onde está no código |
|---|---|
| 2 – MaterialApp, Scaffold, AppBar, Text | `lib/main.dart` |
| 3 – Column, Row, Icon, Text | `lib/pages/destino_page.dart` (seção de botões) |
| 4 – ListView e ListTile | `lib/pages/destinos_tab.dart` |
| 5 – Stack | `lib/widgets/banner_destaque.dart` |
| Trabalho prático (passos 5–9) | `lib/pages/destino_page.dart` |

## Estrutura

```
lib/
├── main.dart                  # MaterialApp, Scaffold, AppBar e TabBar
├── data/destinos_data.dart    # dados dos destinos
├── models/destino.dart        # modelo Destino
├── pages/                     # destinos_tab, pacotes_tab, contato_tab, sobre_tab, destino_page
└── widgets/                   # banner_destaque, reserva
images/                        # imagens dos destinos (assets)
test/widget_test.dart          # teste de widget
```

## Como executar no VS Code

1. Instale o [Flutter SDK](https://docs.flutter.dev/get-started/install) e, no VS Code, as extensões **Flutter** e **Dart**.
2. Execute `flutter doctor` no terminal e resolva eventuais pendências.
3. Abra a pasta `Trabalho_Pratico` no VS Code (`File > Open Folder`).
4. Gere as pastas de plataforma que não estão no repositório (Android, iOS, web), dentro da pasta do projeto:
   ```bash
   flutter create .
   ```
   Esse comando não sobrescreve `lib/` nem `pubspec.yaml`.
5. Baixe as dependências:
   ```bash
   flutter pub get
   ```
6. Escolha um dispositivo (emulador Android, simulador iOS ou Chrome) na barra inferior do VS Code e rode com `F5` ou:
   ```bash
   flutter run
   ``` 
   ou

   ```bash
   flutter run -d chrome
   ```

7. Para validar o código:
   ```bash
   flutter analyze
   flutter test
   ```

