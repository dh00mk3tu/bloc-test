

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:test/model/club-model.dart';

abstract class ClubState extends Equatable {
  @override
  List<Object> get props => [];
}


class ClubInitState extends ClubState {

}

class ClubLoading extends ClubState {

}

class ClubLoaded extends ClubState {
  final List<ClubModel> clubs;
  ClubLoaded(this.clubs);
}

class ClubListError extends ClubState {
  final error;
  ClubListError(this.error);
}