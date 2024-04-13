import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

enum SingleUserStatus { verified, notVerified }

enum ActiveStatus { selected, curated, rejected }

class SingleUserBooking {
  final String? truck;
  final String? load;
  final String? size;
  final String? date;
  final String? bookingid;
  String? get docId => reference!.id;

  final DocumentReference? reference;
  ActiveStatus activeStatus;

  SingleUserBooking({
    this.truck,
    this.load,
    this.size,
    this.date,
    this.bookingid,
    this.reference,
    this.activeStatus = ActiveStatus.curated,
  });

  toJson() => {
        "truck": truck,
        "reference": reference,
        "load": load,
        "size": size,
        "date": date,
        "bookingid": bookingid,
        "docId": docId,
      };

  factory SingleUserBooking.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return SingleUserBooking(
      truck: data["truck"],
      load: data["load"],
      size: data["size"],
      date: data["date"],
      bookingid: data["bookingid"],
      reference: snapshot.reference,
    );
  }

  factory SingleUserBooking.fromJson(json, DocumentReference reference) {
    return SingleUserBooking(
      truck: json["truck"],
      load: json["load"],
      size: json["size"],
      date: json["date"],
      bookingid: json["bookingid"],
      // reference: json["reference"],
      reference: reference,
    );
  }
}
