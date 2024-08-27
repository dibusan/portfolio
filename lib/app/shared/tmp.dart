import 'package:flutter/material.dart';
import 'package:portfolio_eriel/app/shared/__.dart';

class Tmp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator CardWidget - FRAME - VERTICAL
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(89, 148, 227, 0.25),
            offset: Offset(0, 2),
            blurRadius: 32,
          ),
        ],
        // color: Colors.white,
        color: Color.fromRGBO(255, 255, 255, 1),
        // color: Color.fromRGBO(255, 255, 255, 1),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      // Column 1
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(),
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            // First Row
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Logo
                ProjectLogo(),
                SizedBox(width: 8),
                buildTextColumn(),
              ],
            ),
          ),
          SizedBox(height: 8),
          // Tags
          Container(
            decoration: BoxDecoration(),
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            // child: buildTagRow(),
          ),
        ],
      ),
    );
  }

  Widget buildTextColumn() {
    return Column(
      children: [
        buildTitle(),
        const VSp10(),
        buildSubtitle(),
        const VSp8(),
        buildSubtitle(),
      ],
    );
  }

  Widget buildSubtitle() {
    return Container(
      width: 221,
      height: 16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(235, 239, 242, 1),
      ),
    );
  }

  Widget buildTitle() {
    return Container(
      width: 221,
      height: 33,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromRGBO(235, 239, 242, 1),
      ),
    );
  }

  // Widget buildTagRow() {
  //   return Row(
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       TechTag(),
  //       const HSp8(),
  //       TechTag(),
  //       const HSp8(),
  //       TechTag(),
  //       const HSp8(),
  //       TechTag(),
  //     ],
  //   );
  // }

  Widget oldTagRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // Tag 1
        Container(
            width: 72,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Color.fromRGBO(222, 222, 222, 1),
            )),
        SizedBox(width: 8),
        Container(
            width: 72,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Color.fromRGBO(222, 222, 222, 1),
            )),
        SizedBox(width: 8),
        Container(
            width: 72,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Color.fromRGBO(222, 222, 222, 1),
            )),
        SizedBox(width: 8),
        Container(
            width: 72,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Color.fromRGBO(222, 222, 222, 1),
            )),
      ],
    );
  }

}