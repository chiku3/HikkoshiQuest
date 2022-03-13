# frozen_string_literal: true

require 'rails_helper'

describe "userモデルのテスト" do
  it "ユーザー情報が保存されるか" do
    expect(FactoryBot.build(:user)).to be_valid
  end
end

describe "アソシエーションのテスト" do
  context "questモデルとの関係" do
    it "1:Nとなっている" do
      expect(User.reflect_on_association(:quests).macro).to eq :has_many
    end
  end

  context "boardモデルとの関係" do
    it "1:Nとなっている" do
      expect(User.reflect_on_association(:boards).macro).to eq :has_many
    end
  end

  context "commentモデルとの関係" do
    it "1:Nとなっている" do
      expect(User.reflect_on_association(:comments).macro).to eq :has_many
    end
  end

  context "active_notificationモデルとの関係" do
    it "1:Nとなっている" do
      expect(User.reflect_on_association(:active_notifications).macro).to eq :has_many
    end
  end

  context "passive_notificationモデルとの関係" do
    it "1:Nとなっている" do
      expect(User.reflect_on_association(:passive_notifications).macro).to eq :has_many
    end
  end
end