import 'package:flutter/material.dart';

import '../model/todoitemm.dart';


class TodoItem extends StatelessWidget{
  final ToDo toDo;
  final changeValue;

  const TodoItem({super.key, required this.toDo, this.changeValue,});


  @override
  Widget build(BuildContext context) {
    return  Container(
    child:ListTile(
      onTap:(){
        changeValue;
      },

    leading:Icon(Icons.check_box),
title:Text(toDo.title ?? 'this is null'),
trailing:Icon(Icons.delete,color:Colors.red,size:20,),
) ,
);
  }
}
