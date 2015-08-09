class DailyViewController < ApplicationController

  def index
  end

  def fetch
    date = params[:date].to_i
    visits = Visit.daily_view(date)
    graph = [[], []]
    visits.each do |key, value|
      graph[0] << key.strftime('%H:%M:%S')
      graph[1] << value
    end

    render json: {graph: graph, date: date}.to_json
  end


end
