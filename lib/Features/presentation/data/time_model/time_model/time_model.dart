import 'package:equatable/equatable.dart';

import 'date.dart';
import 'meta.dart';
import 'timings.dart';

class TimeModel extends Equatable {
  final Timings? timings;
  final Date? date;
  final Meta? meta;

  const TimeModel({this.timings, this.date, this.meta});

  factory TimeModel.fromJson(Map<String, dynamic> json) => TimeModel(
    timings: json['timings'] == null
        ? null
        : Timings.fromJson(json['timings'] as Map<String, dynamic>),
    date: json['date'] == null
        ? null
        : Date.fromJson(json['date'] as Map<String, dynamic>),
    meta: json['meta'] == null
        ? null
        : Meta.fromJson(json['meta'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'timings': timings?.toJson(),
    'date': date?.toJson(),
    'meta': meta?.toJson(),
  };

  @override
  List<Object?> get props => [timings, date, meta];
}
