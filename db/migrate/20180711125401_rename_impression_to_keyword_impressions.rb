class RenameImpressionToKeywordImpressions < ActiveRecord::Migration[5.0]
  def change
		rename_column :impressions, :impression, :keyword
  end
end
