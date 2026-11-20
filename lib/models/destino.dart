/// Modelo de dados de um destino oferecido pela agência.
class Destino {
  final String nome;
  final String local;
  final String imagem;
  final String descricao;
  final int avaliacoes;
  final int noites;
  final double preco;

  const Destino({
    required this.nome,
    required this.local,
    required this.imagem,
    required this.descricao,
    required this.avaliacoes,
    required this.noites,
    required this.preco,
  });

  /// Texto usado pela pesquisa rápida.
  bool corresponde(String consulta) {
    final q = consulta.trim().toLowerCase();
    if (q.isEmpty) return true;
    return nome.toLowerCase().contains(q) ||
        local.toLowerCase().contains(q) ||
        descricao.toLowerCase().contains(q);
  }

  String get precoFormatado =>
      'R\$ ${preco.toStringAsFixed(2).replaceAll('.', ',')}';
}
