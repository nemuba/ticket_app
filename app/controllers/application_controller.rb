# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  def after_sign_in_path_for(resource)
    tickets_url
  end

  def after_sign_up_path_for(resource)
    tickets_url
  end
end
