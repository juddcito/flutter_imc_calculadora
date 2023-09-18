

import 'package:flutter/material.dart';
import 'package:flutter_imc_calculator/screens/result_screen.dart';

class HomeScreen extends StatefulWidget {
  
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final FocusNode _weightFocus = FocusNode();
  final FocusNode _heightFocus = FocusNode();

  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    _weightFocus.dispose();
    _heightFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                
                //* persona image
                Image.asset(
                  'assets/persona.png',
                  scale: 3.5,
                ),
          
                const SizedBox(height: 40),

                //* altura textfield
                TextField(
                  onChanged:(text) {
                    if (text.length >= 2 && !text.contains('.')){
                      _heightController.text = '${text.substring(0, 1)}.';
                      _heightController.selection = TextSelection.fromPosition(
                        TextPosition(offset: _heightController.text.length)
                      );
                    }
                  },
                  onSubmitted: (value) => FocusScope.of(context).requestFocus(_weightFocus),
                  focusNode: _heightFocus,
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    suffixText: 'm',
                    labelText: 'Altura',
                    prefixIcon: const Icon(Icons.height_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)
                    ),
                  ),        
                ),
          
                const SizedBox(height: 30),

                //* peso textfield
                TextField(
                  controller: _weightController,
                  focusNode: _weightFocus,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    suffixText: 'kg',
                    labelText: 'Peso',
                    prefixIcon: const Icon(Icons.scale_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)
                    ),
                  ),
                ),         
          
                const SizedBox(height: 30),

                //* calcular button
                Container(
                  width: double.infinity,
                  height: 68,
                  child: FilledButton(
                    style: const ButtonStyle(
                    ),                
                    onPressed: () {    
                      if (_weightController.text.isEmpty || _heightController.text.isEmpty) {
                        showDialog(
                          context: context,
                          builder:(context) => const AlertDialog(
                            title: Text('Error'),
                            content: Text('Ingrese su peso y altura, por favor.'),
                          ),
                        );
                      } else {          
                        // imc = weight / height * height
                        final double imc = double.parse(_weightController.text) / (double.parse(_heightController.text) * double.parse(_heightController.text));
                        _weightController.text = '';
                        _heightController.text = '';
                        FocusScope.of(context).unfocus();
                        Navigator.of(context).push(
                          MaterialPageRoute(builder:(context) => ResultScreen(imc: imc))
                        );
                      }
                    },
                    child: const Text('Calcular')
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