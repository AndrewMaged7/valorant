import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:valorant_app/apis/manager_api.dart';
import 'package:valorant_app/models/agent_model.dart';
import 'package:valorant_app/models/datails_model.dart';
import 'package:valorant_app/ui/screens/details_scrren.dart';

class AgentTap extends StatelessWidget {
  AgentTap({super.key});
  List<Agent> agent = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        FutureBuilder(
            future: ManagerApi.getAgent(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Ooops Error Pleas Try Again"),
                );
              }
              agent = snapshot.data!.agents!;
              return CarouselSlider.builder(
                options: CarouselOptions(
                  height: 300,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration:
                      const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  //scrollDirection: Axis.horizontal,
                ),
                itemCount: agent.length,
                itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) =>
                    Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(24),
                              topLeft: Radius.circular(72),
                              bottomRight: Radius.circular(80)),
                          gradient: LinearGradient(
                            colors: [
                              stringColorToHex(agent[itemIndex]
                                  .backgroundGradientColors![0]),
                              stringColorToHex(agent[itemIndex]
                                  .backgroundGradientColors![3])
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        )),
                    Positioned(
                      top: -40,
                      child: GestureDetector(
                        onTap: () {
                        Navigator.pushNamed(context, DetailsScreen.routeName,
                            arguments: DetailsModel(
                                //index: itemIndex,
                                name: agent[itemIndex].displayName,
                                backGroundImage: agent[itemIndex].background,
                                image: agent[itemIndex].fullPortraitV2,
                                actionAppBar:
                                    agent[itemIndex].displayIconSmall,
                                description: agent[itemIndex].description,
                                abilities: agent[itemIndex].abilities!));
                      },
                        child: Image.network(
                          agent[itemIndex].fullPortraitV2 ?? '',
                          height: 300,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return Center(
                                child: Column(
                                  children: [
                                    SizedBox(height: 200),
                                    CircularProgressIndicator(
                                      value: loadingProgress.expectedTotalBytes !=
                                              null
                                          ? loadingProgress.cumulativeBytesLoaded /
                                              loadingProgress.expectedTotalBytes!
                                          : null,
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          errorBuilder: (BuildContext context, Object error,
                              StackTrace? stackTrace) {
                            return const Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 150),
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
                          },
                        ),
                      ),
                    ),
                    Positioned(
                        left: 20,
                        bottom: 15,
                        child: Text(
                          agent[itemIndex].displayName!,
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ))
                  ],
                ),
              );
            }),
      ],
    );
  }

  Color stringColorToHex(String colorString) {
    String colorHex = colorString.length > 2
        ? colorString.substring(0, colorString.length - 2)
        : colorString;
    if (colorHex.length == 6) {
      colorHex = 'FF$colorHex';
    }
    return Color(int.parse(colorHex, radix: 16));
  }
}
