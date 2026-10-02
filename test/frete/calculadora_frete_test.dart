
import 'package:flutter_test/flutter_test.dart';
import 'package:simulador_frete/frete/calculadora_frete.dart';
import 'package:simulador_frete/models/tipo_frete.dart';

void main() {
  final calculadora = CalculadoraFrete();

  test('frete econômico deve calcular valor pelo peso e distancia', () {
    // Arrange
    const peso = 2.0;
  const distancia = 100.0;
    // Act
    final resultado = calculadora.calcular(
      tipo: TipoFrete.economico,
      peso: peso,
      distancia:distancia,
      valorCompra: 1,
    );

    // Assert
    expect(resultado.valor, closeTo(22.0, 0.01));
  });

  test('frete Expresso deve calcular valor pelo peso e distancia', () {
    // Arrange
    const peso = 2.0;
    const distancia = 100.0;
    // Act
    final resultado = calculadora.calcular(
      tipo: TipoFrete.expresso,
      peso: peso,
      distancia: distancia,
            valorCompra: 1,

    );

    // Assert
    expect(resultado.valor, closeTo(48.0, 0.01));
  });

 test('peso zero deve gerar erro', () {
    expect(
      () => calculadora.calcular(
        tipo: TipoFrete.economico,
        peso: 0.0,
        distancia: 100.0,
              valorCompra: 1,

      ),
      throwsArgumentError,
    );
  });

 test('distância negativa deve gerar erro', () {
    expect(
      () => calculadora.calcular(
        tipo: TipoFrete.economico,
        peso: 2.0,
              valorCompra: 1,

        distancia: -10.0,
      ),
      throwsArgumentError,
    );
  });

  test('compra a partir de 350 deve ter frete gratis',(){
     const peso = 2.0;
    const distancia = 100.0;
    const valorCompra = 400.00;
    // Act
    final resultado = calculadora.calcular(
      tipo: TipoFrete.economico,
      peso: peso,
      distancia: distancia,
      valorCompra:valorCompra,
    );

    expect(resultado.valor, closeTo(0.0, 0.01));
  });

  test('compra a partir de 350 deve ter frete gratis', () {
    const peso = 2.0;
    const distancia = 100.0;
    const valorCompra = 300.00;
    // Act
    final resultado = calculadora.calcular(
      tipo: TipoFrete.economico,
      peso: peso,
      distancia: distancia,
      valorCompra: valorCompra,
    );

    expect(resultado.valor, closeTo(0.0, 0.01));
  });

   test('compra a partir de 350 deve ter frete gratis', () {
    const peso = 2.0;
    const distancia = 100.0;
    const valorCompra = 299.99;
    // Act
    final resultado = calculadora.calcular(
      tipo: TipoFrete.economico,
      peso: peso,
      distancia: distancia,
      valorCompra: valorCompra,
    );

    expect(resultado.valor, closeTo(22.0, 0.01));
  });
  
  }
