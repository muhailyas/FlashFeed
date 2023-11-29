abstract class RemoteArticlesEvent {
  const RemoteArticlesEvent();
}

class GetArticles extends RemoteArticlesEvent {}

class SelectCategoryEvent extends RemoteArticlesEvent {
  final int selectedIndex;

  SelectCategoryEvent({required this.selectedIndex});
}
