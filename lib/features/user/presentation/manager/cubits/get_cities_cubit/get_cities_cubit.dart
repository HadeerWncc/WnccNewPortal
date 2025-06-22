import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wncc_portal/core/repos/base_repos.dart';

part 'get_cities_state.dart';

class GetCitiesCubit extends Cubit<GetCitiesState> {
  GetCitiesCubit(this.baseRepos) : super(GetCitiesInitial());

  final BaseRepos baseRepos;

  Future<void> getCities(String state) async {
    emit(GetCitiesInitial());
    String stateId = await baseRepos.getStatesId(state);
    List<String> cities = await baseRepos.getCities(stateId);
    emit(GetCitiesSuccess(cities: cities));
  }
}
