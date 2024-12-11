import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/main_bloc/main_bloc.dart';
import '../home/home2_screen.dart';
import '../home/home3_screen.dart';
import '../home/home_screen.dart';
import 'widget/widgets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Sử dụng PageController để quản lý các screen
  late final PageController _pageController;

  // Cache các screen để tránh rebuild không cần thiết
  final List<Widget> _screens = [
    const HomeScreen(),
    const HomeScreen2(),
    const HomeScreen3(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc(),
      child: Scaffold(
        body: BlocConsumer<MainBloc, MainState>(
          listener: (context, state) {
            // Chuyển đến tab tương ứng khi index thay đổi
            _pageController.jumpToPage(state.currentIndex);
          },
          builder: (context, state) {
            return PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: _screens.map((screen) {
                return PageStorage(
                  bucket:
                      PageStorageBucket(), // PageStorage để lưu trạng thái từng tab
                  key: ValueKey(screen.runtimeType),
                  child: screen,
                );
              }).toList(),
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBarWidget(
          pageController: _pageController,
        ),
      ),
    );
  }
}
