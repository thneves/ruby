# recursion

module SavingsAccount
  def self.interest_rate(balance)
    case
    when balance < 0
      -3.213
    when balance < 1000
       0.5
    when balance < 5000
      1.621
    else
      2.475
    end
  end
  def self.annual_balance_update(balance)
    balance * (1 + interest_rate(balance).abs/100)
  end
  def self.years_before_desired_balance(current_balance, desired_balance)
    return Float::Infinity if current_balance < 0
    return 0 if current_balance >= desired_balance
    years_before_desired_balance(annual_balance_update(current_balance), desired_balance) + 1
  end
end

# enumerator

module SavingsAccount
  def self.interest_rate(balance)
    return -3.213 if balance.negative?
    return 0.5 if (0...1000).include?(balance)
    return 1.621 if (1000...5000).include?(balance)
    2.475
  end
  def self.annual_balance_update(balance)
    interest = balance.abs * (interest_rate(balance) / 100)
    balance + interest
  end
  def self.years_before_desired_balance(current_balance, desired_balance)
    each_new_balance(current_balance)
      .take_while { |new_balance| new_balance < desired_balance }
      .count + 1
  end
  def self.each_new_balance(balance)
    Enumerator.new do |y|
      loop do
        balance = annual_balance_update(balance)
        y << balance
      end
    end
  end
end