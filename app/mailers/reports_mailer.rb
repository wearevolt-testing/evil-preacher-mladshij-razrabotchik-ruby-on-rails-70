class ReportsMailer < ApplicationMailer
  def report_by_author(start_day, end_day, email)
    @users = User.order("0.1*(posts_count + comments_count)").joins(:posts, :comments).uniq
    mail(to: email, subject: "Your report created")
  end
end
