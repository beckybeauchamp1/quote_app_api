"use strict";

angular.module("quotes").controller("SearchController", function(
  $scope,
  $stateParams,
  QuoteFactory
){

  $scope.author;

  $scope.allQuotes = QuoteFactory.keyword({keyword: $stateParams.keyword}).$promise.then(function(data){
    $scope.author = data[0].author;
    return $scope.quotes = data;
  });
});
