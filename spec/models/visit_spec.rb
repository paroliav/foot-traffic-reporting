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


end