# =require_self
# =require_tree ./modules

@footTrafficApp = angular.module 'footTrafficApp', ['tc.chartjs', 'ngResource']


@footTrafficApp.config([
  '$httpProvider', ($httpProvider)->
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])

@footTrafficApp.run(->
  console.log 'angular app running'
)

