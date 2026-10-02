import 'package:simulador_frete/models/resultado_frete.dart';
import 'package:simulador_frete/models/tipo_frete.dart';

class CalculadoraFrete {
  ResultadoFrete calcular({
    required TipoFrete tipo,
    required double peso,
    required double distancia,
    required double valorCompra,
  }) {
    late ResultadoFrete resultadoFrete;

    if (peso <= 0) {
      throw ArgumentError("O pesso deve ser maior que zero");
    }
    if (distancia < 0) {
      throw ArgumentError("A distancia deve maior que zero");
    }
    switch (tipo) {
      case TipoFrete.economico:
        resultadoFrete = ResultadoFrete(
          valor: 8 + 2 * peso + distancia * 0.10,
          prazoDias: 5,
        );
      case TipoFrete.expresso:
        resultadoFrete = ResultadoFrete(
          valor: 15 + 4 * peso + distancia * 0.25,
          prazoDias: 2,
        );
      case TipoFrete.retirada:
        resultadoFrete = ResultadoFrete(valor: 0, prazoDias: 1);
    }
    if (valorCompra >= 300) {
     return resultadoFrete.copyWith(valor: 0.0);
    }

    return resultadoFrete;
  }
}
