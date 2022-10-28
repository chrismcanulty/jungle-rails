require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    describe "name, email, password, password_confirmation" do
      it "should be created with a name, email, password, password_confirmation" do
        new_user = User.create(name: 'hello', email: 'hello@example.com', password: '123', password_confirmation: '123')
        expect(new_user.attributes).to include "name"
        expect(new_user.attributes).to include "email"
        expect(new_user.attributes).to include "password_digest"
      end
    end

    describe "passwords not matching" do
      it "should not be created where passwords do not match" do
        new_user = User.create(name: 'hello', email: 'hello@example.com', password: '123', password_confirmation: '456')
        expect(new_user.save).to be false
      end
    end

    describe "email exists in db" do
      it "should not be created where email exists in db, not case sensitive" do
        new_user = User.create(name: 'test', email: 'TEST@test.com', password: 'test', password_confirmation: 'test')
        expect{new_user.save}.to change(User, :count).by(0)
      end
    end

    describe "name is required" do
      it "should not be created where name is not supplied" do
        new_user = User.create(email: 'new@test.com', password: 'test', password_confirmation: 'test')
        expect{new_user.save}.to change(User, :count).by(0)
      end
    end

    describe "email is required" do
      it "should not be created where email is not supplied" do
        new_user = User.create(name: 'test', password: 'test', password_confirmation: 'test')
        expect{new_user.save}.to change(User, :count).by(0)
      end
    end

    describe "min password length" do
      it "should not be created where password is less than 4 characters" do
        new_user = User.create(name: 'test', email: 'new@new.com', password: 'tes', password_confirmation: 'tes')
        expect{new_user.save}.to change(User, :count).by(0)
      end
    end

    describe '.authenticate_with_credentials' do
      it "should return a user where email and password are matching" do
        new_user = User.create(name: 'test', email: 'test@test.com', password: 'test', password_confirmation: 'test')
        return_user = User.authenticate_with_credentials("test@test.com", "test")
        expect(return_user.email).to eq "test@test.com"
      end
    end

    describe '.authenticate_with_credentials' do
      it "should return nil where email and password are not matching" do
        new_user = User.create(name: 'test', email: 'test@test.com', password: 'test', password_confirmation: 'test')
        return_user = User.authenticate_with_credentials("test@test.com", "failedtest")
        expect(return_user).to be nil
      end
    end

    describe '.authenticate_with_credentials' do
      it "should return a user where email (case insensitive) and password are matching" do
        new_user = User.create(name: 'test', email: 'test@test.com', password: 'test', password_confirmation: 'test')
        return_user = User.authenticate_with_credentials("tEst@test.com", "test")
        expect(return_user.email).to eq "test@test.com"
      end
    end

    describe '.authenticate_with_credentials' do
      it "should return a user where email (with extra spaces) and password are matching" do
        new_user = User.create(name: 'test', email: 'test@test.com', password: 'test', password_confirmation: 'test')
        return_user = User.authenticate_with_credentials("  test@test.com  ", "test")
        expect(return_user.email).to eq "test@test.com"
      end
    end

  end
end
