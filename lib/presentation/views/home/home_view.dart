import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:plantify/presentation/providers/providers.dart';

import 'package:plantify/presentation/widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  bool isLastPage = false;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      loadNextPage();
    });
  }

  void loadNextPage() async {
    if (isLoading || isLastPage) return;
    isLoading = true;
    final plants = await ref.read(plantsProvider.notifier).loadNextPage();
    isLoading = false;
    if (plants.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final plantsList = ref.watch(plantsProvider).values.toList();

    return Scaffold(
        appBar: const CustomAppbar(
          title: 'Mis Plantas',
        ),
        body: (plantsList.isEmpty)
            ? Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Parece que no tienes plantas, agrega una!',
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      IconButton(
                        icon: const Icon(
                          Icons.add_circle_outline_rounded,
                          size: 35,
                          color: Colors.green,
                        ),
                        onPressed: () {
                          context.push('/create-plant');
                        },
                      ),
                    ]),
              )
            : PlantsMasonry(
                plants: plantsList,
                loadNextPage: loadNextPage,
              ));
  }
}
