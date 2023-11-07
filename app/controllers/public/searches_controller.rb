class Public::SearchesController < ApplicationController
  def search
		@content = params[:content] || ''
		if @content == ''
		  @records = []
		else
		  @records = Item.search_for(@content)
		end
  end
end
