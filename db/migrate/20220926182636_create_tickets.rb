# frozen_string_literal: true

class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_enum :status, ["pending", "completed", "removed"]

    create_table :tickets do |t|
      t.string :title
      t.enum :current_status, enum_type: "status", default: "pending", null: false
      t.references :user, null: false, index: true
      t.timestamps
    end
  end
end
