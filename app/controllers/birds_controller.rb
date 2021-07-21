# frozen_string_literal: true

class BirdsController < ApplicationController
  def index
    @birds = Bird.all
  end

  def new
    @bird = Bird.new
  end

  def create
    @bird = Bird.new(bird_params)
    password = params[:bird].fetch(:password)
    if password == correct_password && @bird.save!
      redirect_to birds_path
    else
      render :new
    end
  end

  def edit
    @bird = Bird.find(params[:id])
  end

  def update
    @bird = Bird.find(params[:id])
    password = params[:bird].fetch(:password)
    if password == correct_password && @bird.update(bird_params)
      redirect_to birds_path
    else
      render :edit
    end
  end

  def bird_params
    params.require(:bird).permit(:title, :content, :image)
  end
end