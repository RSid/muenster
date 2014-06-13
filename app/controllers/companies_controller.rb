class CompaniesController < ApplicationController
  def index
    binding.pry
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
  end

  def create
    @company =  Company.new(company_params)

    if @company.save
     redirect_to company_path(@company)
    else
      render :new
    end
  end

  def new
    @company = Company.new()
  end

  def edit
    @company = Company.find(params[:id])

  end

  def update

    @company =  Company.find(params[:id])
    binding.pry
    if @company.update(company_params)
     redirect_to company_path(@company)
    else
      render :edit
    end

  end

  private

  def company_params
    params.require(:company).permit(:name,:location,:description)
  end

end
