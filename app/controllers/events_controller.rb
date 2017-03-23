class EventsController < ApplicationController

  def eventshome
    @events = Event.where(state: session[:user_state])
    @all_events = Event.all
    puts "***********************"
  end

  def create_event
    event = Event.create(name: params[:name], date: params[:date], city: params[:city], state: params[:state], user_id: session[:user_id])
    if event.valid?
      redirect_to "/events/" + session[:user_id].to_s
    else
      flash[:errors] = event.errors.full_messages
      redirect_to "/events/" + session[:user_id].to_s
    end
  end

  def preview_event
    @event = Event.where(id: params[:id])
  end

  def add_comment
    if session[:user_id]
      Comment.create(content: params[:content], user_id: session[:user_id], event_id: params[:id])
      redirect_to "/event/" + params[:id].to_s
    else
      flash:errors["Please sign in or create an account to post a comment"]
      redirect_to "/event/" + params[:id].to_s
    end
  end

  def rsvp_join
    Rsvp.create(attendee_id: session[:user_id], event_id: params[:id])
    redirect_to "/events/" + params[:id].to_s
  end

  def rsvp_cancel
    @rsvp = Rsvp.find_by(attendee_id: session[:user_id], event_id: params[:id])
    @rsvp.destroy
    redirect_to "/events/" + params[:id].to_s
  end

  def delete_event
    event = Event.find_by(id: params[:id])
    event.destroy
    redirect_to "/events/" + params[:id].to_s
  end

  def update_event
    puts "%%%%%%%%%%%%%%%%%%%"*100
    puts "%%%%%%%%%%%%%%%%%%%"
    @event = Event.find_by(id: params[:id])
    puts "#{@events.inspect}"
    render "update_event_get"
  end

  def patch_update_event
    Event.update(params[:id], name: params[:name], date: params[:date], city: params[:city], state: params[:state], user_id: session[:user_id])
    redirect_to "/events/" + params[:id].to_s
  end

end
