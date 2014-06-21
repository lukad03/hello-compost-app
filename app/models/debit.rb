class Debit < ActiveRecord::Base
  belongs_to :client
  validates_presence_of :value

  validate :enough_credits

  def enough_credits
    self.errors.add(:value, "Not enough credits") unless (available_credits(self.client_id) - self.value) < -1
  end

  private

  def available_credits(client)
    existing_credits(client) - existing_debits(client)
  end

  def existing_credits(client)
    Credit.where(client_id: client).sum(:value)
  end

  def existing_debits(client)
    Debit.where(client_id: client).sum(:value)
  end
end
