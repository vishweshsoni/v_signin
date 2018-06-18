class Validation{

  //Name validatiom
  String validateName(String value){
    if(value.isEmpty) return 'Name is required.';
    final RegExp nameExp = new RegExp(r'^[A-Za-z]+$');
    if(!nameExp.hasMatch(value))
      return 'Please Enter only alphabatical Character';

    return null;
  }

  //For email validation
  String validateEmail(String value){
    if(value.isEmpty) return 'Email is required';
    final RegExp  emailExp = new RegExp(r'^\w+@[a-zA-z_]+?\.[a-zA-Z]{2,3}$');
    if(!emailExp.hasMatch(value))
      return 'Invalid email address';

    return null;
  }

  //For password validation
  String validatePassword(String value){
    if(value.isEmpty) return 'Please choose a password';
    return  null;
  }


}