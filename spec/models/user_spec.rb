require 'spec_helper'

describe User do

	before(:each) do
		@attr = { :name => "Example User", :email => "user@example.com" }
	end

	it "should create a new instance given valid attributes" do
		User.create!(@attr)
	end

	it "should require a name" do
		no_name_user = User.new(@attr.merge(:name => ""))
		no_name_user.should_not be_valid
	end

	it "should not allow names longer than 51 chars" do
		long_name = "a" * 51
		long_name_user = User.new(@attr.merge(:name => long_name))
		long_name_user.should_not be_valid
	end

	it "should require an email" do
		no_name_user = User.new(@attr.merge(:email => ""))
		no_name_user.should_not be_valid
	end

	it "should allow valid email addresses" do
		addresses = %w[user@example.com THE_USER@my.example.net a.user@example.co]
		addresses.each do |address|
			valid_email_user = User.new(@attr.merge(:email => address))
			valid_email_user.should be_valid
		end
	end

	it "should not allow invalid email addresses" do
		addresses = %w[user@example,com THE_USER_my.example.net a.user@example.]
		addresses.each do |address|
			invalid_email_user = User.new(@attr.merge(:email => address))
			invalid_email_user.should_not be_valid
		end
	end

	it "should not allow duplicate email addresses" do
		User.create!(@attr)
		user_with_same_email = User.new(@attr)
		user_with_same_email.should_not be_valid
	end

	it "should not allow duplicate email addresses with different cases" do
		upper_cased_email = @attr[:email].upcase
		User.create!(@attr.merge(:email => upper_cased_email))
		user_with_same_email = User.new(@attr)
		user_with_same_email.should_not be_valid
	end
end
