

require 'rails_helper'



RSpec.describe Customer, type: :model do

  it "名前とメールアドレスとパスワードがあれば登録できる" do
    expect(FactoryBot.create(:customer)).to be_valid
  end

  it "名前がなければ登録できない" do
    expect(FactoryBot.build(:customer, name: "")).to_not be_valid
  end

  it "メールアドレスがなければ登録できない" do
    expect(FactoryBot.build(:customer, email: "")).to_not be_valid
  end

  it "メールアドレスが重複していたら登録できない" do
    customer1 = FactoryBot.create(:customer,name: "taro", email: "taro@example.com")
    expect(FactoryBot.build(:customer, name: "ziro", email: customer1.email)).to_not be_valid
  end

  it "パスワードがなければ登録できない" do
    expect(FactoryBot.build(:customer, password: "")).to_not be_valid
  end

  it "パスワードが暗号化されているか" do
    customer = FactoryBot.create(:customer)
    expect(customer.password_digest).to_not eq "password"
  end

  it "password_confirmationとpasswordが異なる場合保存できない" do
    expect(FactoryBot.build(:customer,password:"password",password_confirmation: "passward")).to_not be_valid
  end


end