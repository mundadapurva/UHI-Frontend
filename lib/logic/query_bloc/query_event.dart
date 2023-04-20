// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'query_bloc.dart';

@immutable
abstract class QueryEvent {}

class BookBedQueryEvent extends QueryEvent {
  final String hospitalId;
  final String userId;
  final String category;
  final String contact;
  final bool needAmbulance;
  final String? address;
  BookBedQueryEvent({
    required this.hospitalId,
    required this.userId,
    required this.category,
    required this.contact,
    required this.needAmbulance,
    this.address,
  });
  
}



