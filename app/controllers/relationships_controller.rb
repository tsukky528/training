class RelationshipsController < ApplicationController
  before_action :signed_in_user

  def create
    @training = Training.find(params[:relationship][:like_movie_id])
    current_user.like!(@training)
    respond_to do |format|
      format.html { redirect_to @training }
      format.js
    end
  end

  def destroy
    @training = Relationship.find(params[:id]).like_movie
    current_user.unlike!(@training)
    respond_to do |format|
      format.html { redirect_to @training }
      format.js
    end
  end
end