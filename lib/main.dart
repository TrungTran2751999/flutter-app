import 'package:app/util/dto/WorkController/WorkDTO.dart';
import 'package:app/widget/CardBody.dart';
import 'package:app/widget/CardModal.dart';
import 'package:app/widget/Detai.dart';
import 'package:app/widget/HomeView.dart';
import 'package:app/widget/LoginView.dart';
import 'package:flutter/material.dart';

import 'modal/DataItems.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginView(),
  ));
}



