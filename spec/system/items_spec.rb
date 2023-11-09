require 'rails_helper'

describe '投稿のテスト' do
  let!(:item) { create(:item, name:'hoge',diesctiption:'body') }
  describe 'トップ画面(top_path)のテスト' do
    before do
      visit top_path
    end
    context '表示の確認' do
      it 'トップ画面(public_root_path)に「Welcome to Amulab !!」が表示されているか' do
        expect(page).to have_content 'Welcome to Amulab !!'
      end
      it 'public_root_pathが"/"であるか' do
        expect(current_path).to eq('/')
      end
    end
  end

  describe "投稿画面(new_item_path)のテスト" do
    before do
      visit new_item_path
    end
    context '表示の確認' do
      it 'new_item_pathが"/lists/new"であるか' do
        expect(current_path).to eq('/lists/new')
      end
      it '新規作品登録（投稿）ボタンが表示されているか' do
        expect(page).to have_button '新規作品登録'
      end
    end
    context '登録（投稿）処理のテスト' do
      it '登録（投稿）後のリダイレクト先は正しいか' do
        fill_in 'item[name]', with: Faker::Lorem.characters(number:10)
        fill_in 'item[description]', with: Faker::Lorem.characters(number:30)
        click_button '新規作品登録'
        expect(page).to have_current_path item_path(Item.last)
      end
    end
  end

  describe "作品一覧のテスト" do
    before do
      visit items_path
    end
    context '表示の確認' do
      it '登録（投稿）されたものが表示されているか' do
        expect(page).to have_content item.name
        expect(page).to have_link item.name
      end
    end
  end

  describe "詳細画面のテスト" do
    before do
      visit item_path(item)
    end
    context '表示の確認' do
      # it '削除リンクが存在しているか' do
      #   expect(page).to have_link '削除'
      # end
      it '編集リンクが存在しているか' do
        expect(page).to have_link '編集'
      end
    end
    context 'リンクの遷移先の確認' do
      it '編集の遷移先は編集画面か' do
        edit_link = find_all('a')[3]
        edit_link.click
        expect(current_path).to eq('/items/' + item.id.to_s + '/edit')
      end
    end
    # context 'list削除のテスト' do
    #   it 'listの削除' do
    #     expect{ list.destroy }.to change{ List.count }.by(-1)
    #   end
    # end
  end

  describe '編集画面のテスト' do
    before do
      visit edit_item_path(item)
    end
    context '表示の確認' do
      it '編集前のタイトルと本文がフォームに表示(セット)されている' do
        expect(page).to have_field 'item[name]', with: item.name
        expect(page).to have_field 'itme[description]', with: item.description
      end
      it '保存ボタンが表示される' do
        expect(page).to have_button '保存'
      end
    end
    context '更新処理に関するテスト' do
      it '更新後のリダイレクト先は正しいか' do
        fill_in 'item[name]', with: Faker::Lorem.characters(number:10)
        fill_in 'item[description]', with: Faker::Lorem.characters(number:30)
        click_button '保存'
        expect(page).to have_current_path item_path(item)
      end
    end
  end
end