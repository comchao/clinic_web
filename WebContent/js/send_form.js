$('#cal_price').click(function(){
//validate form
 $.get('addPetDeposit.jsp',$('#addPet-form').serialize(),function(response){
  $('#result').jsp(response);
 });
});