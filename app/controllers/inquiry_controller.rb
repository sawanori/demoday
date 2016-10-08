class InquiryController < ApplicationController
  def index
    if params[:back]
     @inquiry = Inquiry.new(params[:inquiry])
    else
     @inquiry = Inquiry.new
    end


  end
  def confirm
    @inquiry = Inquiry.new(params[:inquiry])
    if @inquiry.valid?
      render:action=>'confirm'
    else
      render:action=>'index'
    end
  end
  def thanks
    @inquiry = Inquiry.new(params[:inquiry])
    InquiryMailer.received_email(@inquiry).deliver
    render:action=>'thanks'
  end
end
