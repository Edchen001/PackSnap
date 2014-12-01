class PhotosController < ApplicationController

	def new
		@photo = Photo.new
		render :new, locals: {photo: @photo}
	end

	def create
		@photo = Photo.new(user_id: session[:user_id])
		@photo.assign_attributes(photo_params)
		if @photo.save
			render partial: "photos/tags", locals:{photo: @photo}
		else
			set_alert(@photo)
		end
	end

	def photo_params
		params.require(:photo).permit(:image)
	end


end