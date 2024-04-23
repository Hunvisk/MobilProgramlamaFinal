// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/routescontainerdesign.dart';

class DesktopRoutes extends StatelessWidget {
  const DesktopRoutes({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      
    ));
  }
}

class DesktopRoutesScreen extends StatelessWidget {
  const DesktopRoutesScreen({
    Key? key,
    required this.isSearching,
    required this.searchController,
  }) : super(key: key);

  final bool isSearching;
  final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isSearching)
          Container(
            height: 32,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                // Arama çubuğu değiştiğinde yapılacak işlemleri ekleyin.
              },
              onSubmitted: (value) {
                // Arama çubuğundan 'Submit' tuşuna basıldığında yapılacak işlemleri ekleyin.
              },
              decoration: InputDecoration(
                hintText: "Ara...",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(4.0),
              ),
            ),
          ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        GoRouter.of(context).push('/SelectedRoutes');
                      },
                      child: RoutesContainerDesign(
                        photo: "assets/images/routes/eminonu.jpeg",
                        title: "Eminönü",
                        puan: "5.0",
                        visualization: "2024",
                        comment: "32",
                        durak: "9",
                      ),
                    ),
                  ),
                   Gap(15),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        GoRouter.of(context).push('/SelectedRoutes');
                      },
                      child: RoutesContainerDesign(
                        photo: "assets/images/routes/eminonu.jpeg",
                        title: "Eminönü",
                        puan: "5.0",
                        visualization: "2024",
                        comment: "32",
                        durak: "9",
                      ),
                    ),
                  ),
                  Gap(15), 
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        GoRouter.of(context).push('/SelectedRoutes');
                      },
                      child: RoutesContainerDesign(
                        photo: "assets/images/routes/ortakoy.jpeg",
                        title: "Ortaköy",
                        puan: "4.5",
                        visualization: "1500",
                        comment: "25",
                        durak: "6",
                      ),
                    ),
                  ),
                   Gap(15),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        GoRouter.of(context).push('/SelectedRoutes');
                      },
                      child: RoutesContainerDesign(
                        photo: "assets/images/routes/ortakoy.jpeg",
                        title: "Ortaköy",
                        puan: "4.5",
                        visualization: "1500",
                        comment: "25",
                        durak: "6",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: RoutesContainerDesign(
                      photo: "assets/images/routes/sariyer.jpeg",
                      title: "Sarıyer",
                      puan: "4.7",
                      visualization: "1800",
                      comment: "28",
                      durak: "12",
                    ),
                  ),
                  Gap(15),
                  Expanded(
                    child: RoutesContainerDesign(
                      photo: "assets/images/routes/eminonu.jpeg",
                      title: "Eminönü",
                      puan: "5.0",
                      visualization: "2024",
                      comment: "32",
                      durak: "9",
                    ),
                  ),
                  Gap(15),
                  Expanded(
                    child: RoutesContainerDesign(
                      photo: "assets/images/routes/camlica.jpeg",
                      title: "Çamlıca Tepesi",
                      puan: "4.2",
                      visualization: "3200",
                      comment: "78",
                      durak: "15",
                    ),
                  ),
                  Gap(15),
                  Expanded(
                    child: RoutesContainerDesign(
                      photo: "assets/images/routes/eminonu.jpeg",
                      title: "Eminönü",
                      puan: "5.0",
                      visualization: "2024",
                      comment: "32",
                      durak: "9",
                    ),
                  ),
                ],
              ),
            ),
           
          ],
        )
      ],
    );
  }
}
