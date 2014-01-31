# ui-instagram
# Aaron Snyder http://twitter.com/aesny
# For mojotech www.mojotech.com
# MIT License
angular.module('ui.instagram', [])
  .service 'Instagram', ($http) ->
    get: (id, clientId, cb) ->
      URL = "https://api.instagram.com/v1/users/#{id}/media/recent/?client_id=#{clientId}&callback=JSON_CALLBACK"
      $http.jsonp(URL).success (resolution) ->
        cb(resolution.data)
  .directive 'uiInstagram', ->
    restrict: 'EA'
    controller: ($scope, $attrs, Instagram) ->
      $scope.grams = []
      Instagram.get $attrs.userId, $attrs.clientId, (grams) ->
        $scope.grams = grams
