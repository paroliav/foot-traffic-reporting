require 'test_helper'

class VisitTest < ActiveSupport::TestCase
  # spec "the truth" do
  #   assert true
  # end

  test "the visit throws error when signal is out of range" do
    visit = Visit.new(:location_id => 1, :start_time => DateTime.now, :end_time => DateTime.now+1, :signal => 1)
    p visit.save
  end
end
