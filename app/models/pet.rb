class Pet < ApplicationRecord
  belongs_to :shelter
  before_save :default_values
  def default_values
    self.status ||= 'adoptable' # note self.status = 'P' if self.status.nil? might be safer (per @frontendbeauty)
  end
end
