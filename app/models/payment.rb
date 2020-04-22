class Payment < ApplicationRecord
    belongs_to :user

    validates :email, presence: true
    validates :token, presence: true

    attr_accessor :card_number, :card_cvc, :card_expires_month, :card_expires_year

    def self.month_options
        Date::MONTHNAMES.compact.each_with_index.map { |name, index| ["#{index + 1} - #{name}", index + 1] }
    end

    def self.year_options
        (Date.today.year..(Date.today.year + 10)).to_a
    end

    def process_payment
        customer = Stripe::Customer.create({ email: email, card: token })
        Stripe::Charge.create({ amount: 1000, currency: 'usd', customer: customer.id, description: 'Rails Photo App Premium'})
    end
end
