class WelcomeController < ApplicationController
  def new
    render plain: 'Hi, I am krapp'
  end
end
