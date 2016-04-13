angular.module("users").controller("FavoritesController", function($scope, $stateParams, QuoteFactory, UserFactory, $state){

  $state.new = function(){
    UserFactory.addFavs({id: $stateParams.id}).$promise.then(function(data){
    console.log(data);
    return $state.favorite = data;
  })
}
  $state.quotes =  UserFactory.query();
  $state.hey = "JASBDKJSABDASBJDJABDKJABD"
});
