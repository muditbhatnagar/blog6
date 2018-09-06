class ProfilesController < ApplicationController

	def new
		@profile = Profile.new
	end

	def create
		@profile = Profile.new(name: params[:profile][:name], image: params[:profile][:image], email: params[:profile][:email], about: params[:profile][:about])
		@profile.save
		redirect_to profiles_path(@profile)
	end

	def show
		@profile = Profile.find(params[:id])
	end

	def index
		@profile = Profile.all
	end

	def edit
		@profile = Profile.find(params[:id])
	end

	def update
		@profile = Profile.find(params[:id])
		if @profile.update(name: params[:profile][:name], image: params[:profile][:image], email: params[:profile][:email], about: params[:profile][:about])
			redirect_to profile_path(@profile)
		else
			render 'edit'
		end
	end
end
