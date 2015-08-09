angular
.module("footTrafficApp").factory 'DailyViewService', ['$resource', ($resource) ->
  $resource('/fetch_graph_data', {}, {fetch: {method:'GET', url: '/daily_view_fetch'}})
]