import 'package:flutter/material.dart';
import 'package:sciencenotes/assets/colors/custom_colors.dart';
import 'package:sciencenotes/domain/toDo.dart';

class ItemCardWidget extends StatefulWidget {
  final ToDo afazer;

  const ItemCardWidget({Key? key, required this.afazer})
      : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCardWidget> {
  bool checkValue = false;
  int select = 1;
  int isDone = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end, //alinhamento da data
          children: [
            Container(
              margin: EdgeInsets.all(8.0), //margem para todos os cards - todos os lados
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    value: checkValue,
                    activeColor: CustomColors.appeButtonColor,
                    onChanged: (value) {
                      if(value == true){
                        select = 1;
                      }else{
                        select = 0;
                      }
                      setState((){
                        checkValue = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: Text(widget.afazer.afazerText,
                        style: const TextStyle(fontSize: 24,
                            fontFamily: 'Abel-Regular',
                            fontWeight: FontWeight.w600,
                            color: CustomColors.appeButtonColor,
                            decoration: widget.afazer.isDone == 1 ? TextDecoration.lineThrough : null)),
                  )
                  //lineThrough seria para riscar o item que já foi feito
                ],
              ),
            ),
            const SizedBox(height: 4),
            Text(widget.afazer.dataText,
                style: const TextStyle(fontSize: 24, fontFamily: 'Abel-Regular')),
          ],
        ),
      ),
      color: Color(0xFFE0F2F1),
    );
  }

  void estaConcluido(ToDo afazer){
    setState((){
      afazer.isDone = 0;
    });
  }
}