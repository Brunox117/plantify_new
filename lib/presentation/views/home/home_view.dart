import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
            ? const CircularProgressIndicator()
            : PlantsMasonry(
                plants: plantsList,
                loadNextPage: loadNextPage,
              ));
  }
}
