import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'book_order_record.g.dart';

abstract class BookOrderRecord
    implements Built<BookOrderRecord, BookOrderRecordBuilder> {
  static Serializer<BookOrderRecord> get serializer =>
      _$bookOrderRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'sender_name')
  String get senderName;

  @nullable
  @BuiltValueField(wireName: 'sender_email')
  String get senderEmail;

  @nullable
  @BuiltValueField(wireName: 'sender_phone')
  int get senderPhone;

  @nullable
  @BuiltValueField(wireName: 'sender_address')
  String get senderAddress;

  @nullable
  @BuiltValueField(wireName: 'sender_location')
  LatLng get senderLocation;

  @nullable
  @BuiltValueField(wireName: 'sender_landmark')
  String get senderLandmark;

  @nullable
  @BuiltValueField(wireName: 'sender_direction')
  String get senderDirection;

  @nullable
  @BuiltValueField(wireName: 'receiver_name')
  String get receiverName;

  @nullable
  @BuiltValueField(wireName: 'receiver_email')
  String get receiverEmail;

  @nullable
  @BuiltValueField(wireName: 'receiver_phone')
  int get receiverPhone;

  @nullable
  @BuiltValueField(wireName: 'receiver_address')
  String get receiverAddress;

  @nullable
  @BuiltValueField(wireName: 'receiver_location')
  LatLng get receiverLocation;

  @nullable
  @BuiltValueField(wireName: 'receiver_landmark')
  String get receiverLandmark;

  @nullable
  @BuiltValueField(wireName: 'receiver_direction')
  String get receiverDirection;

  @nullable
  @BuiltValueField(wireName: 'order_timestamp')
  DateTime get orderTimestamp;

  @nullable
  @BuiltValueField(wireName: 'order_mileage_cost')
  double get orderMileageCost;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BookOrderRecordBuilder builder) => builder
    ..senderName = ''
    ..senderEmail = ''
    ..senderPhone = 0
    ..senderAddress = ''
    ..senderLandmark = ''
    ..senderDirection = ''
    ..receiverName = ''
    ..receiverEmail = ''
    ..receiverPhone = 0
    ..receiverAddress = ''
    ..receiverLandmark = ''
    ..receiverDirection = ''
    ..orderMileageCost = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bookOrder');

  static Stream<BookOrderRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BookOrderRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  BookOrderRecord._();
  factory BookOrderRecord([void Function(BookOrderRecordBuilder) updates]) =
      _$BookOrderRecord;

  static BookOrderRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBookOrderRecordData({
  String senderName,
  String senderEmail,
  int senderPhone,
  String senderAddress,
  LatLng senderLocation,
  String senderLandmark,
  String senderDirection,
  String receiverName,
  String receiverEmail,
  int receiverPhone,
  String receiverAddress,
  LatLng receiverLocation,
  String receiverLandmark,
  String receiverDirection,
  DateTime orderTimestamp,
  double orderMileageCost,
}) =>
    serializers.toFirestore(
        BookOrderRecord.serializer,
        BookOrderRecord((b) => b
          ..senderName = senderName
          ..senderEmail = senderEmail
          ..senderPhone = senderPhone
          ..senderAddress = senderAddress
          ..senderLocation = senderLocation
          ..senderLandmark = senderLandmark
          ..senderDirection = senderDirection
          ..receiverName = receiverName
          ..receiverEmail = receiverEmail
          ..receiverPhone = receiverPhone
          ..receiverAddress = receiverAddress
          ..receiverLocation = receiverLocation
          ..receiverLandmark = receiverLandmark
          ..receiverDirection = receiverDirection
          ..orderTimestamp = orderTimestamp
          ..orderMileageCost = orderMileageCost));
