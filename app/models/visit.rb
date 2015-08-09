class Visit < ActiveRecord::Base
  belongs_to :location

  validates :signal, inclusion: { in: -100..-1}

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
