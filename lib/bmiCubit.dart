import 'dart:math';

import 'package:bmi/bmiStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiCubit extends Cubit<BmiStates> {
  BmiCubit() : super(InitialState());

  int h = 0;
  int w = 0;
  double r = 0;
  String? status;

  void add(String type) {
    if (type == "height") {
      h++;
      emit(UpdateTextState());
    } else {
      w++;
      emit(UpdateTextState());
    }
  }

  void remove(String type) {
    if (type == "height") {
      h--;
      emit(UpdateTextState());
    } else {
      w--;
      emit(UpdateTextState());
    }
  }

  void calc() {
    r = (w / pow(h / 100, 2)).ceilToDouble();
    if (r < 16) {
      status = "Severe Thinness";
    } else if (r == 16 && r == 17) {
      status = "Moderate Thinness";
    } else if (r > 17 && r <= 18.5) {
      status = "Mild Thinness";
    } else if (r > 18.5 && r <= 25) {
      status = "Normal";
    } else if (r > 25 && r <= 30) {
      status = "Overweight";
    } else if (r > 30 && r <= 35) {
      status = "Obese Class I";
    } else if (r > 35 && r <= 40) {
      status = "Obese Class II";
    } else if (r > 40) {
      status = "Obese Class III";
    }

    emit(UpdateTextState());
  }
}
