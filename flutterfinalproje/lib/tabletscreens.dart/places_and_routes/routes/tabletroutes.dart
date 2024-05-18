
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/myappbar.dart';
import '../../../widgets/routescontainerdesign.dart';

class TabletRoutes extends StatelessWidget {
  const TabletRoutes({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
          appBar: MyAppBar(
    title: 'ROTALAR',
          ),
          body: Text("ROTALAR SAYFASI"),
        );
  }
}

class TabletRoutesScreen extends StatelessWidget {
  const TabletRoutesScreen({
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
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                // Arama çubuğu değiştiğinde yapılacak işlemleri ekleyin.
              },
              onSubmitted: (value) {
                // Arama çubuğundan 'Submit' tuşuna basıldığında yapılacak işlemleri ekleyin.
              },
              decoration: const InputDecoration(
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
                      child: const RoutesContainerDesign(
                        photo: "assets/images/routes/eminonu.jpeg",
                        title: "Eminönü",
                        puan: "5.0",
                        visualization: "2024",
                        comment: "32",
                        durak: "9",
                      ),
                    ),
                  ),
                  const Gap(15),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        GoRouter.of(context).push('/SelectedRoutes');
                      },
                      child: const RoutesContainerDesign(
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
            const Padding(
              padding: EdgeInsets.all(10.0),
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
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
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
                      photo: "assets/images/routes/kizKulesi.jpeg",
                      title: "Kız Kulesi",
                      puan: "3.9",
                      visualization: "1293",
                      comment: "22",
                      durak: "3",
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
