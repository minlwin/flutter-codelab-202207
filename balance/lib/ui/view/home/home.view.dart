import 'package:balance/model/states/nested.pager.state.dart';
import 'package:balance/model/states/year_mont.trial.state.dart';
import 'package:balance/ui/view/home/home.category.dart';
import 'package:balance/ui/view/home/home.summary.dart';
import 'package:balance/ui/widget/bottom.nav.bar.dart';
import 'package:balance/ui/widget/controls.button.dart';
import 'package:balance/ui/widget/sidebar.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => YearMonthTrial()),
        ChangeNotifierProvider(
          create: (context) => NestedPagerState.create(
            pages: {
              HomeSummary.title: () => const HomeSummary(),
              HomeCategory.creditTitle: () => const HomeCategory(true),
              HomeCategory.debitTitle: () => const HomeCategory(false),
            },
            current: HomeSummary.title,
          ),
        )
      ],
      child: const HomeBody(),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final pager = context.watch<NestedPagerState>();
    final state = context.watch<YearMonthTrial>();
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("My Balance"),
            Text(
              state.title,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      drawer: const Sidebar(),
      body: Column(children: [
        Expanded(child: pager.currentPage),
        BottomNavBar(controls: [
          IconButton(
            onPressed: () {
              state.previous();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          ControlsButton(
            icon: Icons.house,
            label: "Home",
            action: () {
              pager.change(HomeSummary.title);
            },
          ),
          ControlsButton(
            icon: Icons.arrow_upward,
            label: "Credits",
            action: () {
              pager.change(HomeCategory.creditTitle);
            },
          ),
          ControlsButton(
            icon: Icons.arrow_downward,
            label: "Debits",
            action: () {
              pager.change(HomeCategory.debitTitle);
            },
          ),
          IconButton(
            onPressed: () {
              state.next();
            },
            icon: const Icon(Icons.arrow_forward),
          ),
        ])
      ]),
    );
  }
}
