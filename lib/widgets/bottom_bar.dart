import 'package:flutter/material.dart';
import 'package:my_habit_app/controller/bottom_provider.dart';
import 'package:my_habit_app/views/pages/chart_screen.dart';
import 'package:my_habit_app/views/pages/timer_screen.dart';
import 'package:my_habit_app/views/home/today_screen.dart';
import 'package:my_habit_app/widgets/checked_unchecked.dart';
import 'package:provider/provider.dart';
// import 'your_provider_file.dart'; // Import the file where BottomProvider is defined

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BottomProvider(),
      child: BottomBarContent(),
    );
  }
}

class BottomBarContent extends StatelessWidget {
  const BottomBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          body: _pages[provider.selectedindex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.amber,
            currentIndex: provider.selectedindex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              // Use the provider to update the selected index
              context.read<BottomProvider>().pageNavigator(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.done_all_outlined), label: 'Done'),
              BottomNavigationBarItem(icon: Icon(Icons.bar_chart_rounded), label: 'Chart'),
              BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'Stopwatch'),
            ],
          ),
        );
      },
    );
  }
}

final List<Widget> _pages = [
  const TodayScreen(),
  RegularWork(),
  const HabitChart(),
  const TimerScreenContent(),
];
