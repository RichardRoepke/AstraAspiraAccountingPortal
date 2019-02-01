class Park < ActiveRecord::Base
  acts_as_paranoid
  validates_as_paranoid
  validates_uniqueness_of_without_deleted :username

  has_many :reports

  def full_address
    return address + ', ' + city + ', ' + state_name + ' (' + zipcode + ')'
  end

  def state_name
    # TODO: Linkup with Central Catalogue to decipher state_ids and return their names
    return state_id.to_s
  end
end
