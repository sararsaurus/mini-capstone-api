class Product < ApplicationRecord
  def friendly_created_at
    created_at.strftime("%B %e, %Y")
  end

  def is_discounted?
    price < 10
  end

  def tax
    price * 0.09
  end

  def total
    tax + price
  end
end
