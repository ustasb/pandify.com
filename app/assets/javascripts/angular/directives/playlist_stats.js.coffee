PlaylistStatsCtrl = ($scope, SpotifyTrackPresenter) ->
  $scope.totalHumanTime = (tracks) -> SpotifyTrackPresenter.humanTime(tracks)

playlistStats = ->
  restrict: 'A'
  templateUrl: 'angular/templates/playlist_stats.html'
  scope:
    tracks: '='
  controller: PlaylistStatsCtrl

PlaylistStatsCtrl.$inject = ['$scope', 'SpotifyTrackPresenter']
angular.module('pandify').directive('playlistStats', playlistStats)
