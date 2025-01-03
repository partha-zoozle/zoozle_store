import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoozle_store/app/widgets/zoozle_header.dart';
import 'package:zoozle_store/styles.dart';

import '../controllers/product_detail_controller.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ZoozleHeader(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/zoozle.png",
                        height: 400,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        "G Mart PU Leather Makeup Cosmetic case Professional Waterproof Vanity Large Travel Storage Organizer with 4 Trays for Travel/Home Salon/Gift for Wife/Girlfriends/Friends (Black,1-Pcs)",
                        style: Get.textTheme.bodySmall
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Text(
                        "LOWEST PRICE ",
                        style: GoogleFonts.inter(
                          color: const Color(0xff1E7D5F),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Inclusive of all taxes",
                        style: GoogleFonts.inter(
                          color: Get.theme.colorScheme.outline,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Text(
                            "\$2024",
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600, fontSize: 24),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                color: Color(0xffE7F1EE)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 8),
                              child: Text("Save ₹275 on Best Online Price",
                                  style: GoogleFonts.inter(
                                      color: const Color(0xff1E7D5F),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12)),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Best online price: ",
                                    style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w400,
                                        color: Get.theme.colorScheme.outline,
                                        fontSize: 16)),
                                TextSpan(
                                  text: "2024",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: "MRP: ",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w400,
                                      color: Get.theme.colorScheme.outline,
                                      fontSize: 16)),
                              TextSpan(
                                  text: "2010",
                                  style: GoogleFonts.jost(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 16,
                                  ))
                            ]),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      Text("Quantity", style: Get.textTheme.titleMedium),
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        width: 90,
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xff858585), width: 1.27),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Get
                                          .theme.colorScheme.primaryContainer,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(7),
                                        bottomLeft: Radius.circular(7),
                                      ),
                                    ),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.all(7.0),
                                        child: Icon(
                                          Icons.remove,
                                          color: Get.theme.colorScheme
                                              .onSecondaryContainer,
                                          size: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    bottom: 0,
                                    child: Container(
                                      width: 1.27,
                                      color: const Color(0xff858585),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 12),
                              Text(
                                "1",
                                style: Get.textTheme.labelLarge,
                              ),
                              const SizedBox(width: 12),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Get
                                          .theme.colorScheme.primaryContainer,
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(7),
                                        bottomRight: Radius.circular(7),
                                      ),
                                    ),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.all(7.0),
                                        child: Icon(
                                          Icons.add,
                                          color: Get.theme.colorScheme
                                              .onSecondaryContainer,
                                          size: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    bottom: 0,
                                    child: Container(
                                      width: 1.27,
                                      color: const Color(0xff858585),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                      /*Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "PRODUCT DESCRIPTION",
                              style: Get.textTheme.titleMedium,
                            ),
                            if (description?.long?.isNotEmpty == true)
                              Html(
                                key: ValueKey(controller.selectedVariant.value?.id),
                                data: (description?.long
                                    ?.nullIf((element) => element.isEmpty) ??
                                    description?.long)
                                    .toString(),
                                style: {
                                  "body": Style(
                                      padding: HtmlPaddings.zero, margin: Margins.zero)
                                },
                              ),
                            const SizedBox(
                              height: 8,
                            ),
                            if (description?.specifications?.isNotEmpty == true)
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Product Specifications",
                                      style: Get.textTheme.titleMedium,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Table(
                                      border: TableBorder.all(
                                        color: Get.theme.colorScheme.outlineVariant,
                                        width: 1,
                                      ),
                                      columnWidths: const {
                                        0: FlexColumnWidth(1),
                                        1: FlexColumnWidth(2),
                                      },
                                      children: description?.specifications
                                          ?.map((e) => TableRow(
                                        children: [
                                          Container(
                                            color: const Color(0xffF5F5F5),
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              e.field ?? "",
                                              style: Get.textTheme.bodyMedium
                                                  ?.copyWith(
                                                color:
                                                Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            color: Colors.white,
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              e.value ?? "",
                                              style: Get.textTheme.bodyMedium
                                                  ?.copyWith(
                                                color:
                                                Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ))
                                          .toList() ??
                                          [],
                                    )
                                  ]),
                          ],
                        ),
                      ),*/
                      const SizedBox(
                        height: 200,
                      )
                    ]),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: SizedBox(
              height: 50,
              width: 100,
              child: FilledButton(
                onPressed: () async {
                  // Handle payment logic
                },
                child: const Text(
                  'PROCEED TO PAYMENT',
                ),
                style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
