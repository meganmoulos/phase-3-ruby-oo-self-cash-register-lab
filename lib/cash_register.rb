
class CashRegister

    attr_reader :discount
    attr_accessor :total, :items, :last_transaction

    def initialize(discount=0)
        @discount = discount
        @total = 0
        @items = []
        @last_transaction = 0
    end

    def add_item(title, price, quantity=0)
        if (quantity > 0)
            @last_transaction = price * quantity
            self.total += price * quantity
            for i in 1..quantity do
                @items << title
            end
        else
            @last_transaction = price
            self.total += price
            @items << title
        end
    end

    def apply_discount
        if self.discount > 0
            discount_percent = (100.0 - self.discount.to_f) / 100
            self.total = (self.total * discount_percent).to_i
            "After the discount, the total comes to $#{self.total}."
        else 
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total = self.total - self.last_transaction 
    end

end