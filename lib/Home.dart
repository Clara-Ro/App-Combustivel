// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_final_fields

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _resultado = '';

  void _calcular(){
     double precoAlcool = double.parse(_controllerAlcool.text);
     double precoGasolina = double.parse(_controllerGasolina.text);

     if ((precoAlcool/precoGasolina) >= 0.7) {
       setState(() {
         _resultado = 'Melhor abastecer com gasolina';
       });
     } else{
       setState(() {
         _resultado = 'Melhor abastecer com álcool';
       });
     }

     _limparCampos();
  }

  void _limparCampos(){
    _controllerAlcool.text = '';
    _controllerGasolina.text = '';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Álcool ou Gasolina'),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Container(
        child: SingleChildScrollView(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset('images/logo.png'),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    'Saiba qual a melhor opção para o abastecimento do seu carro',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: 'Preço do Álcool, ex: 1.59'),
                  style: TextStyle(fontSize: 22),
                  controller: _controllerAlcool,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: 'Preço da Gasolina, ex: 3.29'),
                  style: TextStyle(fontSize: 22),
                  controller: _controllerGasolina,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(
                          TextStyle(fontSize: 20, color: Colors.white)),
                      padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    child: Text('Calcular'),
                    onPressed:_calcular,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    _resultado,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
