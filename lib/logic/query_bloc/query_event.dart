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

class AddPrescriptionQueryEvent extends QueryEvent {
  final String userId;
  final List prescriptions;
  AddPrescriptionQueryEvent({
    required this.userId,
    required this.prescriptions,
  });
}

class AddMedicalHistoryQueryEvent extends QueryEvent {
  final String userId;
  final String name;
  final String symptoms;
  final String diagnosis;
  final String fees;
  final String remedies;

  AddMedicalHistoryQueryEvent({
    required this.userId,
    required this.name,
    required this.symptoms,
    required this.diagnosis,
    required this.fees,
    required this.remedies,
  });
}

class BookAppointmentQueryEvent extends QueryEvent {
  final String userId;
  final String doctorId;
  final String date;
  final String time;
  final String hospitalId;
  final String category;
  final String contact;
  final bool needAmbulance;
  final String? address;
  BookAppointmentQueryEvent({
    required this.userId,
    required this.doctorId,
    required this.date,
    required this.time,
    required this.hospitalId,
    required this.category,
    required this.contact,
    required this.needAmbulance,
    this.address,
  });
}
