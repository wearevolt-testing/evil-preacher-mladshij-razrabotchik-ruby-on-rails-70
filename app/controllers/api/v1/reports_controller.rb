class Api::V1::ReportsController < Api::V1::BaseController

  def by_author
    start_day = params[:start_day]
    end_day   = params[:end_day]
    email     = params[:email]

    begin
      if start_day && end_day && email
        start_day = Date.parse(start_day)
        end_day   = Date.parse(end_day)
        render json: {  message: "Report generation started. From #{start_day} to #{end_day} on email #{email}" }

        ReportsMailer.report_by_author(start_day, end_day, email).deliver_now
      else
        render json: { message: 'Not enough data for report generating' }, status: :unprocessable_entity
      end
    rescue ArgumentError
      render json: { message: "Date incorrect" }, status: :unprocessable_entity
    end
  end
end
