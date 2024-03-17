import 'package:flutter/material.dart';
import 'package:studio_93/ui/resources/app_colors.dart';

import 'ui/screens/task_screen.dart';

void main() {
  runApp(const TaskApp());
}

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: AppColors.orangeColor,
        useMaterial3: false,
      ),
      home: const TaskScreen(),
    );
  }
}
