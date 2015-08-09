class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.belongs_to :location, index: true
      t.datetime :start_time
      t.datetime :end_time
      t.integer :signal

      t.timestamps null: false
    end
  end
end
