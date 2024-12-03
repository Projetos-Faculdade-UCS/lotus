part of 'dashboard_bloc.dart';

/// {@template dashboard_event}
/// Base class for dashboard events.
/// {@endtemplate}
sealed class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

/// The initial state of the dashboard.
final class DashboardInitial extends DashboardState {}

/// The state when the dashboard is loading.
final class DashboardLoading extends DashboardState {}

/// {@template dashboard_loaded}
/// The state when the dashboard is loaded.
/// {@endtemplate}
final class DashboardLoaded extends DashboardState {
  /// {@macro dashboard_loaded}
  const DashboardLoaded(this.dashboard);

  /// The loaded dashboard.
  final Dashboard dashboard;

  @override
  List<Object> get props => [dashboard];
}

/// The state when the dashboard fails to load.
final class DashboardError extends DashboardState {}
