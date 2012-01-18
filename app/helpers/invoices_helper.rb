module InvoicesHelper
  def display_purchase(invoice)
    unless invoice.purchase.nil?
      invoice.purchase.description 
    else
      "(no Purchase yet)"
    end
  end

end
