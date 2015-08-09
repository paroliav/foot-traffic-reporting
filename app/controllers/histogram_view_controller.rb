class HistogramViewController < ApplicationController

  def index
  end

  def fetch
    start_date = params[:start_date].to_i
    end_date = params[:end_date].to_i

    visits = Visit.histogram_view(start_date, end_date)

    graph = group_data(visits)
    render json: {graph: graph, start_date: start_date, end_date: end_date}.to_json
  end

  private

  def group_data(visits)
    graph = [[], []]
    visits.each do |key, value|
      graph[0] << key
      graph[1] << value
    end
    graph
  end

end
