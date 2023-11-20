# frozen_string_literal: true

require 'rails_helper'

describe "【モデルのテスト】" do
  it "有効な登録（投稿）内容の場合は保存されるか" do
    expect(FactoryBot.build(:item)).to be_valid
  end
end