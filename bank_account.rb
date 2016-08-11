class BankAccount
@@num_bank_account = 0

attr_accessor :account_no, :total_bal, :checking_bal, :saving_bal

	def initialize
		u_account_no
		@@num_bank_account += 1
		@account_no = 0
		@total_bal = 0
		@checking_bal = 500
		@saving_bal = 1150
		@rate = 0.05
	end


	def u_checking_bal
		puts "Checking Balance is #{@checking_bal}"
	end

	def u_saving_bal
		puts "Saving Balance is #{@saving_bal}"
	end

	def deposit(amount,account_type)
		if account_type == 'checking'
			puts "You have decided to deposit #{amount}"
			puts "Before deposit, your checking balance is #{@checking_bal}"
			@checking_bal += amount
			puts "After deposit, your new checking balance is #{@checking_bal}"
		elsif account_type == 'saving'
			puts "You have decided to deposit #{amount}"
			puts "Before deposit, your saving balance is #{@saving_bal}"
			@saving_bal += amount
			puts "Before deposit, your saving balance is #{@saving_bal}"
		end
	end

	def withdraw(amount, account_type)
		if account_type == 'checking'
			if ( @checking_bal - amount ) < 0
				return "Insufficient Funds. Transaction avoided!"
			else
				puts "You have decided to withdraw #{amount}"
				puts "Before withdrawal, your checking balance is #{@checking_bal}"
				@checking_bal -= amount
				puts "Before withdrawal, your checking balance is #{@checking_bal}"
			end
		elsif account_type == 'saving'
			if (@saving_bal - amount) < 0
				return "Insufficient Funds. Transaction avoided!"
			else
				puts "You have decided to withdraw #{amount}"
				puts "Before withdrawal, your saving balance is #{@saving_bal}"
				@saving_bal -= amount
				puts "After withdrawal, your saving balance is #{@saving_bal}"
			end
		end
	end

	def view_bal
		puts "Total balance is #{ @checking_bal + @saving_bal }"
	end

	def account_information
		puts "Account number is #{ @account_no }"
		puts "Checking Balance is #{ @checking_bal }"
		@new_saving_bal = @saving_bal + (@saving_bal * @rate )
		puts "Original Saving Balance is #{@saving_bal}"
		puts "Saving Balance with interest is #{ @new_saving_bal }"
		puts "Total Balance is  #{ @checking_bal + @new_saving_bal }"
		puts "Your interest rate is #{ @rate }"
	end

private  # methods below are private
attr_accessor :rate

	def u_account_no
		# generate a 8 digit account number
		@account_no = rand(10000000..99999999)
		# puts "Account number is #{@account_no}"
		self
	end	

end

bob = BankAccount.new
bob.account_information
bob.deposit(50,'checking')
bob.deposit(75,'saving')
bob.withdraw(60,'checking')
bob.withdraw(100,'saving')
bob.view_bal
bob.u_checking_bal
bob.u_saving_bal
