class DailyViewController < ApplicationController

  def index
  end

  def fetch
    date = params[:date].to_i
    visits = Visit.where(:start_time => DateTime.new(2015,8,date,0,0,0)..DateTime.new(2015,8,date,23,59,59)).group(:start_time).count
    graph = [[], []]
    visits.each do |key, value|
      graph[0] << key.strftime('%H:%M:%S')
      graph[1] << value
    end

    render json: {graph: graph, date: date}.to_json
  end


end
