class DashboardsController < ApplicationController
  def show
    render 'show', locals: { kibana: Kibana.first }
  end
end
