import 'package:app/widget/HomeView.dart';
import 'package:app/widget/SettingView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../notification.dart';
import '../util/dto/WorkController/WorkDTO.dart';
import 'Detai.dart';

class MainView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainViewState();
  }

}
class MainViewState extends State<MainView>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            bottom: const TabBar(
              unselectedLabelColor: Colors.white,
              labelColor: Colors.blue,
              tabs: <Widget>[
                Tab(
                    icon: Icon(
                      Icons.home,
                      size: 30,
                    )
                ),
                Tab(
                    icon: Icon(
                      Icons.list_alt,
                      size: 30,
                    )
                ),
                Tab(
                    icon: Icon(
                      Icons.settings,
                      size: 30,
                    )
                ),
              ],
            ),
            backgroundColor: Colors.black54,
          ),
          body: TabBarView(
            children: [
              HomeView(),
              Detail(id: new WorkDTO(id: 1, name: "sdsdsdsd")),
              SettingView()
            ],
          ),
        )
    );
  }
}