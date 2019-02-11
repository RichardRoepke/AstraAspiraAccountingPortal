class Park < ActiveRecord::Base
  acts_as_paranoid
  validates_as_paranoid
  validates_uniqueness_of_without_deleted :username

  validates :username, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :zipcode, presence: true
  validates :state_id, presence: true

  has_many :reports, dependent: :destroy

  def full_address
    return address + ', ' + city + ', ' + state_name + ' (' + zipcode + ')'
  end

  # Keeping State and state_id delinked just in case. Accidentially changing
  # the Central Catalogue because of doing the wrong operation on the linked
  # State could be disasterous.
  def state_name
    state = State.find(self.state_id)
    if state.present?
      return state.name
    else
      return self.state_id.to_s
    end
  end
end
