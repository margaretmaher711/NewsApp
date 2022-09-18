import 'package:equatable/equatable.dart';

abstract class NewsStates extends Equatable {}

class NewsInitiState extends NewsStates {
  @override
  List<Object?> get props => [];
}

 class NewsBottomNavState extends NewsStates {
  @override
  List<Object?> get props => [];
}
class NewsBusinessLoadingState extends NewsStates {
  @override
  List<Object?> get props => [];
}
class NewsBusinessSuccesState extends NewsStates {
  @override
  List<Object?> get props => [];
}
class NewsBusinessErrorState extends NewsStates {


  final String error;

  NewsBusinessErrorState(this.error);
  @override
  List<Object?> get props => [];
}

class NewsSportsLoadingState extends NewsStates {
  @override
  List<Object?> get props => [];
}
class NewsSportsSuccesState extends NewsStates {
  @override
  List<Object?> get props => [];
}
class NewsSportsErrorState extends NewsStates {


  final String error;

  NewsSportsErrorState(this.error);
  @override
  List<Object?> get props => [];
}

class NewsScienceLoadingState extends NewsStates {
  @override
  List<Object?> get props => [];
}
class NewsScienceSuccesState extends NewsStates {
  @override
  List<Object?> get props => [];
}
class NewsScienceErrorState extends NewsStates {


  final String error;

  NewsScienceErrorState(this.error);
  @override
  List<Object?> get props => [];
}
