import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_and_cubit/data_service.dart';
import 'post.dart';

class PostsCubit extends Cubit<List<Post>> {
  final _dataService = DataService();

  PostsCubit() : super([]);

  void getPosts() async => emit(await _dataService.getPosts());
}
