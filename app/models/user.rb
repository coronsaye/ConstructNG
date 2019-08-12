class User < ApplicationRecord
    has_and_belongs_to_many :roles
    has_many :companies
    has_many :individuals

    validates_presence_of :email 
    validates_uniqueness_of :email, case_sensitive: false
    validates_format_of :email, with: /@/
    has_secure_password
    before_save :downcase_email 
    before_create :generate_confirmation_instructions

    #change emailaddress case to lower case
    def downcase_email

        self.email = self.email.delete(' ').downcase

    end

    #generate confirmation token
    def generate_confirmation_instructions

        self.confirmation_token = SecureRandom.hex(10)
        self.confirmation_sent_at = Time.now.utc

    end

    #check validity
    def mark_as_confirmed!
        (self.confirmation_sent_at + 30.days) > Time.now.utc
    end

    #reset confirmation token status to confirmed 
    def confirmation_token_valid?

        self.confirmation_token = nil 
        self.confirmed_at = Time.now.utc 
        save 

    end
end
