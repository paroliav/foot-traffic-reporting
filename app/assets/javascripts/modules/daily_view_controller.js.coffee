# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

angular
.module("footTrafficApp")
.controller 'DailyViewController', [
  '$scope', 'DailyViewService'
  ($scope, DailyViewService) ->
    $scope.daily_view_data = (date) ->
      DailyViewService.fetch(date: date)
      .$promise
      .then (data) ->
        $scope.myData = {
          labels: data.graph[0],
          datasets: [
            {
              label: "Daily visit dataset",
              fillColor: "rgba(151,187,205,0.2)",
              strokeColor: "rgba(151,187,205,1)",
              pointColor: "rgba(151,187,205,1)",
              pointStrokeColor: "#fff",
              pointHighlightFill: "#fff",
              pointHighlightStroke: "rgba(151,187,205,1)",
              data: data.graph[1]
            }
          ]
        }
      .catch (error) ->
        console.log(error)


]

