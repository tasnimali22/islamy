import 'package:equatable/equatable.dart';

class Moshaf extends Equatable {
  final int? id;
  final String? name;
  final int? rewayaId;
  final String? server;
  final int? surahTotal;
  final int? moshafType;
  final String? surahList;

  const Moshaf({
    this.id,
    this.name,
    this.rewayaId,
    this.server,
    this.surahTotal,
    this.moshafType,
    this.surahList,
  });

  factory Moshaf.fromJson(Map<String, dynamic> json) => Moshaf(
    id: json['id'] as int?,
    name: json['name'] as String?,
    rewayaId: json['rewaya_id'] as int?,
    server: json['server'] as String?,
    surahTotal: json['surah_total'] as int?,
    moshafType: json['moshaf_type'] as int?,
    surahList: json['surah_list'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'rewaya_id': rewayaId,
    'server': server,
    'surah_total': surahTotal,
    'moshaf_type': moshafType,
    'surah_list': surahList,
  };

  @override
  List<Object?> get props {
    return [id, name, rewayaId, server, surahTotal, moshafType, surahList];
  }
}
