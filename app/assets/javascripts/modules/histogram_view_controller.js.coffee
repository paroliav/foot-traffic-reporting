angular
.module("footTrafficApp")
.controller 'HistogramViewController', [
  '$scope', 'HistogramViewService'
  ($scope, HistogramViewService) ->
    $scope.fetchHistogram = ->
      HistogramViewService.fetch(start_date: $scope.start_date, end_date: $scope.end_date)
      .$promise
      .then (data) ->
        $scope.chartData = {
          labels: data.graph[0],
          datasets: [
            {
              label: "Histogram visit dataset",
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
