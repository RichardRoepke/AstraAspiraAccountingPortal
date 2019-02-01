class AddParksToReports < ActiveRecord::Migration
  def change
    add_reference :reports, :park, index: true
  end
end
