import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

/// {@template dashboard_bloc}
/// A [Bloc] which manages the dashboard data.
/// {@endtemplate}
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  /// {@macro dashboard_bloc}
  DashboardBloc(this._dashboardRepository) : super(DashboardInitial()) {
    on<FetchDashboard>(_onFetchDashboard);
  }

  /// Repository which manages [Dashboard]s.
  final DashboardRepository _dashboardRepository;

  FutureOr<void> _onFetchDashboard(
    FetchDashboard event,
    Emitter<DashboardState> emit,
  ) async {
    emit(DashboardLoading());

    try {
      final dashboard = await _dashboardRepository.fetch();
      emit(DashboardLoaded(dashboard));
    } catch (e) {
      emit(DashboardError());
    }
  }
}
