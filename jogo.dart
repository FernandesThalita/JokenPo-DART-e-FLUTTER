import 'dart:math';

import 'package:flutter/material.dart';



class Jogo  extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}



class _JogoState extends State<Jogo> {
 
  var _image = AssetImage("../imagens/padrao.png");
  var _mensagem ="Escolha uma opção abaixo";

     void _opcaoSelecionada(String escolhaUsuario){
    var opcoes = ['pedra', 'papel', 'tesoura'];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];
    print("Opção selecionada: " +escolhaUsuario);
    print("Opção APP: " + escolhaApp);

       switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._image = AssetImage("../imagens/pedra.png");
        });
        break;



      case "papel":
        setState(() {
          this._image = AssetImage("../imagens/papel.png");
        });
        break;



      case "tesoura":
        setState(() {
          this._image = AssetImage("../imagens/tesoura.png");
        });
        break;
    }

    if((escolhaApp =='tesoura' && escolhaUsuario =='papel') || 
    (escolhaApp =='pedra' && escolhaUsuario =='tesoura') || 
    (escolhaApp =='papel' && escolhaUsuario =='pedra'))
    {
      this._mensagem = "Você Perdeu...";
        print('App ganhou');
    }else if((escolhaApp =='papel' && escolhaUsuario =='tesoura') || (escolhaApp =='tesoura' && escolhaUsuario =='papel') || 
    (escolhaApp =='pedra' && escolhaUsuario =='papel'))
    {
          this._mensagem = "Você ganhou!";
          print('User ganhou');
    }else{
       this._mensagem = "Empate.";
      print('empate');
    }
  }
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),    
      ),


      body: Column(
        children: [
          //texto - Escolha do App
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),


          //imagem
           Image(image: this._image),
          // Image.asset("../imagens/padrao.png"),

      

       

          //texto - Resultado
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha uma opção abaixo",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),


          //linha com 3 imagens
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              GestureDetector(
              onTap: ()=>_opcaoSelecionada("pedra"),
              child: Image.asset("../imagens/pedra.png", height: 100),
              ), 
              GestureDetector(
              onTap: ()=>_opcaoSelecionada("papel"),
              child:  Image.asset("../imagens/papel.png", height: 100),
              ), 
              GestureDetector(
              onTap: ()=>_opcaoSelecionada("tesoura"),
              child: Image.asset("../imagens/tesoura.png", height: 100),
              ),    

            ],

          )
        ],
      ),
    );
  }
}

