class Pet < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :sex
  validates_presence_of :age
  validates_presence_of :image
  validates_presence_of :description
  belongs_to :shelter

  before_save :default_values
  def default_values
    self.status ||= 'adoptable' # note self.status = 'P' if self.status.nil? might be safer (per @frontendbeauty)
  end

end
