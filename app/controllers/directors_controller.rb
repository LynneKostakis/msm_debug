class DirectorsController < ApplicationController
  def index
    @director = Director.order(created_at: :desc)
  end

  def show
    @director = Director.find(params[:id])
   
  end

  def new_form
    
    render("new_form")
  end

  def create_row
    @director = Director.new
    @director.id = params[:id]
    @director.dob = params[:dob]
    @director.name = params[:name]
    @director.bio = params[:bio]
    @director.image_url = params[:image_url]

    @director.save

    render("show")
  end

  def edit_form
    @director = Director.find(params[:id])
   
    render("directors/edit_form.html.erb")
  end

  def update_row
    @director = Director.find(params[:id])

    @director.dob = params[:dob]
    @director.name = params[:name]
    @director.bio = params[:bio]
    @director.image_url = params[:image_url]

    @director.save

    render("roles")
  end

  def destroy
    @director = Director.find(params[:id])

    @director.destroy
  end
end
