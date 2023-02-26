part of 'collection_bloc.dart';

abstract class CollectionEvent extends Equatable {
  const CollectionEvent();

  @override
  List<Object> get props => [];
}

class AddCollection extends CollectionEvent {
  AddCollection(
      {required this.description,
      required this.image,
      required this.name,
      required this.price});
  String price;
  String image;
  String name;
  String description;
}
