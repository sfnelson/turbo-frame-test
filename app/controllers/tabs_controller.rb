class TabsController < ApplicationController
  def show
    render locals: { name: params[:name] }
  end
end
