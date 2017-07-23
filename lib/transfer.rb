class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status
  attr_reader :amount

  def initialize(sender, receiver, amt)
    @amount = amt
    @sender = sender
    @receiver = receiver
    @status = "pending"
  end

  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      return true
    else
      return false
    end
  end

  def execute_transaction
    if self.valid? == true && @status == "pending"
      if @sender.balance - @amount < 0
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end

      @receiver.deposit(@amount)
      @sender.withdraw(@amount)
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.withdraw(@amount)
      @sender.deposit(@amount)
      @status = "reversed"
    end

  end






end
