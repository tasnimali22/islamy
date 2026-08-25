import 'package:equatable/equatable.dart';
import 'package:islamyapp/Features/presentation/data/time_model/time_model/time_model.dart';

sealed class ParyTimeState extends Equatable {
  const ParyTimeState();

  @override
  List<Object> get props => [];
}

final class ParyTimeInitial extends ParyTimeState {}

final class ParyTimeLoading extends ParyTimeState {}

final class ParyTimeSucess extends ParyTimeState {
  final List<TimeModel?> praytime;

  const ParyTimeSucess({required this.praytime});
}

final class ParyTimeFailer extends ParyTimeState {
  final String errMassage;

  const ParyTimeFailer({required this.errMassage});
}
