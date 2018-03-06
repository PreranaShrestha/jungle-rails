require 'rails_helper'

RSpec.describe User, type: :model do
  before :example do
    User.destroy_all
    @user = User.create!(email:"TEST@TEST.com",first_name: "Mona", last_name:"Rai", password: "monarai", password_confirmation:"monarai")
    @user1 = User.create!(email:"test@test.test",first_name: "Mona", last_name:"Rai", password: "monarai", password_confirmation:"monarai")
  end
  after :example do
    User.destroy_all
  end
  describe 'Validations' do
    it 'Should return true if password and password_confirmation match ' do
      @user.password.should == @user.password_confirmation
    end
    it 'Should return false if user email is presence' do
       @user1.email = "TeST@TEST.com"
      expect(@user1).not_to be_valid
    end
    it 'Should return false if first name is not presence' do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end
    it 'Should return false if last name is not presence' do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
    it 'Should return false if email is not presence' do
      @user.email = nil
      expect(@user).to_not be_valid
    end
    it 'Should return false if password is less than 5' do
      @user.password = "mona"
      expect(@user).to_not be_valid
    end
  end

  # before :example do
  #   @user = User.create(email:"TEST@TEST.com",first_name: "Mona", last_name:"Rai", password: "mona", password_confirmation:"mona")
  #   @user1 = User.create(email:"test@test.COM",first_name: "Mona", last_name:"Rai", password: "mona", password_confirmation:"mona")

  # end

  describe '.authenticate_with_credentials' do
    it 'Should return false if email and password is not valid' do
      authenticate = User.authenticate_with_credentials("te@test.test", "monarai")
      expect(authenticate).to eq(nil)
    end
    it 'Should return pass if there is space' do
      authenticate = User.authenticate_with_credentials(" test@test.test", "monarai")
      expect(authenticate).to_not eq(nil)
    end
    it 'Should return pass if email is casesensitive' do
      authenticate = User.authenticate_with_credentials("TEst@test.cOm", "monarai")
      expect(authenticate).to_not eq(nil)
    end
  end
end
