class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction

    if !self.sender.valid?
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."

    elsif self.status != "complete" && self.valid?
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
    #  self.receiver.deposit(self.amount)
      self.status = "complete"

    end

  #   if @sender.valid?
  #     @status = "rejected"
  #     return "Transaction rejected. Please check your account balance."
  #  elsif @receiver.valid? && @status == "pending"
  #   #  @sender.deposit( - @amount)
  #   #  puts @sender.display_balance
  #     @receiver.deposit(@amount)
  #     puts @receiver.display_balance
  #     @status = "complete"
  #  end
  end
end #end of class
