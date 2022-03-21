# frozen_string_literal: true

require 'rails_helper'

describe 'boardモデルのテスト' do
  context 'ユーザーが存在する時' do
    before do
      @user = FactoryBot.create(:user)
    end
    it 'board情報が保存されるか' do
      board = FactoryBot.create(:board)
      board.user = @user
      expect(FactoryBot.build(:board)).to be_valid
    end
  end

  describe 'アソシエーションのテスト' do
    context 'userモデルとの関係' do
      it 'N:1となっている' do
        expect(Board.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'boardモデルとの関係' do
      it 'N:1となっている' do
        expect(Board.reflect_on_association(:comments).macro).to eq :has_many
      end
    end

    context 'quest_taskモデルとの関係' do
      it '1:Nとなっている' do
        expect(Board.reflect_on_association(:notifications).macro).to eq :has_many
      end
    end
  end
end
