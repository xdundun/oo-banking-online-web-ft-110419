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

    if @sender.valid? && @receiver.valid? && @status == "pending"
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
    end
  elsif @sender.status == "closed"
    "Transaction rejected. Please check your account balance."

  end
end #end of class
