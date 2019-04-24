class ServiceEntriesController < ApplicationController
  before_action :set_service_entry, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  # GET /service_entries
  def index
    @service_entries = ServiceEntry.all
  end

  # GET /service_entries/1
  def show
  end

  # GET /service_entries/new
  def new
    @service_entry = ServiceEntry.new
  end

  # GET /service_entries/1/edit
  def edit
  end

  # POST /service_entries
  def create
    @service_entry = ServiceEntry.new(service_entry_params)

    if @service_entry.save
      redirect_to @service_entry, notice: 'Service entry was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /service_entries/1
  def update
    if @service_entry.update(service_entry_params)
      redirect_to @service_entry, notice: 'Service entry was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /service_entries/1
  def destroy
    @service_entry.destroy
    redirect_to service_entries_url, notice: 'Service entry was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_entry
      @service_entry = ServiceEntry.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def service_entry_params
      params.require(:service_entry).permit(:name, :vehicle_id, :tax, :total, :service_date)
    end
end
