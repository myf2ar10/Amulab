class Public::SearchesController < ApplicationController
  def search
    @content = params[:content] || ''
    if @content == ''
      @records = []
    else
      @records = Item.search_for(@content)
    end
    @all_records_count = calculate_all_records_count # ここで calculate_all_records_count メソッドを呼び出す
		@hit_records_count = @records.count # 検索条件に合致するレコードの数をカウント
  end

  private

  def calculate_all_records_count
    # ここに全てのレコード数を計算するロジックを実装
    # 例: モデル名.count などを使用して全てのレコード数を取得
    Item.count
  end

end