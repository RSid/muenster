class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def create
    @company =  Company.new(
      params.require(:company)
      .permit(:name,:location,:description))

    if @company.save
     redirect_to company_path(@company)
    else
      render :new
    end
  end

  def new
    @company = Company.new()
  end

end
