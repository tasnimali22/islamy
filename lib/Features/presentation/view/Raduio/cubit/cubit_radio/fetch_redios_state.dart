part of 'fetch_redios_cubit.dart';

sealed class FetchRediosState extends Equatable {
  const FetchRediosState();

  @override
  List<Object> get props => [];
}

final class FetchRediosInitial extends FetchRediosState {}

final class FetchRediosSucess extends FetchRediosState {
  final List<Radio> radiolist;
  final bool isPlaying;

  const FetchRediosSucess({required this.radiolist, this.isPlaying = false});

  @override
  List<Object> get props => [radiolist, isPlaying];
}

final class FetchRediosFailer extends FetchRediosState {
  final String errMassage;

  const FetchRediosFailer({required this.errMassage});
}

final class FetchRediosloading extends FetchRediosState {}
