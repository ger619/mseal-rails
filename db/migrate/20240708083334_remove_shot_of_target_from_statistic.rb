class RemoveShotOfTargetFromStatistic < ActiveRecord::Migration[7.0]
  def change
    remove_column :statistics, :shots_off_target, :integer
  end
end
