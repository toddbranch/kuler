class ShareMailer < ActionMailer::Base
  default from: "from@example.com"

  def share_email(palette, email, host_with_port)
    @palette = palette
    @slug_url = generate_full_url palette, host_with_port
    mail(to: email, subject: "Check out #{palette.name}")
  end

  private

  def generate_full_url(palette, host_with_port)
    return "http://#{host_with_port}/palettes/#{palette.slug}"
  end
end
