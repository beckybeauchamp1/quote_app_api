angular.module("users").controller("FavoritesController", function($scope, $stateParams, QuoteFactory, UserFactory, $state){

  $scope.new = function(){
    UserFactory.addFavs({id: $stateParams.id}).$promise.then(function(data){
    console.log(data);
    return $state.favorite = data;
  })
};

  $scope.quotes =  UserFactory.query();

});
