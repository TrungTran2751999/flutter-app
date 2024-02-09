import 'package:app/util/dto/WorkController/WorkDTO.dart';
import 'package:app/widget/CardModal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../modal/DataItems.dart';

class CartBody extends StatefulWidget{
  CartBody(
      { Key? key,
        required this.item,
        required this.fun
      }):super(key: key);
  WorkDTO item;
  Function fun;
  @override
  State<StatefulWidget> createState() {
    return CartBodyLess(fun: fun, item: item);
  }
}
class CartBodyLess extends State<CartBody>{
  WorkDTO item;
  Function fun;
  CartBodyLess(
    {
      required this.item,
      required this.fun
    });
  void handleDelete(){
    fun(item.id);
  }
  void handleEdit(String name, int id){
    setState(() {
      item.name = name;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 74,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(12)
        ),
        child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.name,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),

              Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GestureDetector(
                        onTap: (){
                          handleDelete();
                        },
                        child: const Icon(
                          Icons.delete_outline,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GestureDetector(
                        onTap: (){
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext build){
                                return ModalBotomm(fun: handleEdit, isVisbled: true, value: item.name,type: "EDIT",);
                              }
                          );
                        },
                        child: const Icon(
                          Icons.edit,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                  )
                ],
              )]
          ),
        );
  }

}