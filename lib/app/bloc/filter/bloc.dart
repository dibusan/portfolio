import 'package:flutter/material.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './event.dart';
import './state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  late TextEditingController filterTagController = TextEditingController(text: "");
  late TextEditingController generalController = TextEditingController(text: "");

  onWrite() {
    if (filterTagController.text != state.filterTag) {
      add(FilterEventWriteTag(value: filterTagController.text));
    }
  }

  onWriteGeneral() {
    if (generalController.text != state.filterGeneral) {
      add(FilterEventWriteGeneral(value: generalController.text));
    }
  }

  FilterBloc() : super(const FilterState()) {
    filterTagController.addListener(onWrite);
    generalController.addListener(onWriteGeneral);

    on<FilterEventInit>(_init);
    on<FilterEventDateTime>(_filterDateTime);
    on<FilterEventTechTag>(_filterTechTag);
    on<FilterEventWriteTag>(_filterWriteTechTag);
    on<FilterEventWriteGeneral>(_filterWriteGeneral);
  }

  void _init(FilterEventInit event, Emitter<FilterState> emit) async {
    List<Project> projects = Project.myProjects();
    final DateTime dateTime = DateTime.now();

    emit(
      state.copyWith(
        filterTag: filterTagController.text,
        dates: [
          DateFilter(date: dateTime, title: "All"),
          DateFilter(date: dateTime.subtract(const Duration(days: 30 * 6)), title: "6 months"),
          DateFilter(date: dateTime.subtract(const Duration(days: 365)), title: "1 year"),
        ],
      ),
    );
    emit(state.copyWith(dateFilter: state.dates.firstOrNull));
  }

  void _filterDateTime(FilterEventDateTime event, Emitter<FilterState> emit) async {
    emit(state.copyWith(dateFilter: event.dateTime));
  }

  void _filterWriteTechTag(FilterEventWriteTag event, Emitter<FilterState> emit) async {
    emit(state.copyWith(filterTag: event.value));
  }

  void _filterWriteGeneral(FilterEventWriteGeneral event, Emitter<FilterState> emit) async {
    emit(state.copyWith(filterGeneral: event.value));
  }

  void _filterTechTag(FilterEventTechTag event, Emitter<FilterState> emit) async {
    final result = state.techTags.toList();

    if (event.removed) {
      if (!result.contains(event.name)) return;
      result.remove(event.name);
    } else {
      if (result.contains(event.name)) return;
      result.add(event.name);
    }
    emit(state.copyWith(techTags: result));
  }

  @override
  Future<void> close() {
    filterTagController.removeListener(onWrite);
    generalController.removeListener(onWriteGeneral);
    return super.close();
  }
}
