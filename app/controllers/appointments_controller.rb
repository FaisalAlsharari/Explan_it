class AppointmentsController < ApplicationController 
  before_action :set_appointment, only: [:show,  :edit,  :update,  :destroy, :accept]
  before_action :authenticate_user!
  # GET /appointments
  # GET /appointments.json
  def index
    if current_user.is_tutor
    @appointments = Appointment.where(tutor: current_user.name)


    else 
    @appointments = Appointment.where(user_id: current_user.id)

    end 
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
    @course = Course.find(params[:course_id])
  end

  # GET /appointments/1/edit
  def edit
    @course= Course.find(Appointment.find(params[:id]).course)
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)
    respond_to do |format|
      if @appointment.save
        
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment  }
      else

        
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

def accept
  @appointment.update_attribute(:accepted, true)
  redirect_to request.referrer
end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:place, :accepted, :tutor, :course, :user_id)
    end
end
