class CalculatorHighComplexity
  def calculate_total(amount, customer_type, payment_method, country)
    if amount <= 0
      return 0
    end

    if customer_type == 'premium'
      if payment_method == 'credit_card'
        if country == 'US'
          amount * 0.9
        elsif country == 'EU'
          amount * 0.85
        else
          amount * 0.95
        end
      elsif payment_method == 'debit'
        if country == 'US'
          amount * 0.95
        elsif country == 'EU'
          amount * 0.92
        else
          amount * 0.97
        end
      else
        amount
      end
    else
      if payment_method == 'credit_card'
        if country == 'US'
          amount * 0.95
        elsif country == 'EU'
          amount * 0.93
        else
          amount * 0.97
        end
      elsif payment_method == 'debit'
        if country == 'US'
          amount * 0.98
        elsif country == 'EU'
          amount * 0.96
        else
          amount * 0.99
        end
      else
        amount
      end
    end
  end
end