part of 'reciters_cubit.dart';

sealed class RecitersState extends Equatable {
  const RecitersState();

  @override
  List<Object> get props => [];
}

final class RecitersInitial extends RecitersState {}

final class RecitersLoading extends RecitersState {}

final class RecitersSucess extends RecitersState {
  final List<Reciter> reciterlist;
  final bool isPlaying;

  const RecitersSucess({required this.reciterlist, this.isPlaying = false});
}

final class RecitersFailer extends RecitersState {
  final String errMassage;

  const RecitersFailer({required this.errMassage});
}
