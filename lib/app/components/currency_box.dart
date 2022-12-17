import 'package:flutter/material.dart';
import '../models/currency_model.dart';

class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel> items; //Cria uma lista dos items da classe CurrencyModel.
  final CurrencyModel selectedItem;
  final TextEditingController controller;

  //Criando variavel do tipo função chamanda onChanged
  final void Function(CurrencyModel? model)? onChanged; //deste modo o onChange é aceito no onChanged do DropdownButon
  
  //Construtor nomeado exige parametros nomeados ao usar este construtor
  const CurrencyBox({super.key, required this.items, required this.selectedItem, required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: SizedBox(
                  height: 56,
                  child: DropdownButton<CurrencyModel>(
                      iconEnabledColor: Colors.amber,
                      isExpanded: true,
                      value: selectedItem,
                      underline: Container(
                        height: 1,
                        color: Colors.amber,
                      ), //Container
                      items: items.map((e) => DropdownMenuItem(value: e, child: Text(e.name))).toList(),
                      onChanged: onChanged, //recebe variavel do tipo funcao chamada onChanged
                  ) //DropdownButton
              ) //SizedBox
          ), //Expanded
          const SizedBox(width: 15),
          Expanded(
              flex: 2,
              child: TextField(
              controller: controller,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green)
                ) //UnderlineInputBorder
              ) //InputDecoration
            ) //TextField
          ) //Expanded
        ], //children
      ); //Row ou linha
  }
}
