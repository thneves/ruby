require 'pry'


module SavingsAccount
  def self.interest_rate(balance)
    return -3.213.to_f if balance.negative?
    return 0.5.to_f if balance < 1000
    return 1.621.to_f if balance >= 1000 && balance < 5000
    return 2.475.to_f if balance >= 5000
  end

  def self.annual_balance_update(balance)
    balance.positive? ? balance + percentage(balance) : balance - percentage(balance)
  end

  def self.percentage(num)
    (interest_rate(num) / 100) * num
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    temp = current_balance
    count = 0
    years = 0
    while temp < desired_balance
      balance = annual_balance_update(temp)
      count += percentage(annual_balance_update(balance))
      temp = balance
      years += 1
    end
    years
  end
end

SavingsAccount.interest_rate(100)
SavingsAccount.annual_balance_update(100)
SavingsAccount.years_before_desired_balance(100, 125.8)

