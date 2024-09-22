import 'package:flutter/material.dart';
import 'package:valorant_app/apis/manager_api.dart';
import 'package:valorant_app/models/weapons_model.dart';

class WeaponsTap extends StatefulWidget {
  WeaponsTap({super.key});

  @override
  State<WeaponsTap> createState() => _WeaponsTapState();
}

class _WeaponsTapState extends State<WeaponsTap> {
  List<Data> data = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ManagerApi.getWeapon(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          print("==================wating================");
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "${snapshot.error}",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          print("==================error================");
          data = snapshot.data!.data!;
          return Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                        height: 200,
                        width: double.infinity,
                        margin:
                            const EdgeInsets.only(top: 80, right: 10, left: 10),
                        decoration: BoxDecoration(
                            color: const Color(0xff081E34),
                            borderRadius: BorderRadius.circular(20))),
                    Positioned(
                      // bottom: 100,
                      top: 90,
                      child: Transform.rotate(
                          angle: index.isEven ? 0.5 : 6,
                          child: Transform.scale(
                            scaleX: index.isEven ? 1 : -1,
                            child: Image.network(data[index].displayIcon!,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child; // Return the image once it's fully loaded
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              }
                            }, errorBuilder: (BuildContext context,
                                    Object error, StackTrace? stackTrace) {
                              return const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.error,
                                        color: Colors.red, size: 50),
                                    SizedBox(height: 8),
                                    Text(
                                      'Failed to load image',
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.red),
                                    ),
                                  ],
                                ),
                              );
                            }, height: 80),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 180,
                          left: index.isEven ? 40 : 0,
                          right: index.isOdd ? 40 : 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            data[index].displayName!,
                            textDirection: index.isEven
                                ? TextDirection.ltr
                                : TextDirection.rtl,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            data[index].category!,
                            textDirection: index.isEven
                                ? TextDirection.ltr
                                : TextDirection.rtl,
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          );
        });
  }
}
