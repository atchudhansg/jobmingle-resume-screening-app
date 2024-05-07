// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_post.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JobPostAdapter extends TypeAdapter<JobPost> {
  @override
  final int typeId = 0;

  @override
  JobPost read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JobPost(
      jobTitle: fields[0] as String,
      jobDescription: fields[1] as String,
      recruiterEmail: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, JobPost obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.jobTitle)
      ..writeByte(1)
      ..write(obj.jobDescription)
      ..writeByte(2)
      ..write(obj.recruiterEmail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobPostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
