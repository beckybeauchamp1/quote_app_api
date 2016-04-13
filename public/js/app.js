"use strict";

(function(){
  angular
  .module("quote", [
    "ui.router",
    "quotes",
    "categories",
    'ngDraggable',
    'ng-token-auth',
    'users',
    'signin'
  ])
  .config([
    "$stateProvider",
    RouterFunction
  ])
  .config([
    '$authProvider',
    AuthConfigFunction
  ])
  .directive('ngDraggable', function($document, $window){
    function makeDraggable(scope, element, attr) {
      var startX = 0;
      var startY = 0;

      var x = 0;
      var y = 0;

      element.css({
        position: 'relative',
        cursor: 'pointer',
        top: y + 'px',
        left: x + 'px'
      });

      element.on('mousedown', function(event) {
        event.preventDefault();

        startX = event.pageX - x;
        startY = event.pageY - y;

        $document.on('mousemove', mousemove);
        $document.on('mouseup', mouseup);
      });

      function mousemove(event) {
        y = event.pageY - startY;
        x = event.pageX - startX;

        element.css({
          top: y + 'px',
          left: x + 'px'
        });
      }

      function mouseup() {
        $document.unbind('mousemove', mousemove);
        $document.unbind('mouseup', mouseup);
      }
    }
    return {
      link: makeDraggable
    };
  });

  function AuthConfigFunction($authProvider) {
    $authProvider.configure({
      apiUrl: "http://localhost:3000/"
    });
  }

  function RouterFunction($stateProvider){
    $stateProvider
    .state("home", {
      url: "",
      templateUrl: "js/quotes/home.html"
    })
    .state("keywordSearch", {
      url: "/quotes/search/:keyword",
      templateUrl: "js/quotes/search.html",
      controller: "SearchController",
      controllerAs: "SearchViewModel"
    })
    .state("quoteIndex",{
      url: "/quotes",
      templateUrl: "js/quotes/index.html",
      controller: "QuoteIndexController",
      controllerAs: "QuoteIndexViewModel"
    })
    .state("tagCategory", {
      url: "/quotes/:id/category/:category_id",
      templateUrl: "js/quotes/show.html",
      controller: "QuoteShowController",
      controllerAs: "QuoteShowViewModel"
    })
    .state("quoteShow",{
      url: "/quotes/:id",
      templateUrl: "js/quotes/show.html",
      controller: "QuoteShowController",
      controllerAs: "QuoteShowViewModel"
    })
    .state("categoriesIndex",{
      url: "/categories",
      templateUrl: "js/categories/index.html",
      controller: "CategoryIndexController",
      controllerAs: "CategoryIndexViewModel"
    })
    .state("profile", {
      url: "/profile",
      templateUrl: "js/users/profile.html",
      controller: "FavoritesController",
      controllerAs: "FavoritesViewModel"
    })
    .state("signin", {
      url: "/signin",
      templateUrl: "js/users/signin.html",
      controller: "SessionsController",
      controllerAs: "SessionsViewModel"
    })
    .state("signup", {
      url: "/signup",
      templateUrl: "js/users/signup.html",
      controller: "SessionsController",
      controllerAs: "SessionsViewModel"
    })
    .state("signout", {
      url: "/signout",
      templateUrl: "js/users/signout.html",
      controller: "SessionsController",
      controllerAs: "SessionsViewModel"
    })
    .state("favorites", {
      url: "/favorites",
      templateUrl: "js/users/profile.html",
      controller: "FavoritesController",
      controllerAs: "FavoritesViewModel"
    });
  }
}());
