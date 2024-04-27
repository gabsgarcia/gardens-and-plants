class PlantTagsController < ApplicationController

  def new
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
    render :new
  end

  def create
    @plant = Plant.find(params[:plant_id])
    @tag = Tag.find(params[:plant_tag][:tag])

    @plant_tag = PlantTag.new(plant: @plant, tag: @tag)
    @plant_tag.save!
    # @tags = Tag.where(id: params.dig(:tag, :plant_tag))
    # @tags.each do |tag|
    #   plant_tag = PlantTag.new(plant:@plant, tag: tag)
    #   plant_tag.save!
    # end
    redirect_to garden_path(@plant.garden)
  end
end
