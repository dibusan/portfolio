import 'package:flutter/material.dart';

class ResumeGeneratorHeader extends StatelessWidget {
  final TabController tabController;

  const ResumeGeneratorHeader({
    super.key,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TabBar(
        controller: tabController,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.grey,
        labelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w100,
        ),
        tabs: const [
          Tab(text: 'Tech Stack'),
          Tab(text: 'Job Match'),
        ],
      ),
    );
  }
}
