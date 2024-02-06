import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../modal/DataItems.dart';

class CartBody extends StatelessWidget{
  CartBody(
    {Key? key,
    required this.item,
    }):super(key: key);
  DataItems item;
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
              const Icon(
                Icons.delete_outline,
                color: Colors.black,
                size: 30,
              )],
          ),
        );
  }

}