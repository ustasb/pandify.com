window.pandifyApp.controller 'navMenuCtrl', [
  '$rootScope'
  '$scope',
  '$location',
  'pandifySession',
  ($root, $scope, $location, session) ->

    $root.$on '$routeChangeStart', (event, next, current) ->
      $scope.hasTracks = true

      atCreateOrCustomize = /\/(customize|create)/.test($location.url())
      hasPandoraTracks = session.get('initPandoraTracksCount') > 0

      unless hasPandoraTracks
        $scope.hasTracks = false
        $location.path('/configure') if atCreateOrCustomize
]
