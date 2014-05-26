class SampleMail < MailForm::Base
  attributes :name, :email, :nickname
  validates :nickname, AbsenceValidator.new(attributes[:nickname])

  def headers
    { to: "recipient@example.com", from: self.email }
  end
end
