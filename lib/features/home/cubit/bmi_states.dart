abstract class BmiStates {}

class BmiInitialState extends BmiStates {}

class BmiChangeGenderState extends BmiStates {
  final bool isMale; 


  BmiChangeGenderState(this.isMale); 
}

class BmiChangeHeightState extends BmiStates {
  final double height; 

  
  BmiChangeHeightState(this.height); 
}

class BmiChangeWeightState extends BmiStates {
  final int weight; 

  
  BmiChangeWeightState(this.weight); 
}

class BmiChangeAgeState extends BmiStates {
  final int age; 

  
  BmiChangeAgeState(this.age); 
}