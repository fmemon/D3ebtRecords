class Product < ActiveRecord::Base
  validates_presence_of :name, :description
  
  before_validation :assign_default_description
  
  private
    def assign_default_description
      if description.blank?
        self.description = name
      end
    end
  
  
end
# == Schema Information
#
# Table name: products
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :text
#  cost        :decimal(, )
#  stock       :integer
#  created_at  :datetime
#  updated_at  :datetime
#

