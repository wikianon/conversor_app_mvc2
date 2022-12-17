import 'package:flutter/material.dart';
import '../components/currency_box.dart';
import '../controllers/home_controller.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  
  //variaveis para pegar o texto digitado no Expanded do CurrencyBox
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  late HomeController homeController;
  
  /*
  @override
  void initState(){
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }
*/
  
  //Como a classe MyHomePageState não é privada usando o underline antes do nome
  //Podemos usar a propria classe para inicializar os metodos ao iniciar o app
  //o construtor initState deve ser usado quando a classe é privada.
  //classe publica: class MyHomePageState
  //classe privada: class _MyHomePageState
  MyHomePageState() {
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //para nao dar erro na tela ao abrir o teclado usar o SingleChildScrollView.
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 100, bottom: 20),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 150,
                  height: 150
                ),
                
                const SizedBox(height: 30),
                CurrencyBox(
                  selectedItem: homeController.toCurrency,
                  controller: homeController.toText,
                  items: homeController.currencies,

                  onChanged: (model) {
                    //O setState só é habilitado dentro de uma classe StatefulWidget
                    setState(() {
                      //Para o objeto model ser visto dentro do setState temos que
                      //verificar se ele é nulo adicionando uma interrogação no final do objeto.
                      homeController.toCurrency = model!; 
                    });
                  },
                ), //CurrencyBox
      
                const SizedBox(height: 10), //Distancia entre um CurrencyBox => Row de cima para o CurrencyBox => Row de baixo.
                CurrencyBox(
                  selectedItem: homeController.fromCurrency,
                  controller: homeController.fromText,
                  items: homeController.currencies,

                  onChanged: (model) {
                    setState(() {
                      homeController.fromCurrency = model!;
                    });
                  },
                ), //CurrencyBox
                
                //Distancia do Botao ElevatedButton para a Linha do CurrencyBox
                const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber, // background
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0) // foreground
                    ),
                    onPressed: () {
                      setState(() {
                        homeController.convert();
                      });
                    }, //onPressed
      
                    child: const Text(
                      'CONVERTER',
                      style: TextStyle(fontSize: 20)
                    ), //Text
                  ), //ElevatedButton
              ], //children
            ), //Column
          ), //Padding
        ), //SizedBox
      ) //SingleChildScrollView
    ); //Scaffold
  }
}
