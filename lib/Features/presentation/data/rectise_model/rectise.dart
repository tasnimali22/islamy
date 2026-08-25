import 'package:equatable/equatable.dart';

import 'reciter.dart';

class Rectise extends Equatable {
  final List<Reciter>? reciters;

  const Rectise({this.reciters});

  factory Rectise.fromJson(Map<String, dynamic> json) => Rectise(
    reciters: (json['reciters'] as List<dynamic>?)
        ?.map((e) => Reciter.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'reciters': reciters?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [reciters];
}
