abstract class NewsStates {}

class NewsInitiState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class NewsBusinessLoadingState extends NewsStates {}

class NewsBusinessSuccesState extends NewsStates {}

class NewsBusinessErrorState extends NewsStates {
  final String error;

  NewsBusinessErrorState(this.error);
}

class NewsSportsLoadingState extends NewsStates {}

class NewsSportsSuccesState extends NewsStates {}

class NewsSportsErrorState extends NewsStates {
  final String error;

  NewsSportsErrorState(this.error);
}

class NewsScienceLoadingState extends NewsStates {}

class NewsScienceSuccesState extends NewsStates {}

class NewsScienceErrorState extends NewsStates {
  final String error;

  NewsScienceErrorState(this.error);
}

class NewsSearchLoadingState extends NewsStates {}

class NewsSearchSuccesState extends NewsStates {}

class NewsSearchErrorState extends NewsStates {
  final String error;

  NewsSearchErrorState(this.error);
}
