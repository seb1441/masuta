class LessonsController < ApplicationController
  include Pagy::Backend

  before_action :authenticate_user!
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  before_action :set_admin_area, only: [:show, :edit, :index]
  before_action :set_columns

  # GET /lessons
  # GET /lessons.json
  def index
    @lessons = Lesson.joins(:category, :chapter, :level)

    # @query = session[:query]
    @order_by = permitted_column_name(session[:order_by])
    @direction = permitted_direction(session[:direction])
    @page = (session[:page] || 1).to_i

    # lessons = Lesson.includes(:category, :chapter, :level).order(@order_by => @direction)
    # lessons = lessons.search(@query) if @query.present?
    # pages = (lessons.count / Pagy::VARS[:items].to_f).ceil

    # @page = 1 if @page > pages
    # @pagy, @lessons = pagy(lessons, page: @page)

    @lessons = filter(@lessons)

    @pagy, @lessons = pagy(@lessons, page: @page)
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
  end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
  end

  # GET /lessons/1/edit
  def edit
  end

  # POST /lessons
  # POST /lessons.json
  def create
    @lesson = Lesson.new(lesson_params)

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to @lesson, notice: 'Lesson was successfully created.' }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1
  # PATCH/PUT /lessons/1.json
  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to @lesson, notice: 'Lesson was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to lessons_url, notice: 'Lesson was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def lesson_params
      params.require(:lesson).permit(:title, :description, :category_id, :level_id, :chapter_id, :content)
    end

  def permitted_column_name(column_name)
    %w[title].find { |permitted| column_name == permitted } || "title"
  end

  def permitted_direction(direction)
    %w[asc desc].find { |permitted| direction == permitted } || "asc"
  end

  def set_columns
    # name, title, sortable, filterable, choices, type, editable, hash_dig, style
    @columns = [
      {name: "title", sortable: true, filterable: true},
      # {title: "Category", name: "title", sortable: true, filterable: true, table: "categories"},
      {title: "Category", name: "category_id", sortable: true, filterable: true, editable: true, choices: Category.pluck(:title, :id), type: "belongs_to"},
      {title: "Chapter", name: "chapter_id", sortable: true, filterable: true, editable: true, choices: Chapter.pluck(:title, :id), type: "belongs_to"},
      {title: "Level", name: "level_id", sortable: true, filterable: true, editable: true, choices: Level.pluck(:title, :id), type: "belongs_to"}
    ]

    @columns = @columns.map {|c| JSON.parse(c.to_json, object_class: OpenStruct)}
  end
end
