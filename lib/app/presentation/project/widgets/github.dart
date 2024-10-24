import 'package:flutter/material.dart';

class GithubLink extends StatefulWidget {
  const GithubLink({super.key});

  @override
  State<GithubLink> createState() => _GithubLinkState();
}

class _GithubLinkState extends State<GithubLink> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/github.png'),
          ),
        ),
      ),
    );
  }
}
