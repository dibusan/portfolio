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
        double desiredCardSize = constraints.maxHeight > 500 ? constraints.maxHeight * 0.45 : 350;
        double availableWidth = constraints.maxWidth;
        double availableHeight = constraints.maxHeight;

        int cardsPerRow = (availableWidth / desiredCardSize).floor();
        int cardsPerColumn = (availableHeight / desiredCardSize / widget.divideLine).floor();

        double cardWidth = availableWidth / cardsPerRow;
        double cardHeight = availableHeight / cardsPerColumn;

        double verticalSpacing = (availableHeight - cardHeight * (constraints.maxHeight / cardHeight).floor()) / 2;

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
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: cardHeight,
                    mainAxisExtent: cardWidth,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                  ),
                  padding: EdgeInsets.symmetric(vertical: verticalSpacing > 16 ? verticalSpacing : 16),
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.projects.length,
                  itemBuilder: (context, index) => ProjectPreviewCard(project: widget.projects[index]),
                ),
              ),
            ),
            if (canScrollRight)
              Positioned(
                right: 0,
                child: InkWell(
                  onTap: () {
                    controller.animateTo(controller.offset + desiredCardSize, duration: const Duration(milliseconds: 500), curve: Curves.linear);
                  },
                  child: Container(
                    width: 80,
                    height: constraints.maxHeight,
                    decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.grey.withOpacity(0.1), Colors.transparent])),
                    child: const Center(
                      child: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
              )
          ],
        );
      },
    );
  }
}
