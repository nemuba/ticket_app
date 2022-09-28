# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :current_status, presence: true
  validates :comments, presence: true
  enum :current_status, { pending: "pending", completed: "completed", removed: "removed" }

  after_create_commit { broadcast_prepend_later_to "tickets" }
  after_update_commit { broadcast_replace_later_to "tickets" }
  after_destroy_commit { broadcast_remove_to "tickets" }
end
