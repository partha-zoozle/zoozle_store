import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zoozle_store/app/modules/product_purchase/controllers/product_purchase_controller.dart';
import 'package:zoozle_store/app/routes/app_pages.dart';
import 'package:zoozle_store/app/widgets/zoozle_header.dart';
import 'package:zoozle_store/styles.dart';

class ProductPurchaseView extends GetView<ProductPurchaseController> {
  const ProductPurchaseView({super.key});

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: const ZoozleHeader(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: isPortrait
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildLeftContainer(),
                    const SizedBox(height: 32),
                    _buildRightContainer(),
                  ],
                ),
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Container (40% width)
                  Expanded(flex: 4, child: _buildLeftContainer()),
                  const SizedBox(width: 100), // 10% space
                  // Right Container (60% width)
                  Expanded(flex: 4, child: _buildRightContainer()),
                ],
              ),
      ),
    );
  }

  Widget _buildLeftContainer() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Get.theme.colorScheme.outlineVariant),
            color: Get.theme.colorScheme.onPrimary,
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Image
                  Container(
                    width: 105,
                    height: 105,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Get.theme.colorScheme.outlineVariant,
                        width: 1.2,
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        "assets/images/zoozle.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Product Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "G Mart PU Leather Makeup Cosmetic case Professional Waterproof Vanity Large Travel Storage Organizer with 4 Trays for Travel/Home Salon/Gift for Wife/Girlfriends/Friends (Black,1-Pcs)",
                          style: Get.textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "LOWEST PRICE ",
                          style: GoogleFonts.jost(
                            color: Get.theme.greenSwatch[900],
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "1,235",
                          style: Get.textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Quantity and Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Quantity Selector
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      border: Border.all(color: Get.theme.colorScheme.primary),
                      color: Get.theme.colorScheme.primaryContainer,
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            // Decrease quantity logic
                          },
                          icon: Icon(
                            Icons.remove,
                            color: Get.theme.colorScheme.primary,
                          ),
                        ),
                        Text(
                          "1",
                          style:
                              TextStyle(color: Get.theme.colorScheme.primary),
                        ),
                        IconButton(
                          onPressed: () {
                            // Increase quantity logic
                          },
                          icon: Icon(
                            Icons.add,
                            color: Get.theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Delete Button
                  OutlinedButton.icon(
                    icon: Icon(
                      Icons.delete,
                      color: Get.theme.colorScheme.error,
                    ),
                    onPressed: () {
                      // Delete logic
                    },
                    label: Text(
                      "Delete",
                      style: TextStyle(color: Get.theme.colorScheme.error),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: Get.theme.colorScheme.error,
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 48),
        _buildPriceDetails(),
      ],
    );
  }

  Widget _buildRightContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "BUYER DETAILS",
          style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        const SizedBox(height: 24),
        TextFormField(
          controller: controller.phoneNumberController,
          decoration: const InputDecoration(
            labelText: "Enter Phone Number",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 32),
        TextFormField(
          controller: controller.nameController,
          decoration: const InputDecoration(
            labelText: "Enter Name",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 32),
        TextFormField(
          controller: controller.emailController,
          decoration: const InputDecoration(
            labelText: "Enter Email",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 32),
        const Divider(color: Colors.black, thickness: 1.5),
        const SizedBox(height: 12),
        Text(
          "EXECUTIVE DETAILS",
          style: GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        const SizedBox(height: 12),
        Obx(
          () => DropdownButtonFormField<String>(
            value: controller.selectedValue.value,
            onChanged: (newValue) {
              controller.selectedValue.value = newValue!;
            },
            items: controller.dropdownItems
                .map(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  ),
                )
                .toList(),
            decoration: const InputDecoration(
              labelText: "Executive Details",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.maxFinite,
          height: 55,
          child: FilledButton(
            onPressed: () {
              Get.toNamed(Routes.PRODUCT_DETAIL);
            },
            style: FilledButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'PROCEED',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  // Price Details Widget
  Widget _buildPriceDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 4,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "G Mart PU Leather Makeup Cosmetic...",
                style: TextStyle(fontSize: 14, color: Colors.black87),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: 8),
            Text(
              "₹1,235",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Divider(color: Colors.grey.shade300, thickness: 1),
        const SizedBox(height: 16),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Amount Payable",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Text(
              "₹1,272",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Divider(color: Colors.grey.shade300, thickness: 1),
      ],
    );
  }
}
