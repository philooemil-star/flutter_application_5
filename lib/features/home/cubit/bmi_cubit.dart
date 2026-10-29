import 'package:flutter_bloc/flutter_bloc.dart';
import 'bmi_states.dart';

class BmiCubit extends Cubit<BmiStates> {
  BmiCubit() : super(BmiInitialState());

  static BmiCubit get(context) => BlocProvider.of(context);

  bool isMale = true;
  double height = 150.0;
  int weight = 60;
  int age = 26;

  void changeGender(bool selectedMale) {
    isMale = selectedMale;
    emit(BmiChangeGenderState(isMale));
  }

  void changeHeight(double newHeight) {
    height = newHeight;
    emit(BmiChangeHeightState(height));
  }

  void incrementWeight() {
    weight++;
    emit(BmiChangeWeightState(weight));
  }

  void decrementWeight() {
    weight--;
    emit(BmiChangeWeightState(weight));
  }

  void incrementAge() {
    age++;
    emit(BmiChangeAgeState(age));
  }

  void decrementAge() {
    age--;
    emit(BmiChangeAgeState(age));
  }
}