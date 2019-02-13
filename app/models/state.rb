# Uses the State table in bystng to match state_ids to their names.
class State < ActiveRecord::Base
  establish_connection "central_catalogue_#{Rails.env}".to_sym
  self.table_name = 'states'

  def abbrev
    self.abbrv
  end
end
