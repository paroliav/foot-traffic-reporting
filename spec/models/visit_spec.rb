require_relative '../spec_helper'

describe Visit do

  describe 'valid' do


    it 'returns false when signal is ut of range' do
      visit = Visit.new(:location_id => 1, :start_time => DateTime.now, :end_time => DateTime.now+1, :signal => 1 )
      expect(visit.valid?).to eq(false)
    end

    it 'returns true when signal is with in range' do
      visit = Visit.new(:location_id => 1, :start_time => DateTime.now, :end_time => DateTime.now+1, :signal => -10 )
      expect(visit.valid?).to eq(true)
    end

  end

  describe 'daily_view' do

    let(:start_time) { DateTime.new(2015,8,8,22,34,12,00) }
    before do
      Visit.delete_all
      visit1 = Visit.new(:location_id => 1, :start_time => start_time, :end_time => start_time+10.minutes, :signal => -20)
      visit2 = Visit.new(:location_id => 1, :start_time => start_time+1, :end_time => start_time+1.day+10.minutes, :signal => -20)
      visit1.save!
      visit2.save!
    end

    it 'returns time based visits for a day' do
      expect(Visit.daily_view(8).size).to eq(1)
    end


  end

  describe 'histogram_view' do

    let(:start_time) { DateTime.new(2015,8,8,22,34,12,00) }
    before do
      Visit.delete_all
      visit1 = Visit.new(:location_id => 1, :start_time => start_time, :end_time => start_time+10.minutes, :signal => -20)
      visit2 = Visit.new(:location_id => 1, :start_time => start_time+1, :end_time => start_time+1.day+10.minutes, :signal => -50)
      visit1.save!
      visit2.save!
    end

    it 'returns time based visits for a day' do
      expect(Visit.histogram_view(8, 9).size).to eq(2)
    end


  end


end