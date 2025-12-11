

class ProductListingModel {
    List<Cart>? carts;
    int? total;
    int? skip;
    int? limit;

    ProductListingModel({
        this.carts,
        this.total,
        this.skip,
        this.limit,
    });

    ProductListingModel copyWith({
        List<Cart>? carts,
        int? total,
        int? skip,
        int? limit,
    }) => 
        ProductListingModel(
            carts: carts ?? this.carts,
            total: total ?? this.total,
            skip: skip ?? this.skip,
            limit: limit ?? this.limit,
        );

    factory ProductListingModel.fromJson(Map<String, dynamic> json) => ProductListingModel(
        carts: json["carts"] == null ? [] : List<Cart>.from(json["carts"]!.map((x) => Cart.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
    );

    Map<String, dynamic> toJson() => {
        "carts": carts == null ? [] : List<dynamic>.from(carts!.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
    };
}

class Cart {
    int? id;
    List<Product>? products;
    double? total;
    double? discountedTotal;
    int? userId;
    int? totalProducts;
    int? totalQuantity;

    Cart({
        this.id,
        this.products,
        this.total,
        this.discountedTotal,
        this.userId,
        this.totalProducts,
        this.totalQuantity,
    });

    Cart copyWith({
        int? id,
        List<Product>? products,
        double? total,
        double? discountedTotal,
        int? userId,
        int? totalProducts,
        int? totalQuantity,
    }) => 
        Cart(
            id: id ?? this.id,
            products: products ?? this.products,
            total: total ?? this.total,
            discountedTotal: discountedTotal ?? this.discountedTotal,
            userId: userId ?? this.userId,
            totalProducts: totalProducts ?? this.totalProducts,
            totalQuantity: totalQuantity ?? this.totalQuantity,
        );

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
        total: json["total"]?.toDouble(),
        discountedTotal: json["discountedTotal"]?.toDouble(),
        userId: json["userId"],
        totalProducts: json["totalProducts"],
        totalQuantity: json["totalQuantity"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x.toJson())),
        "total": total,
        "discountedTotal": discountedTotal,
        "userId": userId,
        "totalProducts": totalProducts,
        "totalQuantity": totalQuantity,
    };
}

class Product {
    int? id;
    String? title;
    double? price;
    int? quantity;
    double? total;
    double? discountPercentage;
    double? discountedTotal;
    String? thumbnail;

    Product({
        this.id,
        this.title,
        this.price,
        this.quantity,
        this.total,
        this.discountPercentage,
        this.discountedTotal,
        this.thumbnail,
    });

    Product copyWith({
        int? id,
        String? title,
        double? price,
        int? quantity,
        double? total,
        double? discountPercentage,
        double? discountedTotal,
        String? thumbnail,
    }) => 
        Product(
            id: id ?? this.id,
            title: title ?? this.title,
            price: price ?? this.price,
            quantity: quantity ?? this.quantity,
            total: total ?? this.total,
            discountPercentage: discountPercentage ?? this.discountPercentage,
            discountedTotal: discountedTotal ?? this.discountedTotal,
            thumbnail: thumbnail ?? this.thumbnail,
        );

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        price: json["price"]?.toDouble(),
        quantity: json["quantity"],
        total: json["total"]?.toDouble(),
        discountPercentage: json["discountPercentage"]?.toDouble(),
        discountedTotal: json["discountedTotal"]?.toDouble(),
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "quantity": quantity,
        "total": total,
        "discountPercentage": discountPercentage,
        "discountedTotal": discountedTotal,
        "thumbnail": thumbnail,
    };
}
