part of 'collection_bloc.dart';

abstract class CollectionState extends Equatable {
  const CollectionState();

  @override
  List<Object> get props => [];
}

class CollectionInitial extends CollectionState {}

class CollectionSuccess extends CollectionState {
  
}

class CollectionFailed extends CollectionState {
  CollectionFailed({required this.error_message});
  String error_message;
}
