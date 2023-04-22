import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geeks/models/hobs%20api%20model/hob_movie/result.dart';
import 'package:geeks/services/hoblist_api_service.dart';
import 'package:injectable/injectable.dart';

part 'hoblist_event.dart';
part 'hoblist_state.dart';

@Injectable()
class HoblistBloc extends Bloc<HoblistEvent, HoblistState> {
  final HobslistServices apiServices;
  HoblistBloc(this.apiServices) : super(HoblistInitial()) {
    on<FetchMoviesEvent>((event, emit) async {
      emit(LoadingState());

      final result = await apiServices.fetchData();
      if (result is String) {
        emit(NetWorkState());
      } else if (result is List<Result>?) {
        emit(ProvideData(movieList: result));
      } else {
        emit(ErrorState());
      }
    });
  }
}
