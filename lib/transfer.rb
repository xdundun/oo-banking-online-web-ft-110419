class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
     self.receiver.valid? && self.sender.valid? && self.sender.balance > self.amount
  end

  def execute_transaction
    if self.status != "complete" && self.valid?
      #needs to check if transaction happened once already (stat = complete)
        self.sender.balance -= self.amount
        self.receiver.balance += self.amount
        self.status = "complete"
      else
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
  end
end #end of class
