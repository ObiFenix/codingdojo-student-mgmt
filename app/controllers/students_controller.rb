class StudentsController < ApplicationController

  before_action :set_student, only: [:first_name, :last_name, :email, :dojo_id]

  # =============================
  # GET Request - Renders [.html]
  # =============================
  def new
    # unless params[:manager_id].present?
    #   redirect_to new_manager_session_path
    # else
      @dojos = Dojo.all
      @student = Student.new
      @dojoId = params[:dojo_id]
      @this_dojo = Dojo.find(@dojoId)
      # ---------------------------------- [ Put in Session ]
      session[:student_id] = params[:id]
      session[:dojo_id] = params[:dojo_id]
      # ----------------------------------
    # end
  end

  # =============================
  # GET Request - Renders [.html]
  # =============================
  def show
    # unless params[:manager_id].present?
    #   redirect_to new_manager_session_path
    # else
      @student = Student.find(params[:id])
      @this_dojo = Dojo.find(params[:dojo_id])
      @this_student = "#{@student.first_name} #{@student.last_name}"

      # ------------------------------ [ Put in Session ]
      session[:dojoid] = @this_dojo.id
      # ------------------------------
    # end
  end


  # =============================
  # GET Request - Renders [.html]
  # =============================
  def edit
    # unless params[:manager_id].present?
    #   redirect_to new_manager_session_path
    # else
      @dojos = Dojo.all
      @student = Student.find(params[:id])
      @this_dojo = Dojo.find(params[:dojo_id])

      # ---------------------------------- [ Put in Session ]
      session[:student_id] = params[:id]
      session[:branch] = @this_dojo.branch
      # ----------------------------------
      render "edit"
    # end
  end

  # ====================
  # POST Request [.html]
  # POST Request [.json]
  # ====================
  def create
    @student = Student.new(validate_params)
    respond_to do |format|
      if @student.save
        # format.html { redirect_to dojo_student_url, notice: 'Student was successfully created.' }
        format.html { redirect_to dojo_path(@this_dojo), notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # =========================
  # PATCH/PUT Request [.html]
  # PATCH/PUT Request [.json]
  # =========================
  def update
    respond_to do |format|
      if @student.update(validate_params)
        # format.html { redirect_to dojo_student_url, notice: 'Student was successfully updated.' }
        format.html { redirect_to dojo_student_path(@student), notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end


  # ======================
  # DELETE /student/1
  # DELETE /student/1.json
  # ======================
  def destroy
    Student.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to `/dojo/#{params[:dojo_id]}`, notice: 'Student was successfully deleted.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Sanatizing/Validating Parameters...
    def validate_params
      params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
    end
end
