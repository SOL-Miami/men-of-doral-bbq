class NewslettersController < ApplicationController
  before_action :set_newsletter, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  # GET /people
  def index
    @newsletter = Newsletter.all
  end

  # GET /people/1
  def show
  end

  # GET /people/new
  def new
    @newsletter = Newsletter.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  def create
    @newsletter = Newsletter.new(newsletter_params)
    respond_to do |format|
      if @newsletter.save
        format.html { redirect_to @newsletter, notice: 'Newsletter was successfully created.' }
        format.json { render action: 'show', status: :created, location: @newsletter }
        # added:
        format.js   { render :nothing => true, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @newsletter.errors, status: :unprocessable_entity }
        # added:
        format.js   { render json: @newsletter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  def update
    if @newsletter.update(newsletter_params)
      redirect_to @newsletter, notice: 'Newsletter was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /people/1
  def destroy
    @newsletter.destroy
    redirect_to contact_url, notice: 'Newsletter was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @newsletter = Newsletter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def newsletter_params
      params.require(:newsletter).permit(:name, :email)
    end
end
