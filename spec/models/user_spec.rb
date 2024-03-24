require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    # validation examples here

    it 'is not valid when the first_name is not filled in' do
      @user = User.new(first_name: nil, last_name: "Smith", email: "smith@email.com", password: '1two3', password_confirmation: '1two3')
      @user.save
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'is not valid not when last_name is not filled in' do
      @user = User.new(first_name: "Bob", last_name: nil, email: "bob@email.com", password: '1two3', password_confirmation: '1two3')
      @user.save
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'is not valid when the email is not filled in' do
      @user = User.create(first_name: "Bob", last_name: "Marley", email: nil, password: '1two3', password_confirmation: '1two3')
      @user.save
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'is not valid when the email already exists in the DB' do
      User.create(first_name: "Rob", last_name: "Robertson", email: "robertson@email.com", password: '1two', password_confirmation: '1two')
      @user2 = User.new(first_name: "Sam", last_name: "Sung", email: "robertson@email.com", password: 'two3', password_confirmation: 'two3')
      @user2.save
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end    

     it 'is not valid when the password is not filled in' do
      @user = User.create(first_name: "Bob", last_name: "Marley", email: "marley@email.com", password: nil, password_confirmation: '1two3')
      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'is not valid when entered password and password confirmation does not match' do
      @user = User.create(first_name: "Bob", last_name: "Marley", email: "marley@email.com", password: '1two3', password_confirmation: 'one2tree')
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'is not valid when the password is less than 3 characters' do
      @user = User.create(first_name: "Bob", last_name: "Marley", email: "marley@email.com", password: "23", password_confirmation: '23')
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
    end
    

    it 'is not valid when the mandatory fields are not filled in' do
      @user = User.create(first_name: "Bob", last_name: "Marley", email: "marley@email.com", password: "1two3", password_confirmation: '1two3')
      expect(@user).to be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here

    it 'should log a user in with valid credentials' do
      @user = User.create(first_name: "Bob", last_name: "Marley", email: "marley@email.com", password: "1two3", password_confirmation: '1two3')
      @user_is_valid = User.authenticate_with_credentials("marley@email.com", "1two3")
      expect(@user_is_valid).to_not equal(nil)
    end

    it 'should log user in with spaces in the email' do
      @user = User.create(first_name: "Bob", last_name: "Marley", email: "marley@email.com", password: "1two3", password_confirmation: '1two3')
      @user_is_valid = User.authenticate_with_credentials(" marley@email.com ", "1two3")
      expect(@user_is_valid).to_not equal(nil)
    end

    it 'should log user in if email is in lower or upper case' do
      @user = User.create(first_name: "Bob", last_name: "Marley", email: "marley@email.com", password: "1two3", password_confirmation: '1two3')
      @user_is_valid = User.authenticate_with_credentials("Marley@EMAIL.com", "1two3")
      expect(@user_is_valid).to_not equal(nil)
    end
  end

end