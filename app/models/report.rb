class Report < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :park
end
