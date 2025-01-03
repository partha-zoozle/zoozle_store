import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ZoozleHeader extends StatelessWidget implements PreferredSizeWidget {
  final bool needDivider;

  const ZoozleHeader({
    this.needDivider = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
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
          if(needDivider)
          const Divider(height: 1, thickness: 1, color: Colors.grey),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(121); // Header + Divider
}
