import 'package:zoozle_store/app/widgets/global_function.dart';
import 'package:collection/collection.dart';

class ProductList {
  int? count;
  dynamic next;
  dynamic previous;
  List<ProductDetails>? results;

  ProductList({this.count, this.next, this.previous, this.results});

  ProductList.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <ProductDetails>[];
      json['results'].forEach((v) {
        results?.add(ProductDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      data['results'] = results?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductDetails {
  int? id;
  List<Variant>? variants;
  String? productTypeName;
  bool? isPublished;
  dynamic seoTitle;
  dynamic seoDescription;
  String? state;
  String? name;
  String? slug;
  Description? description;
  Images? images;
  dynamic availableForPurchase;
  bool? visibleInListing;
  String? modelNumber;
  dynamic homePageOrder;
  String? shortLink;
  double? rating;
  bool? isCustomizable;
  String? customizableTitle;
  int? category;
  int? defaultVariant;
  bool? isCodAccepted;
  bool? isStockAvailable;
  List<Attribute>? attributes;


  ProductDetails(
      {this.id,
        this.variants,
        this.productTypeName,
        this.isPublished,
        this.seoTitle,
        this.seoDescription,
        this.state,
        this.name,
        this.slug,
        this.description,
        this.images,
        this.availableForPurchase,
        this.visibleInListing,
        this.modelNumber,
        this.homePageOrder,
        this.shortLink,
        this.rating,
        this.isCustomizable,
        this.customizableTitle,
        this.category,
        this.defaultVariant,
        this.isCodAccepted,
        this.isStockAvailable,
        this.attributes,
      });

  ProductDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['variants'] != null) {
      variants = <Variant>[];
      json['variants'].forEach((v) {
        variants?.add(Variant.fromJson(v));
      });
    }
    productTypeName = json['product_type_name'];
    isPublished = json['is_published'];
    seoTitle = json['seo_title'];
    seoDescription = json['seo_description'];
    state = json['state'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'] != null
        ? Description?.fromJson(json['description'])
        : null;
    images = json['images'] != null ? Images?.fromJson(json['images']) : null;
    availableForPurchase = json['available_for_purchase'];
    visibleInListing = json['visible_in_listing'];
    modelNumber = json['model_number'];
    homePageOrder = json['home_page_order'];
    shortLink = json['short_link'];
    rating = json['rating'];
    isCustomizable = json['is_customizable'];
    customizableTitle = json['customizable_title'];
    category = json['category'];
    defaultVariant = json['default_variant'];
    isStockAvailable = json['is_stock_available'];
    isCodAccepted = json['is_cod_accepted'];
    if (json['attributes'] != null) {
      attributes = <Attribute>[];
      json['attributes'].forEach((v) {
        attributes?.add(Attribute.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    if (variants != null) {
      data['variants'] = variants?.map((v) => v.toJson()).toList();
    }
    data['product_type_name'] = productTypeName;
    data['is_published'] = isPublished;
    data['seo_title'] = seoTitle;
    data['seo_description'] = seoDescription;
    data['state'] = state;
    data['name'] = name;
    data['slug'] = slug;
    if (description != null) {
      data['description'] = description?.toJson();
    }
    if (images != null) {
      data['images'] = images?.toJson();
    }
    data['available_for_purchase'] = availableForPurchase;
    data['visible_in_listings'] = visibleInListing;
    data['model_number'] = modelNumber;
    data['home_page_order'] = homePageOrder;
    data['short_link'] = shortLink;
    data['rating'] = rating;
    data['is_customizable'] = isCustomizable;
    data['customizable_title'] = customizableTitle;
    data['category'] = category;
    data['default_variant'] = defaultVariant;
    data['is_stock_available'] = isStockAvailable;
    data['is_cod_accepted'] = isCodAccepted;
    if (attributes != null) {
      data['attributes'] = attributes?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attribute {
  int? id;
  String? attributeName;
  String? attributeSlug;
  String? productTypeName;
  String? attributeInputType;
  List<AttributeValue>? values;
  int? sortOrder;
  bool? variantSelection;
  int? attribute;
  int? productType;

  Attribute(
      {this.id,
        this.attributeName,
        this.attributeSlug,
        this.productTypeName,
        this.attributeInputType,
        this.values,
        this.sortOrder,
        this.variantSelection,
        this.attribute,
        this.productType});

  Attribute.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributeName = json['attribute_name'];
    attributeSlug = json['attribute_slug'];
    productTypeName = json['product_type_name'];
    attributeInputType = json['attribute_input_type'];
    List<AttributeValue> unsortedAttributeValues = [];
    if (json['values'] != null) {
      //values = <AttributeValue>[];
      json['values'].forEach((v) {
        unsortedAttributeValues.add(AttributeValue.fromJson(v));
      });
    }
    unsortedAttributeValues.sort((a, b) => (a.sortOrder ?? 0) - (b.sortOrder ?? 0));
    values = [...unsortedAttributeValues];
    sortOrder = json['sort_order'];
    variantSelection = json['variant_selection'];
    attribute = json['attribute'];
    productType = json['product_type'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['attribute_name'] = attributeName;
    data['attribute_slug'] = attributeSlug;
    data['product_type_name'] = productTypeName;
    data['attribute_input_type'] = attributeInputType;
    if (values != null) {
      data['values'] = values?.map((v) => v.toJson()).toList();
    }
    data['sort_order'] = sortOrder;
    data['variant_selection'] = variantSelection;
    data['attribute'] = attribute;
    data['product_type'] = productType;
    return data;
  }
}

class AttributeValue {
  int? id;
  List<ValueVariant>? variants;
  int? sortOrder;
  String? name;
  String? value;
  String? slug;
  int? attribute;
  bool? isSelected;

  AttributeValue(
      {this.id,
        this.variants,
        this.sortOrder,
        this.name,
        this.value,
        this.slug,
        this.attribute});

  AttributeValue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['variants'] != null) {
      variants = <ValueVariant>[];
      json['variants'].forEach((v) {
        variants?.add(ValueVariant.fromJson(v));
      });
    }
    sortOrder = json['sort_order'];
    name = json['name'];
    value = json['value'];
    slug = json['slug'];
    attribute = json['attribute'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    if (variants != null) {
      data['variants'] = variants?.map((v) => v.toJson()).toList();
    }
    data['sort_order'] = sortOrder;
    data['name'] = name;
    data['value'] = value;
    data['slug'] = slug;
    data['attribute'] = attribute;
    return data;
  }
}

class ValueVariant {
  int? id;
  Images? images;
  Map? privateMetadata;

  ValueVariant({this.id, this.images, this.privateMetadata});

  ValueVariant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    images = json['images'] != null ? Images?.fromJson(json['images']) : null;
    privateMetadata = json['private_metadata'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    if (images != null) {
      data['images'] = images?.toJson();
    }
    if (privateMetadata != null) {
      data['private_metadata'] = privateMetadata;
    }
    return data;
  }
}

class Images {
  List<String>? paths;
  String? preview;
  String? variantPreview;

  Images({
    this.paths,
    this.preview,
    this.variantPreview,
  });

  Images.fromJson(Map<String, dynamic> json) {
    paths = json['paths']?.cast<String>();
    preview = json['preview'];
    variantPreview = json['variant_preview'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['paths'] = paths;
    data['preview'] = preview;
    data['variant_preview'] = variantPreview;
    return data;
  }
}

class Variant {
  int? id;
  List<Stock>? stocks;
  List<Attribute>? attributes;
  Map<String, dynamic>? privateMetadata;
  int? sortOrder;
  String? name;
  Description? description;
  Images? images;
  String? maxPriceCurrency;
  String? maxPrice;
  String? productSlug;
  bool? trackInventory;
  bool? isInWishList;
  dynamic weight;
  int? length;
  int? height;
  int? width;
  dynamic slug;
  int? product;
  ManufacturerDetails? manufacturerDetails;
  String? quantity;
  bool? isStockAvailable;
  bool? isCodAccepted;

  Variant(
      {this.id,
        this.stocks,
        this.privateMetadata,
        this.attributes,
        this.sortOrder,
        this.name,
        this.description,
        this.images,
        this.manufacturerDetails,
        this.maxPriceCurrency,
        this.maxPrice,
        this.trackInventory,
        this.isInWishList,
        this.productSlug,
        this.weight,
        this.length,
        this.height,
        this.width,
        this.slug,
        this.product,
        this.isCodAccepted,
        this.isStockAvailable,
        this.quantity});

  Stock? getStock() {
    stocks?.nullIf((e) => e.isEmpty)?.sort((first, second) =>
        (double.parse(first.price ?? "0") - double.parse(second.price ?? "0"))
            .ceil());
    var stockVal = stocks?.nullIf((e) => e.isEmpty)?.firstWhereOrNull(
            (element) =>
        element.price != null &&
            (element.quantity ?? 0) > 0);


    return stockVal;
  }

  Variant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['stocks'] != null) {
      stocks = <Stock>[];
      json['stocks'].forEach((v) {
        stocks?.add(Stock.fromJson(v));
      });
    }

    manufacturerDetails = json['manufacturer_detail'] != null
        ? ManufacturerDetails?.fromJson(json['manufacturer_detail'])
        : null;
    privateMetadata = json['private_metadata'];
    productSlug = json['product_slug'];
    sortOrder = json['sort_order'];
    if (json['attributes'] != null) {
      attributes = <Attribute>[];
      json['attributes'].forEach((v) {
        attributes?.add(Attribute.fromJson(v));
      });
    }
    name = json['name'];
    description = json['description'] != null
        ? Description?.fromJson(json['description'])
        : null;
    images = json['images'] != null ? Images?.fromJson(json['images']) : null;
    maxPriceCurrency = json['max_price_currency'];
    maxPrice = json['max_price'];
    trackInventory = json['track_inventory'];
    isInWishList = json['is_in_wishlist'];
    weight = json['weight'];
    length = json['length'];
    height = json['height'];
    width = json['width'];
    slug = json['slug'];
    product = json['product'];
    isCodAccepted = json['is_cod_accepted'];
    isStockAvailable = json['is_stock_available'];
  }

  int getTotalPrice() {
    int totalPrice = 0;
    totalPrice =
        (double.parse(getStock()?.price ?? '0') * (int.parse(quantity ?? "1")))
            .toInt();
    return totalPrice;
  }

  int getTotalMrp() {
    int totalMrp = 0;
    totalMrp =
        (double.parse(maxPrice ?? '0') * (int.parse(quantity ?? "1"))).toInt();
    return totalMrp;
  }

  int getTotalDiscount() {
    return getTotalMrp() - getTotalPrice();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    if (stocks != null) {
      data['stocks'] = stocks?.map((v) => v.toJson()).toList();
    }
    if (manufacturerDetails != null) {
      data['manufacturer_detail'] = manufacturerDetails?.toJson();
    }
    if (attributes != null) {
      data['attributes'] = attributes?.map((v) => v.toJson()).toList();
    }
    if (privateMetadata != null) {
      data['private_metadata'] = privateMetadata;
    }
    data['sort_order'] = sortOrder;
    data['name'] = name;
    data['product_slug'] = productSlug;
    if (description != null) {
      data['description'] = description?.toJson();
    }
    if (images != null) {
      data['images'] = images?.toJson();
    }
    data['max_price_currency'] = maxPriceCurrency;
    data['max_price'] = maxPrice;
    data['track_inventory'] = trackInventory;
    data['is_in_wishlist'] = isInWishList;
    data['weight'] = weight;
    data['length'] = length;
    data['height'] = height;
    data['width'] = width;
    data['slug'] = slug;
    data['product'] = product;
    data['is_stock_available'] = isStockAvailable;
    data['is_cod_accepted'] = isCodAccepted;
    return data;
  }
}

class ManufacturerDetails {
  String? manufacturerDetails;
  String? packerDetails;
  String? importerDetails;

  ManufacturerDetails(
      {this.manufacturerDetails, this.packerDetails, this.importerDetails});

  ManufacturerDetails.fromJson(Map<String, dynamic> json) {
    if (json['manufacturer_details'] != null) {
      manufacturerDetails = json['manufacturer_details'];
    }
    if (json['packer_details'] != null) {
      packerDetails = json['packer_details'];
    }
    if (json['importer_details'] != null) {
      importerDetails = json['importer_details'];
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (manufacturerDetails != null) {
      data['manufacturer_details'] = manufacturerDetails;
    }
    if (packerDetails != null) {
      data['packer_details'] = packerDetails;
    }
    if (importerDetails != null) {
      data['importer_details'] = importerDetails;
    }
    return data;
  }
}

class Company {
  String? name;
  String? slug;
  String? logo;

  Company({this.slug, this.name, this.logo});

  Company.fromJson(Map<String, dynamic> json) {
    if (json['name'] != null) {
      name = json['name'];
    }
    if (json['slug'] != null) {
      slug = json['slug'];
    }
    if (json['logo'] != null) {
      logo = json['logo'];
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (name != null) {
      data['name'] = name;
    }
    if (slug != null) {
      data['slug'] = slug;
    }
    if (logo != null) {
      data['logo'] = logo;
    }
    return data;
  }
}

class Stock {
  int? id;
  Company? company;
  String? sku;
  int? quantity;
  String? price;
  String? specialIncentive;
  double? lowestPrice;
  double? lowestPriceWithCoins;
  double? discount;
  double? discountWithCoins;
  bool? isCodAccepted;

  Stock(
      {this.id,
        this.company,
        this.sku,
        this.quantity,
        this.price,
        this.specialIncentive,
        this.lowestPrice,
        this.lowestPriceWithCoins,
        this.discount,
        this.discountWithCoins,
        this.isCodAccepted,
      });

  Stock.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company = json['company'] != null
        ? Company?.fromJson(json['company'])
        : null;

    lowestPrice = ensureDouble(json["lowest_price"]);
    sku = json['sku'];
    quantity = json['quantity'];
    price = json['price'];
    specialIncentive = json['special_incentive'];
    lowestPriceWithCoins = json['lowest_price_with_coins'];
    discount = json['discount'];
    discountWithCoins = json['discount_with_coins'];
    isCodAccepted = json['is_cod_accepted'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    if (company != null) {
      data['company'] = company?.toJson();
    }
    data['lowest_price'] = lowestPrice;
    data['sku'] = sku;
    data['quantity'] = quantity;
    data['price'] = price;
    data['special_incentive'] = specialIncentive;
    data['lowest_price_with_coins'] = lowestPriceWithCoins;
    data['discount'] = discount;
    data['discount_with_coins'] = discountWithCoins;
    data['is_cod_accepted'] = isCodAccepted;
    return data;
  }
}

class Metadata {
  String? data;
  Map<String, dynamic>? razorpay;
  String? shortLinkQrCode;

  Metadata({this.data, this.razorpay, this.shortLinkQrCode});

  Metadata.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    razorpay = json['razorpay'];
    shortLinkQrCode = json['short_link_qr_code'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['short_link_qr_code'] = shortLinkQrCode;
    return data;
  }
}

class Specification {
  Specification({
    this.field,
    this.value,
  });

  String? field;
  String? value;

  factory Specification.fromJson(Map<String, dynamic> json) =>
      Specification(field: json['field'], value: json['value']);
}

class PlansCommission {
  PlansCommission({
    this.name,
    this.commissionAmount,
    this.currentPlan,
  });

  String? name;
  String? commissionAmount;
  bool? currentPlan;

  factory PlansCommission.fromJson(Map<String, dynamic> json) =>
      PlansCommission(
          name: json['name'],
          commissionAmount: json['commission_amount'],
          currentPlan: json['current_plan']);

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['commission_amount'] = commissionAmount;
    data['current_plan'] = currentPlan;
    return data;
  }
}

class Description {
  String? long;
  dynamic short;
  List<Specification>? specifications;

  Description({this.long, this.short, this.specifications});

  Description.fromJson(Map<String, dynamic> json) {
    long = json['long'];
    short = json['short'];
    specifications = json['specifications'] == null
        ? null
        : List<Specification>.from(
        json['specifications']?.map((e) => Specification.fromJson(e)))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['long'] = long;
    data['short'] = short;
    return data;
  }
}

class Analytics {
  int? app;
  int? web;
  int? total;
  int? unknown;

  Analytics({this.app, this.web, this.total, this.unknown});

  Analytics.fromJson(Map<String, dynamic> json) {
    app = json['app'];
    web = json['web'];
    total = json['total'];
    unknown = json['unknown'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['app'] = app;
    data['web'] = web;
    data['total'] = total;
    data['unknown'] = unknown;
    return data;
  }
}
