module ApplicationHelper
  def active_link(page)
    'active' if controller_name == page
  end

  def status_message(environment)
    if booking = environment.bookings.current
      user = tag.strong(booking.user.email)
      mins = tag.strong(pluralize(booking.duration, 'minute'))
      time = tag.strong(booking.until.strftime('%F %T'))

      "Booked by #{user} for #{mins} until #{time}".html_safe
    else
      'Free'
    end
  end

  def environment_title(environment)
    if environment.bookings.in_progress.count > 1
      booking = environment.bookings.in_progress.last

      "#{environment.name} - full free after #{booking.until.strftime('%F %T')}"
    end
  end
end
