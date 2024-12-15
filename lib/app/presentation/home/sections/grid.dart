import 'package:flutter/material.dart';
import 'package:portfolio_eriel/app/presentation/project/widgets/project_preview_card.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

class GridSection extends StatefulWidget {
  final int divideLine;
  final List<Project> projects;

  const GridSection({super.key, required this.projects, this.divideLine = 1});

  @override
  State<GridSection> createState() => _GridSectionState();
}

class _GridSectionState extends State<GridSection> {
  final ScrollController controller = ScrollController();

  bool canScrollRight = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(_checkScrollPosition);
    Future.microtask(() => _checkScrollPosition());
  }

  @override
  void dispose() {
    controller.removeListener(_checkScrollPosition);
    controller.dispose();
    super.dispose();
  }

  void _checkScrollPosition() {
    bool tempCanScrollRight = controller.position.maxScrollExtent > controller.position.pixels;
    if (tempCanScrollRight != canScrollRight) {
      setState(() => canScrollRight = tempCanScrollRight);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        double cardWidth = constraints.maxHeight / widget.divideLine;
        cardWidth = cardWidth.clamp(250.0, 400.0);
        double cardHeight = cardWidth * 0.8;
        return Stack(
          children: [
            ScrollConfiguration(
              behavior: MyCustomScrollBehavior(),
              child: Scrollbar(
                interactive: true,
                controller: controller,
                child: GridView.builder(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: cardWidth,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount: widget.divideLine,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.projects.length,
                  itemBuilder: (context, index) => SizedBox(
                    width: cardWidth,
                    height: cardHeight,
                    child: ProjectPreviewCard(project: widget.projects[index]),
                  ),
                ),
              ),
            ),
            if (canScrollRight)
              Positioned(
                right: 0,
                child: InkWell(
                  onTap: () {
                    controller.animateTo(
                      controller.offset + cardWidth,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.linear,
                    );
                  },
                  child: Container(
                    width: 80,
                    height: constraints.maxHeight,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.grey.withOpacity(0.1), Colors.transparent],
                      ),
                    ),
                    child: const Center(
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
