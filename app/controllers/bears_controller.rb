# frozen_string_literal: true

class BearsController < ApplicationController
  def index
    @bears = Bear.all.reverse_order
  end

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

  def edit
    @bear = Bear.find(params[:id])
  end

  def update
    @bear = Bear.find(params[:id])
    password = params[:bear].fetch(:password)
    if password == correct_password && @bear.update(bear_params)
      redirect_to bears_path
    else
      render :edit
    end
  end

  def bear_params
    params.require(:bear).permit(:title, :content, :image)
  end
end