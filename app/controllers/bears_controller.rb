# frozen_string_literal: true

class BearsController < ApplicationController
  def index; end

  def new
    @bear = Bear.new
  end

  def create
    @bear = Bear.new(bear_params)
    password = params[:bear].fetch(:password)
    if password == correct_password && @bear.save!
      redirect_to bears_path
    else
      render :new
    end
  end

  def bear_params
    params.require(:bear).permit(:title, :content, :image)
  end
end