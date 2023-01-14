// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_order_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BookOrderRecord> _$bookOrderRecordSerializer =
    new _$BookOrderRecordSerializer();

class _$BookOrderRecordSerializer
    implements StructuredSerializer<BookOrderRecord> {
  @override
  final Iterable<Type> types = const [BookOrderRecord, _$BookOrderRecord];
  @override
  final String wireName = 'BookOrderRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, BookOrderRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.senderName;
    if (value != null) {
      result
        ..add('sender_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.senderEmail;
    if (value != null) {
      result
        ..add('sender_email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.senderPhone;
    if (value != null) {
      result
        ..add('sender_phone')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.senderAddress;
    if (value != null) {
      result
        ..add('sender_address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.senderLocation;
    if (value != null) {
      result
        ..add('sender_location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.senderLandmark;
    if (value != null) {
      result
        ..add('sender_landmark')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.receiverName;
    if (value != null) {
      result
        ..add('receiver_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.receiverEmail;
    if (value != null) {
      result
        ..add('receiver_email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.receiverPhone;
    if (value != null) {
      result
        ..add('receiver_phone')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.receiverAddress;
    if (value != null) {
      result
        ..add('receiver_address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.receiverLocation;
    if (value != null) {
      result
        ..add('receiver_location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.receiverLandmark;
    if (value != null) {
      result
        ..add('receiver_landmark')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.orderTimestamp;
    if (value != null) {
      result
        ..add('order_timestamp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.orderMileageCost;
    if (value != null) {
      result
        ..add('order_mileage_cost')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.foodCategory;
    if (value != null) {
      result
        ..add('food_category')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.clothingCategory;
    if (value != null) {
      result
        ..add('clothing_category')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.shoesCategory;
    if (value != null) {
      result
        ..add('shoes_category')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.electronicsCategory;
    if (value != null) {
      result
        ..add('electronics_category')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.jewaccessCategory;
    if (value != null) {
      result
        ..add('jewaccess_category')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.documentsCategory;
    if (value != null) {
      result
        ..add('documents_category')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.otherCategory;
    if (value != null) {
      result
        ..add('other_category')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.orderId;
    if (value != null) {
      result
        ..add('order_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bookerId;
    if (value != null) {
      result
        ..add('booker_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.orderStatus;
    if (value != null) {
      result
        ..add('order_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reportOrderStatus;
    if (value != null) {
      result
        ..add('report_order_status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reportOrderDescription;
    if (value != null) {
      result
        ..add('report_order_description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reportOrderActive;
    if (value != null) {
      result
        ..add('report_order_active')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.riderName;
    if (value != null) {
      result
        ..add('riderName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isRiderAssigned;
    if (value != null) {
      result
        ..add('is_rider_assigned')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.riderLocation;
    if (value != null) {
      result
        ..add('rider_location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.riderPic;
    if (value != null) {
      result
        ..add('rider_pic')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.riderId;
    if (value != null) {
      result
        ..add('rider_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.riderPhone;
    if (value != null) {
      result
        ..add('rider_phone')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bookingDate;
    if (value != null) {
      result
        ..add('booking_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.itemCat;
    if (value != null) {
      result
        ..add('item_cat')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  BookOrderRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BookOrderRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'sender_name':
          result.senderName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sender_email':
          result.senderEmail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sender_phone':
          result.senderPhone = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'sender_address':
          result.senderAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'sender_location':
          result.senderLocation = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'sender_landmark':
          result.senderLandmark = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'receiver_name':
          result.receiverName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'receiver_email':
          result.receiverEmail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'receiver_phone':
          result.receiverPhone = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'receiver_address':
          result.receiverAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'receiver_location':
          result.receiverLocation = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'receiver_landmark':
          result.receiverLandmark = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'order_timestamp':
          result.orderTimestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'order_mileage_cost':
          result.orderMileageCost = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'food_category':
          result.foodCategory = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'clothing_category':
          result.clothingCategory = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'shoes_category':
          result.shoesCategory = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'electronics_category':
          result.electronicsCategory = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'jewaccess_category':
          result.jewaccessCategory = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'documents_category':
          result.documentsCategory = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'other_category':
          result.otherCategory = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'order_id':
          result.orderId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'booker_id':
          result.bookerId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'order_status':
          result.orderStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'report_order_status':
          result.reportOrderStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'report_order_description':
          result.reportOrderDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'report_order_active':
          result.reportOrderActive = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'riderName':
          result.riderName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_rider_assigned':
          result.isRiderAssigned = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'rider_location':
          result.riderLocation = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng?;
          break;
        case 'rider_pic':
          result.riderPic = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rider_id':
          result.riderId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rider_phone':
          result.riderPhone = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'booking_date':
          result.bookingDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'item_cat':
          result.itemCat = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$BookOrderRecord extends BookOrderRecord {
  @override
  final String? senderName;
  @override
  final String? senderEmail;
  @override
  final int? senderPhone;
  @override
  final String? senderAddress;
  @override
  final LatLng? senderLocation;
  @override
  final String? senderLandmark;
  @override
  final String? receiverName;
  @override
  final String? receiverEmail;
  @override
  final int? receiverPhone;
  @override
  final String? receiverAddress;
  @override
  final LatLng? receiverLocation;
  @override
  final String? receiverLandmark;
  @override
  final DateTime? orderTimestamp;
  @override
  final double? orderMileageCost;
  @override
  final bool? foodCategory;
  @override
  final bool? clothingCategory;
  @override
  final bool? shoesCategory;
  @override
  final bool? electronicsCategory;
  @override
  final bool? jewaccessCategory;
  @override
  final bool? documentsCategory;
  @override
  final bool? otherCategory;
  @override
  final String? orderId;
  @override
  final String? bookerId;
  @override
  final String? orderStatus;
  @override
  final String? reportOrderStatus;
  @override
  final String? reportOrderDescription;
  @override
  final bool? reportOrderActive;
  @override
  final String? riderName;
  @override
  final bool? isRiderAssigned;
  @override
  final LatLng? riderLocation;
  @override
  final String? riderPic;
  @override
  final String? riderId;
  @override
  final String? riderPhone;
  @override
  final DateTime? bookingDate;
  @override
  final String? itemCat;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$BookOrderRecord([void Function(BookOrderRecordBuilder)? updates]) =>
      (new BookOrderRecordBuilder()..update(updates))._build();

  _$BookOrderRecord._(
      {this.senderName,
      this.senderEmail,
      this.senderPhone,
      this.senderAddress,
      this.senderLocation,
      this.senderLandmark,
      this.receiverName,
      this.receiverEmail,
      this.receiverPhone,
      this.receiverAddress,
      this.receiverLocation,
      this.receiverLandmark,
      this.orderTimestamp,
      this.orderMileageCost,
      this.foodCategory,
      this.clothingCategory,
      this.shoesCategory,
      this.electronicsCategory,
      this.jewaccessCategory,
      this.documentsCategory,
      this.otherCategory,
      this.orderId,
      this.bookerId,
      this.orderStatus,
      this.reportOrderStatus,
      this.reportOrderDescription,
      this.reportOrderActive,
      this.riderName,
      this.isRiderAssigned,
      this.riderLocation,
      this.riderPic,
      this.riderId,
      this.riderPhone,
      this.bookingDate,
      this.itemCat,
      this.ffRef})
      : super._();

  @override
  BookOrderRecord rebuild(void Function(BookOrderRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BookOrderRecordBuilder toBuilder() =>
      new BookOrderRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BookOrderRecord &&
        senderName == other.senderName &&
        senderEmail == other.senderEmail &&
        senderPhone == other.senderPhone &&
        senderAddress == other.senderAddress &&
        senderLocation == other.senderLocation &&
        senderLandmark == other.senderLandmark &&
        receiverName == other.receiverName &&
        receiverEmail == other.receiverEmail &&
        receiverPhone == other.receiverPhone &&
        receiverAddress == other.receiverAddress &&
        receiverLocation == other.receiverLocation &&
        receiverLandmark == other.receiverLandmark &&
        orderTimestamp == other.orderTimestamp &&
        orderMileageCost == other.orderMileageCost &&
        foodCategory == other.foodCategory &&
        clothingCategory == other.clothingCategory &&
        shoesCategory == other.shoesCategory &&
        electronicsCategory == other.electronicsCategory &&
        jewaccessCategory == other.jewaccessCategory &&
        documentsCategory == other.documentsCategory &&
        otherCategory == other.otherCategory &&
        orderId == other.orderId &&
        bookerId == other.bookerId &&
        orderStatus == other.orderStatus &&
        reportOrderStatus == other.reportOrderStatus &&
        reportOrderDescription == other.reportOrderDescription &&
        reportOrderActive == other.reportOrderActive &&
        riderName == other.riderName &&
        isRiderAssigned == other.isRiderAssigned &&
        riderLocation == other.riderLocation &&
        riderPic == other.riderPic &&
        riderId == other.riderId &&
        riderPhone == other.riderPhone &&
        bookingDate == other.bookingDate &&
        itemCat == other.itemCat &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, senderName.hashCode), senderEmail.hashCode), senderPhone.hashCode), senderAddress.hashCode), senderLocation.hashCode), senderLandmark.hashCode), receiverName.hashCode), receiverEmail.hashCode), receiverPhone.hashCode), receiverAddress.hashCode), receiverLocation.hashCode), receiverLandmark.hashCode), orderTimestamp.hashCode), orderMileageCost.hashCode), foodCategory.hashCode), clothingCategory.hashCode), shoesCategory.hashCode),
                                                                                electronicsCategory.hashCode),
                                                                            jewaccessCategory.hashCode),
                                                                        documentsCategory.hashCode),
                                                                    otherCategory.hashCode),
                                                                orderId.hashCode),
                                                            bookerId.hashCode),
                                                        orderStatus.hashCode),
                                                    reportOrderStatus.hashCode),
                                                reportOrderDescription.hashCode),
                                            reportOrderActive.hashCode),
                                        riderName.hashCode),
                                    isRiderAssigned.hashCode),
                                riderLocation.hashCode),
                            riderPic.hashCode),
                        riderId.hashCode),
                    riderPhone.hashCode),
                bookingDate.hashCode),
            itemCat.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BookOrderRecord')
          ..add('senderName', senderName)
          ..add('senderEmail', senderEmail)
          ..add('senderPhone', senderPhone)
          ..add('senderAddress', senderAddress)
          ..add('senderLocation', senderLocation)
          ..add('senderLandmark', senderLandmark)
          ..add('receiverName', receiverName)
          ..add('receiverEmail', receiverEmail)
          ..add('receiverPhone', receiverPhone)
          ..add('receiverAddress', receiverAddress)
          ..add('receiverLocation', receiverLocation)
          ..add('receiverLandmark', receiverLandmark)
          ..add('orderTimestamp', orderTimestamp)
          ..add('orderMileageCost', orderMileageCost)
          ..add('foodCategory', foodCategory)
          ..add('clothingCategory', clothingCategory)
          ..add('shoesCategory', shoesCategory)
          ..add('electronicsCategory', electronicsCategory)
          ..add('jewaccessCategory', jewaccessCategory)
          ..add('documentsCategory', documentsCategory)
          ..add('otherCategory', otherCategory)
          ..add('orderId', orderId)
          ..add('bookerId', bookerId)
          ..add('orderStatus', orderStatus)
          ..add('reportOrderStatus', reportOrderStatus)
          ..add('reportOrderDescription', reportOrderDescription)
          ..add('reportOrderActive', reportOrderActive)
          ..add('riderName', riderName)
          ..add('isRiderAssigned', isRiderAssigned)
          ..add('riderLocation', riderLocation)
          ..add('riderPic', riderPic)
          ..add('riderId', riderId)
          ..add('riderPhone', riderPhone)
          ..add('bookingDate', bookingDate)
          ..add('itemCat', itemCat)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class BookOrderRecordBuilder
    implements Builder<BookOrderRecord, BookOrderRecordBuilder> {
  _$BookOrderRecord? _$v;

  String? _senderName;
  String? get senderName => _$this._senderName;
  set senderName(String? senderName) => _$this._senderName = senderName;

  String? _senderEmail;
  String? get senderEmail => _$this._senderEmail;
  set senderEmail(String? senderEmail) => _$this._senderEmail = senderEmail;

  int? _senderPhone;
  int? get senderPhone => _$this._senderPhone;
  set senderPhone(int? senderPhone) => _$this._senderPhone = senderPhone;

  String? _senderAddress;
  String? get senderAddress => _$this._senderAddress;
  set senderAddress(String? senderAddress) =>
      _$this._senderAddress = senderAddress;

  LatLng? _senderLocation;
  LatLng? get senderLocation => _$this._senderLocation;
  set senderLocation(LatLng? senderLocation) =>
      _$this._senderLocation = senderLocation;

  String? _senderLandmark;
  String? get senderLandmark => _$this._senderLandmark;
  set senderLandmark(String? senderLandmark) =>
      _$this._senderLandmark = senderLandmark;

  String? _receiverName;
  String? get receiverName => _$this._receiverName;
  set receiverName(String? receiverName) => _$this._receiverName = receiverName;

  String? _receiverEmail;
  String? get receiverEmail => _$this._receiverEmail;
  set receiverEmail(String? receiverEmail) =>
      _$this._receiverEmail = receiverEmail;

  int? _receiverPhone;
  int? get receiverPhone => _$this._receiverPhone;
  set receiverPhone(int? receiverPhone) =>
      _$this._receiverPhone = receiverPhone;

  String? _receiverAddress;
  String? get receiverAddress => _$this._receiverAddress;
  set receiverAddress(String? receiverAddress) =>
      _$this._receiverAddress = receiverAddress;

  LatLng? _receiverLocation;
  LatLng? get receiverLocation => _$this._receiverLocation;
  set receiverLocation(LatLng? receiverLocation) =>
      _$this._receiverLocation = receiverLocation;

  String? _receiverLandmark;
  String? get receiverLandmark => _$this._receiverLandmark;
  set receiverLandmark(String? receiverLandmark) =>
      _$this._receiverLandmark = receiverLandmark;

  DateTime? _orderTimestamp;
  DateTime? get orderTimestamp => _$this._orderTimestamp;
  set orderTimestamp(DateTime? orderTimestamp) =>
      _$this._orderTimestamp = orderTimestamp;

  double? _orderMileageCost;
  double? get orderMileageCost => _$this._orderMileageCost;
  set orderMileageCost(double? orderMileageCost) =>
      _$this._orderMileageCost = orderMileageCost;

  bool? _foodCategory;
  bool? get foodCategory => _$this._foodCategory;
  set foodCategory(bool? foodCategory) => _$this._foodCategory = foodCategory;

  bool? _clothingCategory;
  bool? get clothingCategory => _$this._clothingCategory;
  set clothingCategory(bool? clothingCategory) =>
      _$this._clothingCategory = clothingCategory;

  bool? _shoesCategory;
  bool? get shoesCategory => _$this._shoesCategory;
  set shoesCategory(bool? shoesCategory) =>
      _$this._shoesCategory = shoesCategory;

  bool? _electronicsCategory;
  bool? get electronicsCategory => _$this._electronicsCategory;
  set electronicsCategory(bool? electronicsCategory) =>
      _$this._electronicsCategory = electronicsCategory;

  bool? _jewaccessCategory;
  bool? get jewaccessCategory => _$this._jewaccessCategory;
  set jewaccessCategory(bool? jewaccessCategory) =>
      _$this._jewaccessCategory = jewaccessCategory;

  bool? _documentsCategory;
  bool? get documentsCategory => _$this._documentsCategory;
  set documentsCategory(bool? documentsCategory) =>
      _$this._documentsCategory = documentsCategory;

  bool? _otherCategory;
  bool? get otherCategory => _$this._otherCategory;
  set otherCategory(bool? otherCategory) =>
      _$this._otherCategory = otherCategory;

  String? _orderId;
  String? get orderId => _$this._orderId;
  set orderId(String? orderId) => _$this._orderId = orderId;

  String? _bookerId;
  String? get bookerId => _$this._bookerId;
  set bookerId(String? bookerId) => _$this._bookerId = bookerId;

  String? _orderStatus;
  String? get orderStatus => _$this._orderStatus;
  set orderStatus(String? orderStatus) => _$this._orderStatus = orderStatus;

  String? _reportOrderStatus;
  String? get reportOrderStatus => _$this._reportOrderStatus;
  set reportOrderStatus(String? reportOrderStatus) =>
      _$this._reportOrderStatus = reportOrderStatus;

  String? _reportOrderDescription;
  String? get reportOrderDescription => _$this._reportOrderDescription;
  set reportOrderDescription(String? reportOrderDescription) =>
      _$this._reportOrderDescription = reportOrderDescription;

  bool? _reportOrderActive;
  bool? get reportOrderActive => _$this._reportOrderActive;
  set reportOrderActive(bool? reportOrderActive) =>
      _$this._reportOrderActive = reportOrderActive;

  String? _riderName;
  String? get riderName => _$this._riderName;
  set riderName(String? riderName) => _$this._riderName = riderName;

  bool? _isRiderAssigned;
  bool? get isRiderAssigned => _$this._isRiderAssigned;
  set isRiderAssigned(bool? isRiderAssigned) =>
      _$this._isRiderAssigned = isRiderAssigned;

  LatLng? _riderLocation;
  LatLng? get riderLocation => _$this._riderLocation;
  set riderLocation(LatLng? riderLocation) =>
      _$this._riderLocation = riderLocation;

  String? _riderPic;
  String? get riderPic => _$this._riderPic;
  set riderPic(String? riderPic) => _$this._riderPic = riderPic;

  String? _riderId;
  String? get riderId => _$this._riderId;
  set riderId(String? riderId) => _$this._riderId = riderId;

  String? _riderPhone;
  String? get riderPhone => _$this._riderPhone;
  set riderPhone(String? riderPhone) => _$this._riderPhone = riderPhone;

  DateTime? _bookingDate;
  DateTime? get bookingDate => _$this._bookingDate;
  set bookingDate(DateTime? bookingDate) => _$this._bookingDate = bookingDate;

  String? _itemCat;
  String? get itemCat => _$this._itemCat;
  set itemCat(String? itemCat) => _$this._itemCat = itemCat;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  BookOrderRecordBuilder() {
    BookOrderRecord._initializeBuilder(this);
  }

  BookOrderRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _senderName = $v.senderName;
      _senderEmail = $v.senderEmail;
      _senderPhone = $v.senderPhone;
      _senderAddress = $v.senderAddress;
      _senderLocation = $v.senderLocation;
      _senderLandmark = $v.senderLandmark;
      _receiverName = $v.receiverName;
      _receiverEmail = $v.receiverEmail;
      _receiverPhone = $v.receiverPhone;
      _receiverAddress = $v.receiverAddress;
      _receiverLocation = $v.receiverLocation;
      _receiverLandmark = $v.receiverLandmark;
      _orderTimestamp = $v.orderTimestamp;
      _orderMileageCost = $v.orderMileageCost;
      _foodCategory = $v.foodCategory;
      _clothingCategory = $v.clothingCategory;
      _shoesCategory = $v.shoesCategory;
      _electronicsCategory = $v.electronicsCategory;
      _jewaccessCategory = $v.jewaccessCategory;
      _documentsCategory = $v.documentsCategory;
      _otherCategory = $v.otherCategory;
      _orderId = $v.orderId;
      _bookerId = $v.bookerId;
      _orderStatus = $v.orderStatus;
      _reportOrderStatus = $v.reportOrderStatus;
      _reportOrderDescription = $v.reportOrderDescription;
      _reportOrderActive = $v.reportOrderActive;
      _riderName = $v.riderName;
      _isRiderAssigned = $v.isRiderAssigned;
      _riderLocation = $v.riderLocation;
      _riderPic = $v.riderPic;
      _riderId = $v.riderId;
      _riderPhone = $v.riderPhone;
      _bookingDate = $v.bookingDate;
      _itemCat = $v.itemCat;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BookOrderRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BookOrderRecord;
  }

  @override
  void update(void Function(BookOrderRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BookOrderRecord build() => _build();

  _$BookOrderRecord _build() {
    final _$result = _$v ??
        new _$BookOrderRecord._(
            senderName: senderName,
            senderEmail: senderEmail,
            senderPhone: senderPhone,
            senderAddress: senderAddress,
            senderLocation: senderLocation,
            senderLandmark: senderLandmark,
            receiverName: receiverName,
            receiverEmail: receiverEmail,
            receiverPhone: receiverPhone,
            receiverAddress: receiverAddress,
            receiverLocation: receiverLocation,
            receiverLandmark: receiverLandmark,
            orderTimestamp: orderTimestamp,
            orderMileageCost: orderMileageCost,
            foodCategory: foodCategory,
            clothingCategory: clothingCategory,
            shoesCategory: shoesCategory,
            electronicsCategory: electronicsCategory,
            jewaccessCategory: jewaccessCategory,
            documentsCategory: documentsCategory,
            otherCategory: otherCategory,
            orderId: orderId,
            bookerId: bookerId,
            orderStatus: orderStatus,
            reportOrderStatus: reportOrderStatus,
            reportOrderDescription: reportOrderDescription,
            reportOrderActive: reportOrderActive,
            riderName: riderName,
            isRiderAssigned: isRiderAssigned,
            riderLocation: riderLocation,
            riderPic: riderPic,
            riderId: riderId,
            riderPhone: riderPhone,
            bookingDate: bookingDate,
            itemCat: itemCat,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
