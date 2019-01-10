require 'pry'

class CashRegister

  attr_accessor :discount, :total, :items, :last_transaction

  def initialize(discount=nil)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity=1)
    self.total += price * quantity
    @items.fill(item, @items.size, quantity)
    self.last_transaction  = price * quantity
  end

  def apply_discount
    if discount == nil
       "There is no discount to apply."
    else
    price = (@discount/100.0)
    @total -= total*price
    "After the discount, the total comes to $#{@total.to_int}."
    end
  end

  def void_last_transaction
    self.total = self.total - self.last_transaction
  end


end # end of CashRegister class
