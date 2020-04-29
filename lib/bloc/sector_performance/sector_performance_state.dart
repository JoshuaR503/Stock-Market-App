part of 'sector_performance_bloc.dart';

@immutable
abstract class SectorPerformanceState {}

class SectorPerformanceInitial extends SectorPerformanceState {}

class SectorPerformanceError extends SectorPerformanceState {
  final String message;

  SectorPerformanceError({
    @required this.message,
  });
}

class SectorPerformanceLoading extends SectorPerformanceState {}

class SectorPerformanceLoaded extends SectorPerformanceState {

  final SectorPerformanceModel sectorPerformance;
  final MarketMoversModelData marketActive;
  final MarketMoversModelData marketGainer;
  final MarketMoversModelData marketLoser;

  SectorPerformanceLoaded({
    @required this.sectorPerformance,
    @required this.marketActive,
    @required this.marketGainer,
    @required this.marketLoser,
  });

}
