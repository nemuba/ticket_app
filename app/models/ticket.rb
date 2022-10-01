# frozen_string_literal: true

class Ticket < ApplicationRecord
  include ExportCsv
  include ImportCsv

  belongs_to :user
  has_rich_text :comments

  validates :title, presence: true
  validates :current_status, presence: true
  enum :current_status, { pending: "pending", completed: "completed", removed: "removed" }

  after_create_commit :create_broadcast
  after_update_commit :update_broadcast
  after_destroy_commit :destroy_broadcast

  scope :by_user, ->(user) { joins(:user).where(user_id: user.id).with_all_rich_text.order(:created_at) }
  scope :search, ->(title) { where("title LIKE ?", "%#{title}%") }
  
  def create_broadcast
    broadcast_prepend_later_to "tickets_user_#{user_id}"
  end

  def update_broadcast
    broadcast_replace_later_to "tickets_user_#{user_id}"
  end

  def destroy_broadcast
    broadcast_remove_to "tickets_user_#{user_id}"
  end
end
