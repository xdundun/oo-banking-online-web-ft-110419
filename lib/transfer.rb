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

    if @sender.valid?
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  #  elsif @sender.valid? && @receiver.valid? && @status == "pending"
      @sender.balance -= @amount
      puts @sender.display_balance
      @receiver.deposit(@amount)
      puts @receiver.display_balance
      @status = "complete"
   #end
  end
end #end of class
