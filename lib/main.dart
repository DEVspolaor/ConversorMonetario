import 'package:flutter/material.dart';

void main() {
  runApp(ConversorMoedasApp());
}

class ConversorMoedasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor de Moedas- Giovanni Leme Spolaor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ConversorMoedasPage(),
    );
  }
}

class ConversorMoedasPage extends StatefulWidget {
  @override
  _ConversorMoedasPageState createState() => _ConversorMoedasPageState();
}

class _ConversorMoedasPageState extends State<ConversorMoedasPage> {
  double realValue = 0.0;
  double usdValue = 0.0;
  double eurValue = 0.0;

  void convertCurrency(double value, String currency) {
    setState(() {
      switch (currency) {
        case 'BRL':
          realValue = value;
          usdValue =
              value / 5.0; // Taxa de conversão aproximada de BRL para USD
          eurValue =
              value / 6.0; // Taxa de conversão aproximada de BRL para EUR
          break;
        case 'USD':
          usdValue = value;
          realValue =
              value * 5.0; // Taxa de conversão aproximada de USD para BRL
          eurValue =
              value * 0.8; // Taxa de conversão aproximada de USD para EUR
          break;
        case 'EUR':
          eurValue = value;
          realValue =
              value * 6.0; // Taxa de conversão aproximada de EUR para BRL
          usdValue =
              value * 1.25; // Taxa de conversão aproximada de EUR para USD
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversor de Moedas'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Valor em Reais (BRL)',
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  convertCurrency(double.parse(value), 'BRL');
                }
              },
            ),
            SizedBox(height: 20.0),
            Text('Valor em Dólares (USD): $usdValue'),
            SizedBox(height: 10.0),
            Text('Valor em Euros (EUR): $eurValue'),
          ],
        ),
      ),
    );
  }
}
