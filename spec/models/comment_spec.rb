# frozen_string_literal: true

require 'rails_helper'

describe 'commentモデルのテスト' do
  context 'ユーザーと掲示板が存在する' do
    before do
      @user = FactoryBot.create(:user)
      @board = FactoryBot.create(:board)
    end
    it 'comment情報が保存されるか' do
      comment = FactoryBot.build(:comment)
      comment.user = @user
      comment.board = @board
      expect(FactoryBot.build(:comment)).to be_valid
    end
  end

  describe 'アソシエーションのテスト' do
    context 'userモデルとの関係' do
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'userモデルとの関係' do
      it 'N:1となっている' do
        expect(Comment.reflect_on_association(:board).macro).to eq :belongs_to
      end
    end

    context 'quest_taskモデルとの関係' do
      it '1:Nとなっている' do
        expect(Comment.reflect_on_association(:notifications).macro).to eq :has_many
      end
    end
  end
end
