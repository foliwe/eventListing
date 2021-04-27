class Contact < MailForm::Base
  append :remote_ip, :user_agent, :session
  attribute :name, validate: true
  attribute :email, validate: true
  attribute :message
  attribute :file, attachment: true
  attributes :nickname, captcha: true
  def headers
    { 
      #this is the subject for the email generated, it can be anything you want
      subject: "My Contact Form",
      to: 'info@sassltd.com',
      from: %("#{name}" <#{email}>)
      #the from will display the name entered by the user followed by the email
    }
  end
end