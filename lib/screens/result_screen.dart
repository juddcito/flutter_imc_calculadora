

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class ResultScreen extends StatelessWidget {

  final double imc;

  const ResultScreen({
    super.key,
    required this.imc
  });

  @override
  Widget build(BuildContext context) {

    String assetUrl = 'assets/obesidad3.png',
    result = 'Obesidad grado III',
    details = 'Riesgo relativo extremadamente alto para el desarrollo de enfermedades cardiovasculares';
    Color? cardColor = Colors.purple[100];

    switch (imc) {
      
      case < 18:
        assetUrl = 'assets/pordebajo.png';
        cardColor = Colors.blue[100];
        result = 'Peso bajo';
        details = 'Necesario valorar signos de desnutrición';
        break;
      case >= 18 && < 25:
        assetUrl = 'assets/normal.png';
        cardColor = Colors.green[100];
        result = 'Normal';
        details = '';
        break;
      case >= 25 && < 27:
        assetUrl = 'assets/sobrepeso.png';
        cardColor = Colors.orange[100];
        result = 'Sobrepeso';
        details = '';
        break;
      case >= 27 && < 30:
        assetUrl = 'assets/obesidad1.png';
        cardColor = Colors.red[100];
        result = 'Obesidad grado I';
        details = 'Riesgo relativo para desarrollar enfermedades cardiovasculares';
        break;
      case >= 30 && < 40:
        assetUrl = 'assets/obesidad2.png';
        cardColor = Colors.red[100];
        result = 'Obesidad grado II';
        details = 'Riesgo relativo muy alto para el desarrollo de enfermedades cardiovasculares';
        break;
      default:
        cardColor = cardColor;
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                //* imc card result
                Container(
                  width: double.infinity,
                  height: 200,
                  child: Card(
                    color: cardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'IMC',
                          style: TextStyle(
                            fontSize: 58
                          ),
                        ),
                        Text(
                          imc.toStringAsFixed(2),
                          textAlign: TextAlign.center,   
                          style: const TextStyle(
                            fontSize: 45,
                            color: Colors.black54
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          
                const SizedBox(height: 15),

                //* result text
                Text(
                  result,
                  style: const TextStyle(
                    fontWeight:FontWeight.w500,
                    fontSize: 32
                  ),
                ),
          
                const SizedBox(height: 15),

                //* details text
                Text(
                  details,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18
                  ),
                ),

                const SizedBox(height: 15),

                //* imc image
                FadeIn(
                  delay: const Duration(milliseconds: 900),
                  child: Image.asset(
                    assetUrl,
                    scale: 0.8,
                  ),
                )
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}