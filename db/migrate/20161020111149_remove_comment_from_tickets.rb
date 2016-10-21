class RemoveCommentFromTickets < ActiveRecord::Migration
  def change
    remove_column :tickets, :comment, :string
  end
end
