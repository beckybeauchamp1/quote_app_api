angular.module("quote").controller("FavoritesController", function($scope, $stateParams, QuoteFactory, UserFactory, $state){

  $scope.new = function(){
    QuoteFactory.addFavs({id: $stateParams.id}).$promise.then(function(data){
      console.log(data);
      return $state.favorite = data;
    })
  };

  $scope.quotes =  UserFactory.query();
  $scope.fav = "hey";
  // If see all was clicked, showing all quotes

  $scope.all = false;
  $scope.changeView = function(){
    console.log("jsakdbadbjkabdkjabdkjb")
    $scope.all = true;
    return $scope.all
  };

  $scope.currentPage = 1;

  $scope.pageChangeHandler = function(num) {
    console.log('quotes page changed to ' + num);
  };



});
