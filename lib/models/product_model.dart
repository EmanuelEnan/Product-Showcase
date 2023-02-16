class ProductModel {
  ProductModel({
    required this.status,
    required this.data,
  });
  late final String status;
  late final Data data;

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['data'] = this.data.toJson();
    return data;
  }
}

class Data {
  Data({
    required this.categories,
    required this.products,
  });
  late final List<dynamic> categories;
  late final Products products;

  Data.fromJson(Map<String, dynamic> json) {
    categories = List.castFrom<dynamic, dynamic>(json['categories']);
    products = Products.fromJson(json['products']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['categories'] = categories;
    data['products'] = products.toJson();
    return data;
  }
}

class Products {
  Products({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });
  late final int count;
  late final String next;
  late final String previous;
  late final List<Results> results;

  Products.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    results =
        List.from(json['results']).map((e) => Results.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    data['results'] = results.map((e) => e.toJson()).toList();
    return data;
  }
}

class Results {
  Results({
    required this.id,
    required this.brand,
    required this.image,
    required this.charge,
    required this.images,
    required this.slug,
    required this.productName,
    required this.model,
    required this.commissionType,
    required this.amount,
    required this.tag,
    required this.description,
    required this.note,
    required this.embaddedVideoLink,
    required this.maximumOrder,
    required this.stock,
    required this.isBackOrder,
    required this.specification,
    required this.warranty,
    required this.preOrder,
    required this.productReview,
    required this.isSeller,
    required this.isPhone,
    required this.willShowEmi,
    this.badge,
    required this.isActive,
    required this.sackEquivalent,
    required this.createdAt,
    required this.updatedAt,
    this.language,
    required this.seller,
    this.combo,
    required this.createdBy,
    this.updatedBy,
    required this.category,
    required this.relatedProduct,
    required this.filterValue,
    required this.distributors,
  });
  late final int id;
  late final Brand brand;
  late final String image;
  late final Charge charge;
  late final List<Images> images;
  late final String slug;
  late final String productName;
  late final String model;
  late final String commissionType;
  late final String amount;
  late final String tag;
  late final String description;
  late final String note;
  late final String embaddedVideoLink;
  late final int maximumOrder;
  late final int stock;
  late final bool isBackOrder;
  late final String specification;
  late final String warranty;
  late final bool preOrder;
  late final int productReview;
  late final bool isSeller;
  late final bool isPhone;
  late final bool willShowEmi;
  late final Null badge;
  late final bool isActive;
  late final String sackEquivalent;
  late final String createdAt;
  late final String updatedAt;
  late final Null language;
  late final String seller;
  late final Null combo;
  late final String createdBy;
  late final Null updatedBy;
  late final List<int> category;
  late final List<dynamic> relatedProduct;
  late final List<dynamic> filterValue;
  late final List<dynamic> distributors;

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = Brand.fromJson(json['brand']);
    image = json['image'];
    charge = Charge.fromJson(json['charge']);
    images = List.from(json['images']).map((e) => Images.fromJson(e)).toList();
    slug = json['slug'];
    productName = json['product_name'];
    model = json['model'];
    commissionType = json['commission_type'];
    amount = json['amount'];
    tag = json['tag'];
    description = json['description'];
    note = json['note'];
    embaddedVideoLink = json['embadded_video_link'];
    maximumOrder = json['maximum_order'];
    stock = json['stock'];
    isBackOrder = json['is_back_order'];
    specification = json['specification'];
    warranty = json['warranty'];
    preOrder = json['pre_order'];
    productReview = json['product_review'];
    isSeller = json['is_seller'];
    isPhone = json['is_phone'];
    willShowEmi = json['will_show_emi'];
    badge = null;
    isActive = json['is_active'];
    sackEquivalent = json['sack_equivalent'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    language = null;
    seller = json['seller'];
    combo = null;
    createdBy = json['created_by'];
    updatedBy = null;
    category = List.castFrom<dynamic, int>(json['category']);
    relatedProduct = List.castFrom<dynamic, dynamic>(json['related_product']);
    filterValue = List.castFrom<dynamic, dynamic>(json['filter_value']);
    distributors = List.castFrom<dynamic, dynamic>(json['distributors']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['brand'] = brand.toJson();
    data['image'] = image;
    data['charge'] = charge.toJson();
    data['images'] = images.map((e) => e.toJson()).toList();
    data['slug'] = slug;
    data['product_name'] = productName;
    data['model'] = model;
    data['commission_type'] = commissionType;
    data['amount'] = amount;
    data['tag'] = tag;
    data['description'] = description;
    data['note'] = note;
    data['embadded_video_link'] = embaddedVideoLink;
    data['maximum_order'] = maximumOrder;
    data['stock'] = stock;
    data['is_back_order'] = isBackOrder;
    data['specification'] = specification;
    data['warranty'] = warranty;
    data['pre_order'] = preOrder;
    data['product_review'] = productReview;
    data['is_seller'] = isSeller;
    data['is_phone'] = isPhone;
    data['will_show_emi'] = willShowEmi;
    data['badge'] = badge;
    data['is_active'] = isActive;
    data['sack_equivalent'] = sackEquivalent;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['language'] = language;
    data['seller'] = seller;
    data['combo'] = combo;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['category'] = category;
    data['related_product'] = relatedProduct;
    data['filter_value'] = filterValue;
    data['distributors'] = distributors;
    return data;
  }
}

class Brand {
  Brand({
    required this.name,
    required this.image,
    this.headerImage,
    required this.slug,
  });
  late final String name;
  late final String image;
  late final Null headerImage;
  late final String slug;

  Brand.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    headerImage = null;
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['image'] = image;
    data['header_image'] = headerImage;
    data['slug'] = slug;
    return data;
  }
}

class Charge {
  Charge({
    required this.bookingPrice,
    required this.currentCharge,
    this.discountCharge,
    required this.sellingPrice,
    required this.profit,
    required this.isEvent,
    this.eventId,
    required this.highlight,
    this.highlightId,
    required this.groupping,
    this.grouppingId,
    this.campaignSectionId,
    required this.campaignSection,
    this.message,
  });
  late final int bookingPrice;
  late final int currentCharge;
  late final Null discountCharge;
  late final int sellingPrice;
  late final int profit;
  late final bool isEvent;
  late final Null eventId;
  late final bool highlight;
  late final Null highlightId;
  late final bool groupping;
  late final Null grouppingId;
  late final Null campaignSectionId;
  late final bool campaignSection;
  late final Null message;

  Charge.fromJson(Map<String, dynamic> json) {
    bookingPrice = json['booking_price'];
    currentCharge = json['current_charge'];
    discountCharge = null;
    sellingPrice = json['selling_price'];
    profit = json['profit'];
    isEvent = json['is_event'];
    eventId = null;
    highlight = json['highlight'];
    highlightId = null;
    groupping = json['groupping'];
    grouppingId = null;
    campaignSectionId = null;
    campaignSection = json['campaign_section'];
    message = null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['booking_price'] = bookingPrice;
    data['current_charge'] = currentCharge;
    data['discount_charge'] = discountCharge;
    data['selling_price'] = sellingPrice;
    data['profit'] = profit;
    data['is_event'] = isEvent;
    data['event_id'] = eventId;
    data['highlight'] = highlight;
    data['highlight_id'] = highlightId;
    data['groupping'] = groupping;
    data['groupping_id'] = grouppingId;
    data['campaign_section_id'] = campaignSectionId;
    data['campaign_section'] = campaignSection;
    data['message'] = message;
    return data;
  }
}

class Images {
  Images({
    required this.id,
    required this.image,
    required this.isPrimary,
    required this.product,
  });
  late final int id;
  late final String image;
  late final bool isPrimary;
  late final int product;

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    isPrimary = json['is_primary'];
    product = json['product'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['is_primary'] = isPrimary;
    data['product'] = product;
    return data;
  }
}
