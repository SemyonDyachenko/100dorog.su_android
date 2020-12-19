import 'dart:convert';

class Tour {
  final String id;
  final String name;
  final String url_path;
  final String description;
  final String options_description;
  final String price;
  final String child_price;
  final String seats_count;
  final String purchased_seats;
  final String created;
  final String modified;
  final String bonus_count;
  final String bonus_canused;
  final String event_datetime;
  final String location;

  Tour({
    this.id,
    this.name,
    this.url_path,
    this.description,
    this.options_description,
    this.price,
    this.child_price,
    this.seats_count,
    this.purchased_seats,
    this.created,
    this.modified,
    this.bonus_count,
    this.bonus_canused,
    this.event_datetime,
    this.location,
  });

  factory Tour.fromJson(Map<String, dynamic> json) {
    return Tour(
      id: json['id'] as String,
      name: json['name'] as String,
      url_path: json['url_path'] as String,
      description: json['description'] as String,
      options_description: json['options_description'] as String,
      price: json['price'] as String,
      child_price: json['child_price'] as String,
      seats_count: json['seats_count'] as String,
      purchased_seats: json['purchased_seats'] as String,
      created: json['created'] as String,
      modified: json['modified'] as String,
      bonus_count: json['bonus_additem'] as String,
      bonus_canused: json['bonus_canused'] as String,
      event_datetime: json['event_date'] as String,
      location: json['location'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'url_path': url_path,
      'description': description,
      'options_description': options_description,
      'price': price,
      'child_price': child_price,
      'seats_count': seats_count,
      'purchased_seats': purchased_seats,
      'created': created,
      'modified': modified,
      'bonus_count': bonus_count,
      'bonus_canused': bonus_canused,
      'event_date': event_datetime,
      'location': location,
    };
  }
}