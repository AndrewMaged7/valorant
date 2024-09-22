import 'package:flutter/material.dart';
import 'package:valorant_app/ui/taps/agent_tab.dart';
import 'package:valorant_app/ui/taps/map_tap.dart';
import 'package:valorant_app/ui/taps/weapsons_tap.dart';
import 'package:valorant_app/ui/widgets/button_tab_bar.dart';
//import 'package:valorant_app/ui/widgets/tab_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [AgentTap(), MapsTap(), WeaponsTap()];
  int index =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff06111C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 200,
        title: Column(
          children: [
            Image.asset("lib/assets/Logo Icon.png"),
            Image.asset("lib/assets/Logo Text.png"),
          ],
        ),
        centerTitle: true,
      ),
       body:
       Column(
         children: [
          Padding(
      padding: const EdgeInsets.all(6.0),
      child: DefaultTabController(
          length: 3,
          child: TabBar(
              isScrollable: false,
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              labelPadding: const EdgeInsets.all(8),
              padding: const EdgeInsets.only(left: 0, right: 10),
              onTap: (value) {
                index = value;

                // index == 0
                //     ? AgentTap()
                //     : index == 1
                //         ? MapsTap()
                //         : '';
                // if (index == 0) {
                //   AgentTap();
                //   } else if (index == 1) {
                //   MapsTap();
                //   } else {
                //   WeaponsTap();
                // }
                setState(() {});
              },
              tabs: [
                Tab(
                    child: ButtonTabBar(
                  text: 'AGENTS',
                  isSelected: index == 0 ? true : false,
                )),
                Tab(
                    child: ButtonTabBar(
                        text: 'MAPS', isSelected: index == 1 ? true : false)),
                Tab(
                    child: ButtonTabBar(
                        text: 'WEAPONS',
                        isSelected: index == 2 ? true : false)),
              ])),
    ),
          // TapBar(),
           tabs[index],
         ],
       )
      // Column(
      //   children: [
      //      TapBar(),
      //     const SizedBox(height: 15),
      //     tabs
      //     //AgentTap()
      //     // MapsTap()
      //     // WeaponsTap()
      //   ],
      // ),
    );
  }
}
