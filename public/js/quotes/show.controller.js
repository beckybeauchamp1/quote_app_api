"use strict";

angular.module("quotes").controller("QuoteShowController", function(
  $scope,
  $stateParams,
  QuoteFactory,
  CategoryFactory,
  $state
){

  $scope.category;

  $scope.quote = QuoteFactory.get({id: $stateParams.id}).$promise.then(function(data){
    $scope.quote = data;
    return $scope.quote;
  });

  $scope.categories = QuoteFactory.category().$promise.then(function(data){
    return $scope.categories = data;
  });

  $scope.tags = QuoteFactory.grabCategories({id: $stateParams.id}).$promise.then(function(data){
    console.log(data);
    return $scope.tags = data;
  })

  $scope.newCategory = function(quote, category_id){
    console.log($state);
    QuoteFactory.addCategory({quote_id: quote, category_id: category_id}).$promise.then(function(data){
      $state.go("quoteShow", {}, {reload: true});
    });
  };

});
