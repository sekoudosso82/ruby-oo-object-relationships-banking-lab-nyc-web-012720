require_relative "./bank_account.rb"
# require_relative "../lib/person.rb"


class Transfer
  # @@all = []
  attr_accessor :sender, :receiver, :status, :amount
  def initialize (sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount

    # @@all << self
  end 

  def valid? 

    (@sender.valid? && @receiver.valid?) ? true :false
  end
  def execute_transaction
    if (valid? && self.sender.balance >= @amount && @status == "pending")
        self.sender.balance -= @amount
        self.receiver.balance += @amount
        self.status = "complete"
    else 
          self.status = "rejected"
          "Transaction rejected. Please check your account balance." 
    end 
  end

  def reverse_transfer 
    if execute_transaction
      self.sender.balance += @amount
      self.receiver.balance -= @amount
      self.status = "reversed"
    end 
    
  end
end
