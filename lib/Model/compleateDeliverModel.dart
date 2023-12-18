
class CompleateHistryModel {
  bool error;
  String message;
  List<CompleateDeliver> data;

  CompleateHistryModel({
    required this.error,
    required this.message,
    required this.data,
  });

  factory CompleateHistryModel.fromJson(Map<String, dynamic> json) => CompleateHistryModel(
    error: json["error"],
    message: json["message"],
    data: List<CompleateDeliver>.from(json["data"].map((x) => CompleateDeliver.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CompleateDeliver {
  String? id;
  String ?customer;
  String? userId;
  String? pickupAddress;
  String? dropAddress;
  String? surgeAmount;
  String? paidAmount;
  String? bookingType;
  String?status;
  String? cabType;
  String? reason;
  String ?deliveryBoyId;
  String? productId;
  String ?qty;
  String ?price;
  String ?otp;
  String ?emaill;
  String ?mobilee;
  DateTime? createdAt;

  CompleateDeliver({
   this.id,
   this.customer,
   this.userId,
   this.pickupAddress,
   this.dropAddress,
   this.surgeAmount,
   this.paidAmount,
   this.bookingType,
   this.status,
   this.cabType,
   this.reason,
   this.deliveryBoyId,
   this.productId,
   this.qty,
   this.price,
   this.otp,
   this.emaill,
   this.mobilee,
   this.createdAt,
  });

  factory CompleateDeliver.fromJson(Map<String, dynamic> json) => CompleateDeliver(
    id: json["id"].toString(),
    customer: json["customer"].toString(),
    userId: json["user_id"].toString(),
    pickupAddress: json["pickup_Address"].toString(),
    dropAddress: json["drop_address"].toString(),
    surgeAmount: json["surge_Amount"].toString(),
    paidAmount: json["paid_amount"].toString(),
    bookingType: json["booking_type"].toString(),
    status: json["status"].toString(),
    cabType: json["cab_type"].toString(),
    reason: json["reason"].toString(),
    deliveryBoyId: json["delivery_boy_id"].toString(),
    productId: json["product_id"].toString(),
    qty: json["qty"].toString(),
    price: json["price"].toString(),
    otp: json["otp"].toString(),
    emaill: json["email"].toString(),
    mobilee: json["mobile"].toString(),
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer": customer,
    "user_id": userId,
    "pickup_Address": pickupAddress,
    "drop_address": dropAddress,
    "surge_Amount": surgeAmount,
    "paid_amount": paidAmount,
    "booking_type": bookingType,
    "status": status,
    "cab_type": cabType,
    "reason": reason,
    "delivery_boy_id": deliveryBoyId,
    "product_id": productId,
    "qty": qty,
    "price": price,
    "otp": otp,
    "email": emaill,
    "mobile": mobilee,
    "created_at": createdAt,
  };
}
