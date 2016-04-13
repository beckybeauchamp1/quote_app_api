angular.module("categories").controller("CategoryIndexController", function(
  $scope,
  CategoryFactory
){

  $scope.categories = CategoryFactory.query();
  $scope.newCategory = new CategoryFactory();

});
