class Sources::BuildController < ApplicationController
  include Wicked::Wizard

  steps :add_details, :add_children, :add_schedule

  def show
    @source = Source.find(params[:source_id])
    render_wizard
  end

  def update
    @source = Source.find(params[:source_id])
    @source.update_attributes(params[:source])
    render_wizard @source
  end
end
