import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ZoozleHeader extends StatelessWidget implements PreferredSizeWidget {


  const ZoozleHeader({
    super.key, // Path to the image asset
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Image.asset(
              "assets/images/zoozle.png",
              height: 32,
            ),
          ),
        ),
        const Divider(height: 1, thickness: 1, color: Colors.grey),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(121); // Header + Divider
}
