class ColumnController < ApplicationController
  def new
    project_id = params[:project_id]
    @column = Column.new(project_id: project_id)
  end

  def create
    project_id = params[:project_id]
    column = Column.new(column_params)
    column.project_id = project_id
    if column.save
      redirect_to "/project/#{project_id}"
    else
      render 'new'
    end
  end

  def edit
    column_id = params[:column_id]
    @column = Column.find(column_id)
  end

  def update
    title = params[:title]
    column_id = params[:column_id]

    column = Column.find(column_id)
    column.title = title

    if column.save
      redirect_to "/project/#{column.project_id}"
    else
      render 'edit'
    end
  end

  def destroy
    column_id = params[:column_id]
    column = Column.find(column_id)
    
    if column.destroy
      redirect_to "/project/#{column.project_id}"
    else
      render 'edit'
    end
  end
end

private
  def column_params
    params.require(:column).permit(:title)
  end