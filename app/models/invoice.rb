class Invoice < ActiveRecord::Base
  belongs_to :purchase
  
  def display_purchase
    return self.purchase.description unless self.purchase.nil?
    "(no Purchase yet)"
  end
  
end
# == Schema Information
#
# Table name: invoices
#
#  id               :integer         not null, primary key
#  purchase_id      :integer
#  reference_number :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

