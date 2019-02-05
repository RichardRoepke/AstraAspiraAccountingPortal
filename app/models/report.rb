class Report < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :park

  scope :reporting_parks_only, -> { joins(:park).where(parks: {report: true}) }

  def full_name
    return self.park.name  + ' Report (' + self.start_date.to_s + ' to ' + self.end_date.to_s + ')'
  end
end
