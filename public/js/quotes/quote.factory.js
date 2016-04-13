"use strict";

console.log('factory');
(function(){
  angular
  .module("quotes")
  .factory("QuoteFactory", [
    "$resource",
    QuoteFactoryFunction
  ]);

  function QuoteFactoryFunction($resource){
    return $resource("https://beckys-quote-app.herokuapp.com/quotes/:id", {},
    {
      update: {
        method: "PUT"
      },
      keyword: {
        method: "GET",
        params:{
          keyword: '@keyword'
        },
        url: "https://beckys-quote-app.herokuapp.com/quotes/search/:keyword",
        isArray: true
      },
      category: {
        method: "GET",
        params:{
          category: '@category'
        },
        url: "https://beckys-quote-app.herokuapp.com/categories",
        isArray: true,
      },
      addCategory:{
        method: "POST",
        params: {
          quote: '@quote',
          category: '@category'
        },
        url: "https://beckys-quote-app.herokuapp.com/addCategory",
        isArray: true,
      },
      grabCategories:{
        method: "GET",
        params: {
          id: '@id',
        },
        url: "https://beckys-quote-app.herokuapp.com/quotes/:id/categories",
        isArray: true,
        stripTrailingSlashes: false
      },
      addFavs:{
        method: "POST",
        params: {
          quote: '@quote',
          category: '@category'
        },
        url: "https://beckys-quote-app.herokuapp.com/quotes/favorites/new"
      }
    });
  }
}());
