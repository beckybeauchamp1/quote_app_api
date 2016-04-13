angular.module("quotes").controller("QuoteIndexController", function(
  $scope,
  QuoteFactory
){

  $scope.quotes = QuoteFactory.query();
  $scope.newQuote = new QuoteFactory();
  $scope.total = 0;
  

});
