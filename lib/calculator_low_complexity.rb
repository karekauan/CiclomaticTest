class CalculatorLowComplexity
    DISCOUNTS = {
      'premium' => {
        'credit_card' => { 'US' => 0.9, 'EU' => 0.85, 'other' => 0.95 },
        'debit' => { 'US' => 0.95, 'EU' => 0.92, 'other' => 0.97 },
        'other' => { 'default' => 1.0 }
      },
      'standard' => {
        'credit_card' => { 'US' => 0.95, 'EU' => 0.93, 'other' => 0.97 },
        'debit' => { 'US' => 0.98, 'EU' => 0.96, 'other' => 0.99 },
        'other' => { 'default' => 1.0 }
      }
    }
  
    def calculate_total(amount, customer_type, payment_method, country)
      return 0 if amount <= 0
  
      discount = get_discount(customer_type, payment_method, country)
      amount * discount
    end
  
    private
  
    def get_discount(customer_type, payment_method, country)
      customer_discounts = DISCOUNTS[customer_type] || DISCOUNTS['standard']
      payment_discounts = customer_discounts[payment_method] || customer_discounts['other']
      payment_discounts[country] || payment_discounts['other'] || payment_discounts['default']
    end
  end