import 'package:flutter/material.dart';
import 'package:valorant_app/apis/manager_api.dart';
// import 'package:valorant_app/models/agent_model.dart';
import 'package:valorant_app/models/datails_model.dart';
// import 'package:valorant_app/models/map_model.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = 'details';
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var details = ModalRoute.of(context)!.settings.arguments as DetailsModel;
    return Scaffold(
      backgroundColor: Color(0xff06111C),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          details.name!,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Image.asset("lib/assets/displayicon 1.png",height: 25,width: 25),
          )
        ],
      ),
      body: FutureBuilder(
        future: ManagerApi.getAgent(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          print("==========wating================");
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "${snapshot.error}",
                style: TextStyle(color: Colors.red),
              ),
            );
          }
          print("==========error================");
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 200,
                      margin: EdgeInsets.only(top: 20),
                      child: Image.network(
                        details.backGroundImage??"",
                        width: 320,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          return const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.error, color: Colors.red, size: 50),
                                SizedBox(height: 8),
                                Text(
                                  'Failed to load image',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.red),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Image.network(
                      details.image??"",
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.error, color: Colors.transparent, size: 50),
                              SizedBox(height: 8),
                              Text(
                                'Failed to load image',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.transparent),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              // const Spacer(),
              const SizedBox(height: 20),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "DESCRIPTION",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    details.description!,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 15),
                  const Text(
                    "ABILITIES",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                          itemCount: details.abilities.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(4),
                                  height: 90,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.network(details.abilities[index].displayIcon??"",errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          return const Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(child: Icon(Icons.error, color: Colors.red, size: 40)),
                                SizedBox(height: 8),
                                Expanded(
                                  child: Text(
                                    'Failed to load image',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                                    ),
                                  ),
                                ),
                              ],
                            );
                          })),
                ],
              ))
            ],
          );
        },
      ),
    );
  }
}
