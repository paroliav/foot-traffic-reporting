angular
.module("footTrafficApp").factory 'HistogramViewService', ['$resource', ($resource) ->
  $resource('/fetch_histogram_data', {}, {fetch: {method:'GET', url: '/histogram_view_fetch'}})
]