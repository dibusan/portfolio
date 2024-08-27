import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

part 'state.freezed.dart';

class DateFilter {
  final DateTime date;
  final String title;

  DateFilter({required this.date, required this.title});
}

@freezed
abstract class FilterState with _$FilterState {
  const factory FilterState({
    @Default(true) bool loading,
    Developer? developer,
    @Default([]) List<Project> projects,
    @Default([]) List<String> techTags,
    @Default("") String filterTag,
    DateFilter? dateFilter,
    @Default([]) List<DateFilter> dates,
  }) = _FilterState;
}
