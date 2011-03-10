module ActivitiesHelper

  def activities_list
    activities = Activity.all
    
    output = []
    output << '<ul class="activity_log">'

    activities.each do |activity|
      output << "<li class='activity'>#{activity.logable.class.name} #{activity.action} #{distance_of_time_in_words(activity.created_at.to_s, Time.now)} ago</li>"
    end

    output << "</ul>"

    raw(output.join())
  end
end
