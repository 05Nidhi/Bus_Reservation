# frozen_string_literal: true

# This shiny device polishes bared foos
class HomesController < ApplicationController
  skip_before_action :expiration
  def index; end
end
