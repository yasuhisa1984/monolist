class RankingController < ApplicationController
  def have
    ids = Have.group(:item_id).order('count_item_id desc').limit(10).count(:item_id).keys
  
    #findでidsを取得（この状態では並べ替え未完成）。itemのidをindexでidsに合致させ出力し、並べ替え。
    @items = Item.find(ids).sort_by{|i| ids.index(i.id)}
    @counts = ids
  end

  def want
    ids = Want.group(:item_id).order('count_item_id desc').limit(10).count(:item_id).keys
    @items = Item.find(ids).sort_by{|i| ids.index(i.id)}
    @counts = ids
  end
end
