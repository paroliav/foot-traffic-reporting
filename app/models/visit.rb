class Visit < ActiveRecord::Base
  belongs_to :location

  validates :signal, inclusion: { in: -100..-1}

  def self.daily_view(date)
    Visit.where(:start_time => DateTime.new(2015,8,date,0,0,0)..DateTime.new(2015,8,date,23,59,59)).group(:start_time).count
  end

  def self.histogram_view(start_date, end_date)
    Visit
    .where("start_time >= ? AND end_time <= ?",
           DateTime.new(2015, 8, start_date, 0, 0, 0),
           DateTime.new(2015, 8, end_date, 23, 59, 59))
    .group(:signal).count
  end

  def self.start_date(date)
    @start_time = DateTime.new(2015, 8, date, rand(0..23), rand(0..59) ,rand(0..59))
  end

  def self.end_time
    @start_time + rand(1..20).minutes
  end

  def self.seeded_start_time
    @start_time
  end
end
