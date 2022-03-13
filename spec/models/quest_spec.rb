# frozen_string_literal: true

require 'rails_helper'

describe "questモデルのテスト" do
  context "ユーザーが存在する時" do
    before do
      @user = FactoryBot.create(:user)
    end
    it "クエスト情報が保存されるか" do
      quest = FactoryBot.build(:quest)
      quest.user = @user
      expect(quest).to be_valid
    end
  end

  describe "アソシエーションのテスト" do
    context "userモデルとの関係" do
      it "N:1となっている" do
        expect(Quest.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context "quest_taskモデルとの関係" do
      it "1:Nとなっている" do
        expect(Quest.reflect_on_association(:quest_tasks).macro).to eq :has_many
      end
    end
  end
end