part of 'dashboard_bloc.dart';

/// {@template dashboard_event}
/// Base class for dashboard events.
/// {@endtemplate}
sealed class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

/// Fetches the dashboard data.
class FetchDashboard extends DashboardEvent {}
